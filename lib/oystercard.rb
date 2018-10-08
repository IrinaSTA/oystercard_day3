require 'pry'

class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def topup(amount)
    raise "Cannot topup £#{amount}: maximum balance of £90" if (90 - @balance) < amount
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
