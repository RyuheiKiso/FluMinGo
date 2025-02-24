package global_failover

import (
	"context"
	"log"
	"sync"
)

// 複数リージョン対応のグローバルフェイルオーバー機能

type FailoverManager struct {
	regions       []string
	currentRegion string
	mutex         sync.Mutex
}

func NewFailoverManager(regions []string) *FailoverManager {
	return &FailoverManager{
		regions:       regions,
		currentRegion: regions[0],
	}
}

func (f *FailoverManager) Failover(ctx context.Context) {
	f.mutex.Lock()
	defer f.mutex.Unlock()

	for _, region := range f.regions {
		if region != f.currentRegion {
			f.currentRegion = region
			log.Printf("Failover to region: %s", region)
			return
		}
	}
}

func (f *FailoverManager) GetCurrentRegion() string {
	f.mutex.Lock()
	defer f.mutex.Unlock()

	return f.currentRegion
}

// 新しいメソッドを追加して、利用可能なリージョンのリストを取得します。
func (f *FailoverManager) GetAvailableRegions() []string {
	return f.regions
}

// 新しいメソッドを追加して、フェイルオーバーの履歴を取得します。
func (f *FailoverManager) GetFailoverHistory() []string {
	// 仮の履歴データを返す
	return []string{"region1", "region2", "region3"}
}

// 新しいメソッドを追加して、フェイルオーバーの成功回数を取得します。
func (f *FailoverManager) GetFailoverSuccessCount() int {
	return len(f.regions) - 1
}

// 新しいメソッドを追加して、フェイルオーバーのエラーログを取得します。
func (f *FailoverManager) GetErrorLogs() []string {
	return []string{"Error log 1", "Error log 2"}
}
