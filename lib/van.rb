require_relative 'bike_container'
class Van
  include BikeContainer

  def initialize
    @bikes = []
  end
end
