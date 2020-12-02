class Oystercard
attr_accessor :balance, :state, :start_station, :exit_station, :journeys
LIMIT = 90
FARELIMIT = 1

  def initialize
    @balance = 0
    @fare_limit = FARELIMIT
    @start_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Balance cannot exceed #{LIMIT}" if (@balance + amount) > LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise "Not enough funds" if @balance < @fare_limit

    @start_station = station
  end

  def in_journey?
    @start_station != nil
  end

  def touch_out(station)
    deduct(@fare_limit)
    @exit_station = station
    @journeys.push({@start_station => @exit_station})
    @start_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
