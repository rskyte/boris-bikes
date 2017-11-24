module BikeContainer
  attr_accessor :bikes
  @bikes = []
  def offload(bike_container)
    bike_container.receive(bikes)
    bikes.clear
  end

  def receive(bikes)
    @bikes = bikes
  end
end
