require "bike.rb"
describe Bike do
  bike = Bike.new
  it "has a variable status that defaults to true" do
    expect(bike.working).to eq true
    bike.working = false
    expect(bike.working).to eq false
  end
end
