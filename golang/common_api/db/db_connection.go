package db

import (
	"database/sql"

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
	db, err := sql.Open("postgres", connectionString)
	if err != nil {
		return err
	}
	conn.DB = db
	return nil
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
