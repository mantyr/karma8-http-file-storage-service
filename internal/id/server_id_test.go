package id

import (
	"testing"

	. "github.com/smartystreets/goconvey/convey"
)

func TestServerID(t *testing.T) {
	Convey("Проверяем ServerID", t, func() {
		Convey("IsZero", func() {
			So(ServerID{}.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			So(ServerID{}.IsZero(), ShouldEqual, true)
		})
		Convey("Generate", func() {
			id, err := GenerateServerID()
			So(err, ShouldBeNil)
			So(id.String(), ShouldNotEqual, "00000000-0000-0000-0000-000000000000")
			So(id.IsZero(), ShouldEqual, false)
			Convey("Parse", func() {
				id2, err := ParseServerID(id.String())
				So(err, ShouldBeNil)
				So(id2.IsZero(), ShouldEqual, false)
				So(id2.String(), ShouldEqual, id.String())
			})
		})
		Convey("Parse", func() {
			Convey("00000000-0000-0000-0000-000000000000", func() {
				ServerID, err := ParseServerID("00000000-0000-0000-0000-000000000000")
				So(err, ShouldBeNil)
				So(ServerID.IsZero(), ShouldEqual, true)
				So(ServerID.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			})
			Convey("Zero", func() {
				ServerID, err := ParseServerID("")
				So(err, ShouldBeNil)
				So(ServerID.IsZero(), ShouldEqual, true)
				So(ServerID.String(), ShouldEqual, "00000000-0000-0000-0000-000000000000")
			})
			Convey("Errors", func() {
				ServerID, err := ParseServerID("t??Pkefvklj*&YHdest")
				So(err, ShouldNotBeNil)
				So(err.Error(), ShouldEqual, "invalid UUID length: 19")
				So(ServerID.IsZero(), ShouldEqual, true)
			})
		})
	})
}
