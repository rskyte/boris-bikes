require_relative 'van'
require_relative 'bike'
class Garage
  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def receive(bikes)
    @bikes = bikes
  end

  def offload(van)
    van.receive(bikes)
    bikes.clear
  end
end
