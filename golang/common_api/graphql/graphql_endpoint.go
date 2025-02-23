package graphql

import (
	"encoding/json"
	"net/http"

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

	// クエリのパース
	result := graphql.Do(graphql.Params{
		Schema:        schema,
		RequestString: r.URL.Query().Get("query"),
	})

	// 結果の返却
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(result)
}
