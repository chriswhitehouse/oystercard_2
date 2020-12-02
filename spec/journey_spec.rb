require 'journey'

describe Journey do
  let(:journey) {described_class.new}
  #let(:station) { Station.new("Euston", 1) }
  describe '#start_journey' do
    it 'start_journey should return start station' do
      journey.start_journey('Euston')
      expect(journey.start_station).to eq 'Euston'
    end
  end

  describe '#end_journey' do
    it 'end_station should return the exit station' do
      journey.end_journey('Euston')
      expect(journey.end_station).to eq 'Euston'
    end
  end

  describe '#in_journey?' do
    it 'returns false when not in journey' do
      expect(journey.in_journey?).to eq false
    end

    it 'returns true when in journey' do
      journey.start_journey('Euston')
      expect(journey.in_journey?).to eq true
    end
  end

 end
