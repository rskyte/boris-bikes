require 'garage.rb'

describe Garage do
  describe "#offload" do
    it "should offload bikes" do

    end
  end

  describe "#receive" do
    it "should receive bikes" do
      bike_false = double(:bike, working: false)
      subject.receive([bike_false, bike_false])
      expect(subject.bikes.size).to eq 2
    end
  end
end
