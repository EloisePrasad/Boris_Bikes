# Boris Bikes Log

## Challenge 10

* [X] Feature-test the feature you are building using irb

    ```
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
    ```
* [X] Explain the error to your pair partner

    This failure is happening because `station.release_bike` returns `nil` instead of an instance of the `Bike` class. You have to   alter the `DockingStation` class so `release_bike` returns a new instance of the `Bike` class.



* [X] Add a test to your DockingStation specification that a) gets a bike, and then b) expects the bike to be working

   ```
     it 'releases working bikes' do
       bike = subject.release_bike         -- (gets bike)
       expect(bike.working?).to be(true) # expect(bike).to be_working     --(expects bike to be working but recieving true value)
     end
     ```
  
     `be_working` - refers to the `.working?` method in the `Bike` class and checks if the return value is `true`
  
  * [X] Make this test pass
  
     ```
     DockingStation releases working bikes
        Failure/Error: expect(bike).to be_working
          expected nil to respond to `working?`
     ```
     --- `release_bike` is returning `nil` as there is nothing inside the method, then we are trying to run the `.working` method on `nil`
     So, `release_bike` method needs to return an instance of `Bike`. (`.working?` method is still blank)

     ```
     class DockingStation
      def release_bike
        bike = Bike.new
      end
     end
    ```
  
  
  
  
     ```
     DockingStation releases working bikes
        Failure/Error: expect(bike).to be_working
          expected `#<Bike:0x00007fdb84119f10>.working?` to return true, got nil
     ```
     --- expecting the `.working?` method on bike to return `true`, it is returning `nil` as there is nothing in the `.working?` method

     The bare minimum to make the test pass is to return `true` inside the `.working?` method

     ```
     class Bike
      def working?
        true
      end
    end
 ```
  
* [X] Feature-test the feature again.

   ```
   2.6.3 :002 > require "./docking_station.rb"
    => true 
   2.6.3 :003 > station = DockingStation.new
    => #<DockingStation:0x00007fdcec81df78> 
   2.6.3 :004 > bike = station.release_bike
    => #<Bike:0x00007fdcec833080> 
   2.6.3 :005 > bike.working?
    => true 
    ```
