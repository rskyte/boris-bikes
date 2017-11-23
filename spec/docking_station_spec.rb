require "docking_station"
describe DockingStation do
  bike = Bike.new

  describe "#dock" do
    it "should dock a bike when dock is called" do
      expect(subject.dock(bike).include?(bike)).to eq true
    end
    it "should not dock a bike when the station is full and raise an error" do
      DockingStation::DEFAULT_CAPACITY.times{subject.dock(bike)}
      expect {(DockingStation::DEFAULT_CAPACITY + 1).times{subject.dock(bike)}}.to raise_error("Sorry, station is full.")
    end
  end

  describe "#release_bike" do
    it "should release a working bike when method is called" do
      subject.dock(bike)
      expect(subject.release_bike.is_a?(Bike) && bike.working?).to eq true
    end
    it "not release a bike when there are no bikes and raise an error" do
      expect {subject.release_bike}.to raise_error("Sorry, no bikes available.")
    end
  end

end
