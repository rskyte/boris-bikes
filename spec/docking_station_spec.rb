require "docking_station"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it "should release a bike when method is called" do
    bike = subject.release_bike
    expect(bike.is_a?(Bike) && bike.working?).to eq true
  end
  it {is_expected.to respond_to(:dock).with(1).argument}
  it "should dock a bike when dock is called" do
    bike = Bike.new
    expect(subject.dock(bike).include?(bike)).to eq true
  end
  it "not release a bike when there are no bikes and raise an error" do
    subject.release_bike
    expect {subject.release_bike}.to raise_error("Sorry, no bikes available.")
  end
end
