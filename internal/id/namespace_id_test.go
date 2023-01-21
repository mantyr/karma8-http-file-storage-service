package id

import (
	"testing"

	. "github.com/smartystreets/goconvey/convey"
)

func TestNamespaceID(t *testing.T) {
	Convey("Проверяем NamespaceID", t, func() {
		Convey("IsZero", func() {
			So(NamespaceID{}.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			So(NamespaceID{}.IsZero(), ShouldEqual, true)
		})
		Convey("Generate", func() {
			id, err := GenerateNamespaceID()
			So(err, ShouldBeNil)
			So(id.String(), ShouldNotEqual, "00000000-0000-0000-0000-000000000000")
			So(id.IsZero(), ShouldEqual, false)
			Convey("Parse", func() {
				id2, err := ParseNamespaceID(id.String())
				So(err, ShouldBeNil)
				So(id2.IsZero(), ShouldEqual, false)
				So(id2.String(), ShouldEqual, id.String())
			})
		})
		Convey("Parse NamespaceID", func() {
			Convey("00000000-0000-0000-0000-000000000000", func() {
				NamespaceID, err := ParseNamespaceID("00000000-0000-0000-0000-000000000000")
				So(err, ShouldBeNil)
				So(NamespaceID.IsZero(), ShouldEqual, true)
				So(NamespaceID.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			})
			Convey("Check Zero", func() {
				NamespaceID, err := ParseNamespaceID("")
				So(err, ShouldBeNil)
				So(NamespaceID.IsZero(), ShouldEqual, true)
				So(NamespaceID.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			})
		})
	})
}
