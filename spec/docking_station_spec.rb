require "docking_station"
describe DockingStation do
  let(:bike) {double(:my_bike, working: true)}
  subject {DockingStation.new}

  describe "capacity" do
    it "should have variable bike capacity" do
      ds = DockingStation.new 40
      40.times{ds.dock(bike)}
      expect{ds.dock(bike)}.to raise_error "Sorry, station is full."
    end
    it "should have a default capacity" do
      expect(DockingStation::DEFAULT_CAPACITY == subject.capacity).to eq true
    end
  end

  describe "#dock" do
    it "should dock a bike when dock is called" do
      expect(subject.dock(bike).include?(bike)).to eq true
    end
    it "should dock broken bikes" do
      allow(bike).to receive(:working).and_return(false)
      expect(subject.dock(bike).include?(bike)).to eq true
    end
    it "should not dock a bike when the station is full and raise an error" do
      subject.capacity.times{subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error "Sorry, station is full."
    end
  end

  describe "#release_bike" do
    it "should release a working bike" do
      subject.dock(bike)
      expect(bike.working).to eq true
    end
    it "not release a bike when there are no bikes and raise an error" do
      expect{subject.release_bike}.to raise_error "Sorry, no bikes available."
    end
  end

  describe "#offload" do
    it "should offload all broken bikes to a van" do
      van = double(:my_van, receive: true)
      allow(bike).to receive(:working).and_return(false)
      subject.dock(bike)
      subject.offload(van)
      expect(subject.broken_bikes.empty?).to be true
    end
  end

  describe "#receive" do
    it "should receive bikes" do
      bike_true = double(:bike, working: true)
      before_bikes = subject.bikes.size
      subject.receive([bike_true, bike_true])
      expect(subject.bikes.size).to eq(before_bikes + 2)
    end
  end

end
