package db

import (
	"fmt"
	"strings"
)

// DBQueries provides common database query management functions.
type DBQueries struct{}

// NewDBQueries creates a new DBQueries instance.
func NewDBQueries() *DBQueries {
	return &DBQueries{}
}

// SelectQuery constructs a SELECT SQL query for the given table and columns.
func (q *DBQueries) SelectQuery(table string, columns []string) string {
	cols := "*"
	if len(columns) > 0 {
		cols = strings.Join(columns, ", ")
	}
	return fmt.Sprintf("SELECT %s FROM %s", cols, table)
}
