require 'pry'
require 'journey'

class Oystercard

  attr_reader :balance, :start_station, :trips

  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @trips = []
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £#{MAXIMUM_BALANCE}" if (MAXIMUM_BALANCE - @balance) < amount
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
    deduct(@current_journey.fare) if @current_journey != nil
    start_journey(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    end_journey(station)
  end

  # def in_journey?
  #   !@current_journey.complete?
  # end

  private

  def deduct(amount)
    @balance -= amount
  end

  def start_journey(station)
    @current_journey = Journey.new(station)
  end

  def end_journey(station)
    @current_journey.finish(station)
    @trips << @current_journey.trip
    @current_journey = nil
  end

end
