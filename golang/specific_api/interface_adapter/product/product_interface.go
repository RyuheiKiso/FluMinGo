// Package product provides the interface definitions for Product API
// 商品APIのインターフェース定義を提供するパッケージです
package product

// ProductAPIは商品に関する操作を定義したインターフェースです
//
// GetProductは指定された商品IDに対応する商品情報を取得します
//   id: 商品の識別子
//   戻り値: 商品情報（文字列）とエラー
//
// CreateProductは新規商品を作成します
//   name: 商品名
//   price: 商品の価格
//   戻り値: 作成された商品のIDとエラー

type ProductAPI interface {
	// GetProductは商品情報を取得するメソッドです
	GetProduct(id int) (string, error) // 商品IDに基づく商品情報取得

	// CreateProductは新規商品を作成するメソッドです
	CreateProduct(name string, price float64) (int, error) // 商品名と価格から商品を作成
}
