require_relative 'bike'
class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = [Bike.new]
  end

  def release_bike
    if bikes.empty?
      raise "Sorry, no bikes available."
    else
      bikes.pop
    end
  end

  def dock(bike)
    bikes << bike
  end
end
