class Journey

  attr_reader :start_station

  def initialize(station)
    @start_station = station
    @complete = false
  end

  MINIMUM_FARE = 1
  PENALTY = 6

  def finish(station)
    @end_station = station
    @complete = true
  end

  def trip
    {"Start:" => @start_station, "End:" => @end_station}
  end

  def complete?
    @complete
  end

  def fare
    @complete ? MINIMUM_FARE : PENALTY
  end

end
