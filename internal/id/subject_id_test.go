package id

import (
	"testing"

	. "github.com/smartystreets/goconvey/convey"
)

func TestSubjectID(t *testing.T) {
	Convey("Проверяем SubjectID", t, func() {
		Convey("IsZero", func() {
			So(SubjectID{}.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			So(SubjectID{}.IsZero(), ShouldEqual, true)
		})
		Convey("Generate", func() {
			id, err := GenerateSubjectID()
			So(err, ShouldBeNil)
			So(id.String(), ShouldNotEqual, "00000000-0000-0000-0000-000000000000")
			So(id.IsZero(), ShouldEqual, false)
			Convey("Parse", func() {
				id2, err := ParseSubjectID(id.String())
				So(err, ShouldBeNil)
				So(id2.IsZero(), ShouldEqual, false)
				So(id2.String(), ShouldEqual, id.String())
			})
		})
		Convey("Parse", func() {
			Convey("00000000-0000-0000-0000-000000000000", func() {
				SubjectID, err := ParseSubjectID("00000000-0000-0000-0000-000000000000")
				So(err, ShouldBeNil)
				So(SubjectID.IsZero(), ShouldEqual, true)
				So(SubjectID.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			})
			Convey("Zero", func() {
				SubjectID, err := ParseSubjectID("")
				So(err, ShouldBeNil)
				So(SubjectID.IsZero(), ShouldEqual, true)
				So(SubjectID.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			})
		})
	})
}
