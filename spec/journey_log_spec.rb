require 'journey_log'

describe JourneyLog do
  let(:station_double) {double :station}

  let(:journey_double) {double :journey, valid_trip: true}
  let(:journey_class_double) {double :journey_class, new: journey_double}
  let(:journey_log) {JourneyLog.new(journey_class_double)}

  describe 'creation of journey log object' do
    it 'should be an instance of JourneyLog class' do
      expect(journey_log).to be_instance_of described_class
    end

    it 'should accept one argument' do
      expect(described_class).to respond_to(:new).with(1).argument
    end
  end

  describe '#start' do
    it 'should respond to start with one argument' do
      expect(journey_log).to respond_to(:start).with(1).argument
    end

    it 'should create a new instance of the Journey class' do
      expect(journey_log.start(station_double)).to eq journey_double
    end
  end

  describe "#current_journey" do
    it 'should respond to current_journey' do
      expect(journey_log).to respond_to(:current_journey)
    end

    it 'should create new journey if valid_trip is true' do
      journey_log.start(station_double)
      expect(journey_log.current_journey).to eq journey_double
    end
  end
end
