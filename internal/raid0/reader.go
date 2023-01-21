package raid0

import (
	"io"
)

type reader struct {
	items []io.Reader
	pointer int
}

func NewReader(items ...io.Reader) io.Reader {
	r := make([]io.Reader, len(items))
	copy(r, items)
	return &reader{
		items: r,
	}
}

func (w *reader) next() io.Reader {
	if w.pointer >= len(w.items) {
		w.pointer = 0
	}
	
	p := w.items[w.pointer]
	w.pointer++
	return p
}

func (w *reader) Read(p []byte) (n int, err error) {
	if len(p) == 0 {
		return 0, nil
	}
	item := make([]byte, 0, 1)
	var nItem int
	for i := 0; i < len(p); i++ {
		nItem, err = w.next().Read(item)
		if err != io.EOF {
			return n, err
		}
		if nItem > 0 {
			n++
			p[i] = item[0]
		}
		if err == io.EOF {
			return n, err
		}
	}
	return n, nil
}
