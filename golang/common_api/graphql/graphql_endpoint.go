package graphql

import (
	"encoding/json"
	"net/http"
	"time"

	"github.com/graphql-go/graphql"
)

// GraphQLエンドポイントによる柔軟なデータ取得
func GraphQLEndpoint(w http.ResponseWriter, r *http.Request) {
	// スキーマの定義
	schema, _ := graphql.NewSchema(graphql.SchemaConfig{
		Query: graphql.NewObject(graphql.ObjectConfig{
			Name: "RootQuery",
			Fields: graphql.Fields{
				"hello": &graphql.Field{
					Type: graphql.String,
					Resolve: func(p graphql.ResolveParams) (interface{}, error) {
						return "world", nil
					},
				},
			},
		}),
	})

	// 新しいフィールドを追加して、GraphQLスキーマにバージョン情報を追加します。
	addVersionField(&schema)

	// 新しいフィールドを追加して、GraphQLスキーマにサーバーのステータスを追加します。
	addStatusField(&schema)

	// 新しいフィールドを追加して、GraphQLスキーマにサーバーの稼働時間を追加します。
	addUptimeField(&schema, time.Now())

	// クエリのパース
	result := graphql.Do(graphql.Params{
		Schema:        schema,
		RequestString: r.URL.Query().Get("query"),
	})

	// 結果の返却
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(result)
}

// 新しいフィールドを追加して、GraphQLスキーマにバージョン情報を追加します。
func addVersionField(schema *graphql.Schema) {
	versionField := &graphql.Field{
		Type: graphql.String,
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			return "1.0.0", nil
		},
	}
	schema.QueryType().AddFieldConfig("version", versionField)
}

// 新しいフィールドを追加して、GraphQLスキーマにサーバーのステータスを追加します。
func addStatusField(schema *graphql.Schema) {
	statusField := &graphql.Field{
		Type: graphql.String,
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			return "Server is running", nil
		},
	}
	schema.QueryType().AddFieldConfig("status", statusField)
}

// 新しいフィールドを追加して、GraphQLスキーマにサーバーの稼働時間を追加します。
func addUptimeField(schema *graphql.Schema, startTime time.Time) {
	uptimeField := &graphql.Field{
		Type: graphql.String,
		Resolve: func(p graphql.ResolveParams) (interface{}, error) {
			return time.Since(startTime).String(), nil
		},
	}
	schema.QueryType().AddFieldConfig("uptime", uptimeField)
}
