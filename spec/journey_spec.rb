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

  describe "#valid_trip" do
    it "should return false when no station given for start station" do
      expect(journey.valid_trip).to eq false
    end

    it "should return false when no station given for end station" do
      journey.start_journey("Euston")
      expect(journey.valid_trip).to eq false
    end

    it "should return true when start and end station given" do
      journey.start_journey("Euston")
      journey.end_journey("Picadilly")
      expect(journey.valid_trip).to eq true
    end  
  end
  
  describe "#fare" do
    it "should return minimum fare if touch in and touch out" do
      journey.start_journey("Euston")
      journey.end_journey("Picadilly")
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it "should return penalty fare if touch in but not touch out" do
      journey.start_journey("Euston")
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end

 end
