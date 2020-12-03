require "journeyLog"

describe JourneyLog do
  let(:log) {JourneyLog.new}
  it "should be an instance of JourneyLog" do
    expect(log).to be_instance_of(JourneyLog)
  end
  
  it "should take an argument" do
    expect(described_class).to respond_to(:new).with(1).argument
  end


  describe "#start" do
    it "should take an argument" do
      expect(log).to respond_to(:start).with(1).argument
    end

    it "should initialize a new journey and record the start station" do
      expect(log.start("Euston")).to eq("Euston")
    end
  end

  # describe "#current_journey" do
  #   it "return incomplete journey is trip is incomplete" do
  #     log.start("Euston")
  #     expect(log.current_journey).to eq("Incomplete Journey") 
  #   end

  #   it "should instantiate a new journey class if trip is valid" do
  #     log.start("Euston")
  #     log.finish("Picadilly")
  #     expect(log.current_journey).to be_instance_of(Journey)
  #   end
  # end

  describe "#finish" do
    it "should take an argument" do
      expect(log).to respond_to(:finish).with(1).argument
    end

    it "should record exit_station to current_journey" do
      log.start("Euston")
      expect(log.finish("Picadilly")).to eq(nil)
    end
  end

  describe "#journeys" do
    it "should return a list of all previous journeys" do
      log.start("Euston")
      log.finish("Picadilly")
      expect(log.journeys).to be_instance_of Journey
    end
  end
end