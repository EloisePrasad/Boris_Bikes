# Boris Bikes Log

## Challenge 10

* [X] Feature-test the feature you are building using irb

2.6.3 :002 > require "./bike.rb"
 => true 
2.6.3 :003 > require "./docking_station.rb"
 => true 
2.6.3 :004 > station = DockingStation.new
 => #<DockingStation:0x00007fea798afd20> 
2.6.3 :005 > bike = station.release_bike
 => nil 
2.6.3 :006 > bike.working?
Traceback (most recent call last):
        4: from /Users/student/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
        3: from /Users/student/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
        2: from /Users/student/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):6
NoMethodError (undefined method `working?' for nil:NilClass)

* [X] Explain the error to your pair partner

w

* [ ]Add a test to your DockingStation specification that a) gets a bike, and then b) expects the bike to be working
* [ ]Make this test pass
* [ ]Feature-test the feature again.
