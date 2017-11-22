require_relative 'bike'
class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = [Bike.new]
  end

  def release_bike
    raise "Sorry, no bikes available." if bikes.empty?
    bikes.pop
  end

  def dock(bike)
    raise "Sorry, station is full." if bikes.size >= 1
    bikes << bike
  end
end
