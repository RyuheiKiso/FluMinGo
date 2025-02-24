package session_management

// セッション管理と状態共有の実装

import "sync"

// Session はセッションの構造体です。
type Session struct {
	ID     string
	Values map[string]interface{}
}

// SessionManager はセッションを管理する構造体です。
type SessionManager struct {
	sessions map[string]Session
	mutex    sync.RWMutex
}

// NewSessionManager は新しいSessionManagerを作成します。
func NewSessionManager() *SessionManager {
	return &SessionManager{
		sessions: make(map[string]Session),
	}
}

// CreateSession は新しいセッションを作成します。
func (sm *SessionManager) CreateSession(id string) Session {
	sm.mutex.Lock()
	defer sm.mutex.Unlock()
	session := Session{ID: id, Values: make(map[string]interface{})}
	sm.sessions[id] = session
	return session
}

// GetSession はセッションを取得します。
func (sm *SessionManager) GetSession(id string) (Session, bool) {
	sm.mutex.RLock()
	defer sm.mutex.RUnlock()
	session, exists := sm.sessions[id]
	return session, exists
}

// DeleteSession はセッションを削除します。
func (sm *SessionManager) DeleteSession(id string) {
	sm.mutex.Lock()
	defer sm.mutex.Unlock()
	delete(sm.sessions, id)
}

// SetValue はセッションに値を設定します。
func (sm *SessionManager) SetValue(id string, key string, value interface{}) bool {
	sm.mutex.Lock()
	defer sm.mutex.Unlock()
	session, exists := sm.sessions[id]
	if !exists {
		return false
	}
	session.Values[key] = value
	sm.sessions[id] = session
	return true
}

// GetValue はセッションから値を取得します。
func (sm *SessionManager) GetValue(id string, key string) (interface{}, bool) {
	sm.mutex.RLock()
	defer sm.mutex.RUnlock()
	session, exists := sm.sessions[id]
	if !exists {
		return nil, false
	}
	value, exists := session.Values[key]
	return value, exists
}

// ListSessions はすべてのセッションをリストするメソッドです。
func (sm *SessionManager) ListSessions() []Session {
	sm.mutex.RLock()
	defer sm.mutex.RUnlock()
	sessions := make([]Session, 0, len(sm.sessions))
	for _, session := range sm.sessions {
		sessions = append(sessions, session)
	}
	return sessions
}
