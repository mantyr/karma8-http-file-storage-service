package storages

// NotFound это ошибка означает что объект не найден
type NotFound struct {
	err error
}

// CheckNotFound проверяет ошибку на тип NotFound
func CheckNotFound(err error) bool {
	switch err.(type) {
	case NotFound:
		return true
	}
	return false
}

// NewNotFound возвращает новую ошибку NotFound
func NewNotFound(err error) error {
	return NotFound{
		err: err,
	}
}

// Error это реализация интерфейса errors
func (e NotFound) Error() string {
	if e.err == nil {
		return "empty error"
	}
	return e.err.Error()
}
