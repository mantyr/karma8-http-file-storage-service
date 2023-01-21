package id

import (
	"testing"

	. "github.com/smartystreets/goconvey/convey"
)

func TestFileID(t *testing.T) {
	Convey("Проверяем FileID", t, func() {
		Convey("IsZero", func() {
			So(FileID{}.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			So(FileID{}.IsZero(), ShouldEqual, true)
		})
		Convey("Generate", func() {
			id, err := GenerateFileID()
			So(err, ShouldBeNil)
			So(id.String(), ShouldNotEqual, "00000000-0000-0000-0000-000000000000")
			So(id.IsZero(), ShouldEqual, false)
			Convey("Parse", func() {
				id2, err := ParseFileID(id.String())
				So(err, ShouldBeNil)
				So(id2.IsZero(), ShouldEqual, false)
				So(id2.String(), ShouldEqual, id.String())
			})
		})
		Convey("Parse FileID", func() {
			Convey("00000000-0000-0000-0000-000000000000", func() {
				FileID, err := ParseFileID("00000000-0000-0000-0000-000000000000")
				So(err, ShouldBeNil)
				So(FileID.IsZero(), ShouldEqual, true)
				So(FileID.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			})
			Convey("Check Zero", func() {
				FileID, err := ParseFileID("")
				So(err, ShouldBeNil)
				So(FileID.IsZero(), ShouldEqual, true)
				So(FileID.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			})
		})
	})
}
