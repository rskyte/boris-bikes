require "docking_station"
describe DockingStation do
  let(:bike) {Bike.new}
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

      bike.working = false
      expect(subject.dock(bike).include?(bike)).to eq true
    end
    it "should not dock a bike when the station is full and raise an error" do
      subject.capacity.times{subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error "Sorry, station is full."
    end
  end

  describe "#release_bike" do
    let(:bike) {double :bike}
    it "should release a working bike" do
      allow(bike).to receive(:working).and_return(true)
      subject.dock(bike)
      expect(bike.working).to eq true
    end
    it "not release a bike when there are no bikes and raise an error" do
      expect{subject.release_bike}.to raise_error "Sorry, no bikes available."
    end
  end

end
