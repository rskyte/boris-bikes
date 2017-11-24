require 'garage'
require 'bike'

describe Garage do
  describe '#fix' do
    it 'should fix stored bikes' do
      bike = Bike.new
      bike.working = false
      10.times{subject.bikes << bike}
      subject.fix
      expect(subject.bikes[9].working).to be true
    end
  end
end
