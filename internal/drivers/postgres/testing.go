package postgres

import (
	"sync"
)

var testMutex sync.Mutex
var testStorage *Storage

func GetTestStorage() (*Storage, error) {
	testMutex.Lock()
	defer testMutex.Unlock()
	if testStorage != nil {
		return testStorage, nil
	}
	conf, err := NewTestConfig()
	if err != nil {
		return nil, err
	}
	st, err := New(conf)
	if err != nil {
		return nil, err
	}
	testStorage = st
	return st, nil
}
