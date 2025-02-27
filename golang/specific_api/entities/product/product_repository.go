package entities

// ProductRepository defines the interface for product repository
type ProductRepository interface {
	Save(product Product) error
	FindById(id string) (*Product, error)
	FindAll() ([]Product, error)
	Delete(id string) error
}
