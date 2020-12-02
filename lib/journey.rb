class Journey
  attr_accessor :start_station, :end_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @start_station = entry_station
    @end_station = exit_station
    @fare_cost = 0
  end

  def start_journey(station)
    @start_station = station
  end

  def end_journey(station)
    @end_station = station
  end

  def in_journey?
    !start_station.nil? && end_station.nil?
  end

  def valid_trip
    !start_station.nil? && !end_station.nil?
  end

  def fare
    valid_trip ? @fare_cost = MINIMUM_FARE : @fare_cost = PENALTY_FARE
  end

end
