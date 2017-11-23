require_relative 'bike'
class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Sorry, no bikes available." if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Sorry, station is full." if full?
    bike.working == true ? @bikes << bike : @broken_bikes << bike
  end

  private
  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.size >= @capacity
  end

end
