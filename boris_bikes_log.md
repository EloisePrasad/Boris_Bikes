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
    
    ## Challenge 11
    
    * [X] Write a feature test for docking a bike at a docking station
    
        ```
        2.6.3 :004 > require './lib/docking_station'
         => true 
        2.6.3 :005 > bike = Bike.new
         => #<Bike:0x00007feb251ad390> 
        2.6.3 :006 > docking_station = DockingStation.new
         => #<DockingStation:0x00007feb251b6cd8> 
        2.6.3 :007 > docking_station.dock(bike)
        ```
        --- This returns a `NoMethodError` as there is no method called `dock`
    
    
    * [X] Write a unit test for the method you need to add to DockingStation to make docking possible
    
        ```
        it 'dock bike at docking station' do
        expect(subject).to respond_to(:dock).with(1).argument
      end
        ```
        ---  We want to make sure that the instance variable responds to `dock` method and takes 1 argument
 
    
    * [X] Pass both tests
    
    ```
      def dock(bike)
  end
  ```
  
  --- This code is added to `DokingStation` class, this makes both test pass. As `dock` method is created and allows 1 argument - as the test specifies.
    
    
    * [ ] Use an instance variable with attr_reader to do a full test-implementation cycle for the second User Story above
        Feature Test
        ```
        2.6.3 :001 > require './lib/docking_station'
         => true 
        2.6.3 :002 > bike = Bike.new
         => #<Bike:0x00007fbdd3829ea0> 
        2.6.3 :003 > docking_station = DockingStation.new
         => #<DockingStation:0x00007fbdd3832b40> 
        2.6.3 :004 > docking_station.dock(bike)
         => nil 
        2.6.3 :006 > docking_station.bike
        Traceback (most recent call last):
                5: from /Users/student/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `<main>'
                4: from /Users/student/.rvm/rubies/ruby-2.6.3/bin/irb:23:in `load'
                3: from /Users/student/.rvm/rubies/ruby-2.6.3/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
                2: from (irb):6
                1: from (irb):6:in `rescue in irb_binding'
        NoMethodError (undefined method `bike' for #<DockingStation:0x00007fbdd3832b40>)
        ```
        Unit Test
        
        ```
          it 'can return the bike that docked' do
            expect(subject). to respond_to(:bike)
          end
        ```
        
        --- Recieved this error message
        ```
        DockingStation can return the bike that docked
        Failure/Error: expect(subject). to respond_to(:bike)
       expected #<DockingStation:0x00007fcd12a273a8> to respond to :bike
        ```
        
        --- Added this code to DockingStation to make the test pass
        ```
        def bike
        end 
        ```
        
        --- Still recieve `nil` in our feature test, as there is nothing inside the `bike` and the `dock` method that we created
    ```
    Makerss-MacBook-Pro:Boris_Bikes student$ irb
    2.6.3 :001 > require './lib/docking_station'
     => true 
    2.6.3 :002 > bike  = Bike.new
     => #<Bike:0x00007fc8b79b0460> 
    2.6.3 :003 > docking_station = DockingStation.new
     => #<DockingStation:0x00007fc8b79c1c60> 
    2.6.3 :004 > docking_station.dock(bike)
     => nil 
    2.6.3 :005 > docking_station.bike
     => nil 
    ```
    
    --- Updating our unit test so they give an better output that we need in our feature test(so that the `dock` and `bike` method no longer return `nil`)
    ```
    it 'dock bike at docking station' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq(bike)
    end
    ```
    --- This means the return of calling `dock` method should be equal to bike, this means the information of the docked bike is stores so that we can recall the bikes that are docked later.
    
    
    --- Error Message
    ```DockingStation dock bike at docking station
     Failure/Error: expect(subject.dock(bike)).to eq(bike)
     
       expected: #<Bike:0x00007f9a64a19590>
            got: nil
    ```
    
    
    --- Our `dock` methos returns `nil` but we want it to return `bike`
    
    --- The smallest amount of code to add to make the test pass - is to return `bike` in the dock method
    ```
      def dock(bike)
    bike
      end
    ```
    --- Unit test passes! But feature test still returns `nil`
    
    ```
    2.6.3 :004 > require './lib/docking_station'
     => true 
    2.6.3 :005 > bike = Bike.new
     => #<Bike:0x00007fe6cd9144a0> 
    2.6.3 :006 > docking_station = DockingStation.new 
     => #<DockingStation:0x00007fe6cd0a12a0> 
    2.6.3 :007 > docking_station.dock(bike)
     => #<Bike:0x00007fe6cd9144a0> 
    2.6.3 :008 > docking_station.bike
     => nil 
    ```
    
    --- This means we need to change the Unit test 
    
    ```
    it 'can return the bike that docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
    end
  ```
  ```
  DockingStation can return the bike that docked
     Failure/Error: expect(subject.bike).to eq(bike)
     
       expected: #<Bike:0x00007f9866a06fd0>
            got: nil
  ```
  --- Now we have the same error messages, the code needs to be changed
  
  --- We want the DockingStation to rememeber whatever it docks and return that. We use an instance variable to store the bike
  ```
    def dock(bike)
    @bike = bike
  end

  def bike
    @bike
  end
  ```
  --- Now all test pass!
  --- We can think about refactoring, changing the `bike` method to an attr_reader
  ```
  attr_reader :bike
  ```
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
