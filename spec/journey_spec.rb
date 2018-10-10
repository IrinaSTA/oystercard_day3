require 'journey'
require 'oystercard'

describe Journey do

  let(:station) { double :station }
  let (:journey) { Journey.new(station) }

  it 'starts a journey' do
    expect(journey.start_station).to eq(station)
  end

  it 'should finish a journey' do
    journey.finish(station)
    expect(journey.trip["End:"]).to eq(station)
  end

  it 'should know if a journey is complete' do
    journey.finish(station)
    expect(journey.complete?).to eq true
  end

  it 'should have a minimum fare' do
    journey.finish(station)
    expect(journey.fare).to eq(Journey::MINIMUM_FARE)
  end

  it 'should have a penalty fare of 6' do
    expect(journey.fare).to eq(Journey::PENALTY)
  end

end
