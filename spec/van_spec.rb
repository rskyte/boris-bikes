require 'van.rb'
describe Van do
  describe '#receive' do
    it "should receive 1 or more bike(s)" do
      #bike_true = double(:bike, working: true)
      bike_false = double(:bike, working: false)
      subject.receive([bike_false, bike_false])
      expect(subject.bikes.size).to eq 2
    end
  end
end
