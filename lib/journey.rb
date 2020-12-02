class Journey
  attr_accessor :start_station, :end_station

  def initialize(entry_station = nil, exit_station = nil)
    @start_station = entry_station
    @end_station = exit_station
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
end
