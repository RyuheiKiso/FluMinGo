package entities

// RegistrationRepository defines the interface for registration repository
type RegistrationRepository interface {
	Save(registration Registration) error
	FindById(id string) (*Registration, error)
	FindAll() ([]Registration, error)
	Delete(id string) error
}
