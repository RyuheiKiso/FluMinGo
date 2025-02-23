package db

import (
	"database/sql"
	"time"

	_ "github.com/lib/pq"
)

// SQLDBConnector is a concrete implementation of DBConnector using a SQL database.
type SQLDBConnector struct {
	DB *sql.DB
}

// NewSQLDBConnector creates a new SQLDBConnector instance.
func NewSQLDBConnector() *SQLDBConnector {
	return &SQLDBConnector{}
}

// Connect establishes a connection to the database using the provided connection string.
func (conn *SQLDBConnector) Connect(connectionString string) error {
	var err error
	for i := 0; i < 3; i++ {
		conn.DB, err = sql.Open("postgres", connectionString)
		if err == nil {
			break
		}
		time.Sleep(time.Second * 2)
	}
	return err
}

// 接続のリトライ機能を強化
func (conn *SQLDBConnector) ConnectWithRetry(connectionString string, attempts int, delay time.Duration) error {
	var err error
	for i := 0; i < attempts; i++ {
		err = conn.Connect(connectionString)
		if err == nil {
			return nil
		}
		time.Sleep(delay)
	}
	return err
}

// Query executes a query that returns rows, typically a SELECT.
func (conn *SQLDBConnector) Query(query string, args ...interface{}) (Rows, error) {
	rows, err := conn.DB.Query(query, args...)
	if err != nil {
		return nil, err
	}
	return rows, nil
}

// クエリの実行時間を計測する機能を追加
func (conn *SQLDBConnector) TimedQuery(query string, args ...interface{}) (Rows, time.Duration, error) {
	start := time.Now()
	rows, err := conn.Query(query, args...)
	duration := time.Since(start)
	return rows, duration, err
}

// Exec executes a query without returning any rows. For example: an INSERT or UPDATE.
func (conn *SQLDBConnector) Exec(query string, args ...interface{}) (Result, error) {
	res, err := conn.DB.Exec(query, args...)
	if err != nil {
		return nil, err
	}
	return res, nil
}

// Begin starts a new transaction.
func (conn *SQLDBConnector) Begin() (Transaction, error) {
	tx, err := conn.DB.Begin()
	if err != nil {
		return nil, err
	}
	return &SQLTransaction{tx}, nil
}

// SQLTransaction is a concrete implementation of Transaction using a SQL database transaction.
type SQLTransaction struct {
	Tx *sql.Tx
}

// Commit commits the transaction.
func (tx *SQLTransaction) Commit() error {
	return tx.Tx.Commit()
}

// Rollback rolls back the transaction.
func (tx *SQLTransaction) Rollback() error {
	return tx.Tx.Rollback()
}

// トランザクションの状態を確認する機能を追加
func (tx *SQLTransaction) IsCommitted() bool {
	// 実際の実装はトランザクションの状態を追跡する必要があります
	return false
}

func (tx *SQLTransaction) IsRolledBack() bool {
	// 実際の実装はトランザクションの状態を追跡する必要があります
	return false
}
