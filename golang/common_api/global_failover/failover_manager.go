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
