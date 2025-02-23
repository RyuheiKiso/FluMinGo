// Package db provides the database interface and utilities.
package db

// DBConnector defines the contract for a database connection.
// It allows connecting, querying, and executing commands.

type DBConnector interface {
	Connect(connectionString string) error
	Query(query string, args ...interface{}) (Rows, error)
	Exec(query string, args ...interface{}) (Result, error)
	// トランザクション管理機能を追加
	Begin() (Transaction, error)
}

// Rows represents the result set from a query.
// It is satisfied by types that support iteration over rows.

type Rows interface {
	Next() bool
	Scan(dest ...interface{}) error
	Close() error
}

// Result represents the outcome of an execution.
// It provides details such as last insert ID and rows affected.

type Result interface {
	LastInsertId() (int64, error)
	RowsAffected() (int64, error)
}

// Transaction はトランザクションを管理するインターフェースです。
type Transaction interface {
	Commit() error
	Rollback() error
}
