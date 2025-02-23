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

// Query executes a query that returns rows, typically a SELECT.
func (conn *SQLDBConnector) Query(query string, args ...interface{}) (Rows, error) {
	rows, err := conn.DB.Query(query, args...)
	if err != nil {
		return nil, err
	}
	return rows, nil
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
