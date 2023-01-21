package raid0

import (
	"io"
)

type writer struct {
	items []io.Writer
	pointer int
}

func NewWriter(items ...io.Writer) io.Writer {
	return &writer{
		items: items,
	}
}

func (w *writer) next() io.Writer {
	if w.pointer >= len(w.items) {
		w.pointer = 0
	}
	p := w.items[w.pointer]
	w.pointer++
	return p
}

func (w *writer) Write(p []byte) (n int, err error) {
	for _, b := range p {
		_, err = w.next().Write([]byte{b})
		if err != nil {
			return
		}
		n++
	}
	return len(p), nil
}
