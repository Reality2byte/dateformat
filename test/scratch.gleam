import birl
import birl/duration
import dateformat
import gleam/io
import gleam/list
import gleam/result

@internal
pub fn main() {
  io.println("Hello from dateformat!")
  // echo format(
  //   //"YYYY YY Q Qo W Wo WW E Do-Mo-yyyy [dd-MM-yyyy] DDDo",
  //   "A a H HH h hh k kk m mm s ss S SS SSS z zz Z ZZ X x",
  //   birl.now(),
  // )
  list.range(-12, 12)
  |> list.each(fn(i) {
    let dt = birl.add(birl.now(), duration.hours(i))

    echo birl.to_iso8601(dt)
      <> " "
      <> dateformat.format(
        //"YYYY YY Q Qo W Wo WW E Do-Mo-yyyy [dd-MM-yyyy] DDDo",
        "A a H HH h hh k kk m mm s ss S SS SSS Z ZZ zz X x",
        dt,
      )
      |> result.unwrap("")
  })
  birl.parse("20120214T15:30:17.123+00:00")
  |> result.unwrap(birl.now())
  |> birl.get_offset
  |> echo
  birl.from_unix_milli(1_234_567_890_123)
  |> birl.to_iso8601
  |> echo

  let t = birl.from_unix_milli(1_234_567_890_123)

  dateformat.format("DD-MMM-YYYY HH:mm", t) |> echo
}
