require 'journey_log'

describe JourneyLog do
  describe 'creation of journey log object' do
    it 'should be an instance of JourneyLog class' do
      expect(subject).to be_instance_of described_class
    end

    it 'should accept one argument' do
      expect(described_class).to respond_to(:new).with(1).argument
    end
  end


end
