require 'van.rb'
describe Van do
  describe '#receive' do
    it "should receive 1 or more bike(s)" do
      bike = double(:bike)
      subject.receive([bike, bike])
      expect(subject.bikes.size).to eq 2
    end
  end

  describe "#offload" do
    it "should offload bikes" do
      destination = double(:my_destination, receive: true)
      subject.offload(destination)
      expect(subject.bikes.empty?).to be true
    end
  end
end
