class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def receive(bikes)
    @bikes = bikes
  end

  def offload(destination)
    destination.receive(bikes)
    bikes.clear
  end
end
