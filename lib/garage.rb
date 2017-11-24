require_relative 'van'
require_relative 'bike'
class Garage
  include BikeContainer

  def initialize
    @bikes = []
  end
end
