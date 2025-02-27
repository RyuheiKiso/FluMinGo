package entities

// UserRepository defines the interface for user repository
type UserRepository interface {
	Save(user User) error
	FindById(id string) (*User, error)
	FindAll() ([]User, error)
	Delete(id string) error
}
