class JourneyLog
  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey = nil
  end

  def start(station)
    @current_journey = @journey_class.new(station)
  end

  # private

  def current_journey
    if @current_journey.valid_trip == true
      @current_journey = @journey_class.new
    end
  end

end
