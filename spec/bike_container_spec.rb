require 'bike_container'
require 'garage'
require 'docking_station'
require 'van'

shared_examples_for "a bike_container" do
  let(:bike_container) {described_class.new}
  describe "#offload" do
    it "can offload bikes" do
      bike = double(:bike)
      bike_container.bikes << bike
      receiver = double(:my_receiver, receive: true)
      bike_container.offload(receiver)
      expect(bike_container.bikes.empty?).to be true
    end
  end

  describe "#receive" do
    it "can receive bikes" do
      bike = double(:bike)
      bike_container.receive([bike])
      expect(bike_container.bikes.size).to eq 1
    end
  end
end

describe Garage do
  it_behaves_like "a bike_container"
end

describe Van do
  it_behaves_like "a bike_container"
end
