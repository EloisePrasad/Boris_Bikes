require './lib/bike'
class DockingStation

attr_reader :bike

  def initialize
    @bike = []
  end

  def release_bike
    fail 'No bikes available' if @bike.empty?
    @bike.pop
  end

  def dock(bike)
    fail 'Dock full' if @bike.count >= 20
    @bike << bike
  end

end
