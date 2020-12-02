require './lib/journey.rb'
require './lib/station.rb'

class Oystercard
attr_accessor :balance, :journeys, :current_journey
LIMIT = 90
FARELIMIT = 1

  def initialize
    @balance = 0
    @fare_limit = FARELIMIT
    @current_journey = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Balance cannot exceed #{LIMIT}" if (@balance + amount) > LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise "Not enough funds" if @balance < @fare_limit

    @current_journey = Journey.new
    @current_journey.start_journey(station)
  end

  def in_journey?
    @current_journey != nil
  end

  def touch_out(station)
    deduct(@fare_limit)
    @current_journey.end_journey(station)
    @journeys.push({@current_journey.start_station => @current_journey.end_station})
    @current_journey = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
