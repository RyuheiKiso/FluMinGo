package gateway

import (
	"errors"
	"net/http"
)

// CheckAuthorization verifies if the incoming HTTP request contains valid authorization credentials.
// For demonstration, it simply checks for the presence of the "Authorization" header.
func CheckAuthorization(r *http.Request) error {
	if r.Header.Get("Authorization") == "" {
		return errors.New("missing authorization header")
	}
	// ...additional authorization logic can be implemented here...
	return nil
}
