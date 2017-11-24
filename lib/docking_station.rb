require_relative 'bike'
require_relative 'van'
class DockingStation
  attr_reader :bikes, :capacity, :broken_bikes
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
    return_process(bike)
  end

  def return_process(bike)
    bike.working == true ? @bikes << bike : @broken_bikes << bike
  end

  def offload(van)
    van.receive(broken_bikes)
    broken_bikes.clear
  end

  def receive(bikes)
    @bikes += bikes
  end

  private
  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.size >= @capacity
  end

end
