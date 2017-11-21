require "docking_station.rb"
describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it "should release a bike when method is called" do
    expect((DockingStation.new.release_bike).is_a? Bike).to eq true
  end
  it {is_expected.to respond_to(:dock).with(1).argument}
end
