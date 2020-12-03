

class JourneyLog

  def initialize(journey_class = Journey)
    @journey_history = []
    @journey_class = journey_class
  end

  def start(entry_station)
    @entry_station = entry_station
    @current_journey = @journey_class.new
    @current_journey.start_journey(entry_station)
  end

  def finish(exit_station)
    @current_journey.end_journey(exit_station)
    @journey_history << @current_journey
    return nil
  end

  def journeys
    @journey_history.each do |journey|
      return journey
    end
  end

  private

  def current_journey
    if @current_journey.valid_trip == false
      return "Incomplete Journey" 
    else
      @current_journey = @journey_class.new
    end
  end
end