require_relative 'van'
require_relative 'bike'
require_relative 'bike_container'

class Garage
  include BikeContainer

  def initialize
    @bikes = []
  end

  def fix
    @bikes = @bikes.each{|bike| bike.working = true}
  end
end
