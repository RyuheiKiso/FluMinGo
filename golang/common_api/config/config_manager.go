package config

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"sync"

	"github.com/fsnotify/fsnotify"
)

// Config 設定ファイルの構造体。必要に応じてフィールドを追加してください。
type Config struct {
	AppName       string `json:"app_name"`
	Port          int    `json:"port"`
	CacheTTL      int    `json:"cache_ttl"`      // キャッシュの有効期限を追加
	EncryptionKey string `json:"encryption_key"` // 暗号化キーを追加
}

// Manager コンフィグ管理用のシングルトン
var (
	manager *Manager
	once    sync.Once
)

// Manager はコンフィグの読み込みと監視を行う
type Manager struct {
	config   *Config
	filePath string
	mutex    sync.RWMutex
	watcher  *fsnotify.Watcher
}

// GetManager Managerのインスタンスを取得する
func GetManager(filePath string) *Manager {
	once.Do(func() {
		manager = &Manager{filePath: filePath}
		manager.loadConfig()
		manager.watchConfig()
	})
	return manager
}

// loadConfig 設定ファイルを読み込み、コンフィグを更新する
func (m *Manager) loadConfig() {
	m.mutex.Lock()
	defer m.mutex.Unlock()

	file, err := os.Open(m.filePath)
	if err != nil {
		log.Printf("設定ファイルのオープンに失敗: %v", err)
		return
	}
	defer file.Close()

	data, err := ioutil.ReadAll(file)
	if err != nil {
		log.Printf("設定ファイルの読み込みに失敗: %v", err)
		return
	}

	var cfg Config
	err = json.Unmarshal(data, &cfg)
	if err != nil {
		log.Printf("設定ファイルのパースに失敗: %v", err)
		return
	}

	m.config = &cfg
	log.Printf("設定が更新されました: %+v", m.config)
}

// GetConfig 現在の設定を取得する
func (m *Manager) GetConfig() *Config {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	return m.config
}

// watchConfig 設定ファイルの変更を監視し、変更があれば再読み込みする
func (m *Manager) watchConfig() {
	var err error
	m.watcher, err = fsnotify.NewWatcher()
	if err != nil {
		log.Printf("ウォッチャーの作成に失敗: %v", err)
		return
	}

	err = m.watcher.Add(m.filePath)
	if err != nil {
		log.Printf("設定ファイルの監視に失敗: %v", err)
		return
	}

	go func() {
		for {
			select {
			case event, ok := <-m.watcher.Events:
				if !ok {
					return
				}
				if event.Op&fsnotify.Write == fsnotify.Write {
					log.Println("設定ファイルが変更されました。再読み込みします...")
					m.loadConfig()
				}
			case err, ok := <-m.watcher.Errors:
				if !ok {
					return
				}
				log.Printf("ウォッチ中のエラー: %v", err)
			}
		}
	}()
}

// ReloadConfig は設定ファイルを手動でリロードします。
func (m *Manager) ReloadConfig() {
	log.Println("設定ファイルを手動でリロードします...")
	m.loadConfig()
}

// 設定のバリデーション機能を追加
func (m *Manager) ValidateConfig() error {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	if m.config.AppName == "" || m.config.Port <= 0 {
		return fmt.Errorf("無効な設定: %+v", m.config)
	}
	return nil
}

// 設定のバックアップ機能を追加
func (m *Manager) BackupConfig(backupFilePath string) error {
	m.mutex.RLock()
	defer m.mutex.RUnlock()

	data, err := json.Marshal(m.config)
	if err != nil {
		return err
	}

	return ioutil.WriteFile(backupFilePath, data, 0644)
}
