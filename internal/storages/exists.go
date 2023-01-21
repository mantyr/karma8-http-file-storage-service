package storages

// Exists это ошибка означает что объект уже существует
type Exists struct {
	err error
}

// CheckExists проверяет ошибку на тип Exists
func CheckExists(err error) bool {
	switch err.(type) {
	case Exists:
		return true
	}
	return false
}

// NewExists возвращает новую ошибку Exists
func NewExists(err error) error {
	return Exists{
		err: err,
	}
}

// Error это реализация интерфейса errors
func (e Exists) Error() string {
	if e.err == nil {
		return "empty error"
	}
	return e.err.Error()
}
