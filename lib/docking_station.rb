require_relative 'bike'
class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = [Bike.new]
  end

  def release_bike
    raise "Sorry, no bikes available." if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Sorry, station is full." if full?
    @bikes << bike
  end

  private
  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.size >= 20
  end

end
