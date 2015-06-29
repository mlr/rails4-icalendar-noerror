#!/usr/bin/env ruby

require 'icalendar'
require ::File.expand_path('../config/environment',  __FILE__)

calendar = Icalendar::Calendar.new

calendar.timezone do |t|
  t.tzid = "America/Chicago"

  t.daylight do |d|
    d.tzoffsetfrom = "-0600"
    d.tzoffsetto   = "-0500"
    d.tzname       = "CDT"
    d.dtstart      = "19700308T020000"
    d.rrule        = "FREQ=YEARLY;BYMONTH=3;BYDAY=2SU"
  end

  t.standard do |s|
    s.tzoffsetfrom = "-0500"
    s.tzoffsetto   = "-0600"
    s.tzname       = "CST"
    s.dtstart      = "19701101T020000"
    s.rrule        = "FREQ=YEARLY;BYMONTH=11;BYDAY=1SU"
  end
end

puts calendar.to_ical
