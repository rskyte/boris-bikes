require_relative 'van'
require_relative 'bike'
class Garage
  attr_accessor :bikes
  def receive(bikes)
    @bikes = bikes
  end
end
