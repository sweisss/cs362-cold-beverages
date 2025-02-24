require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/vessel.rb'

describe 'A water dispenser' do
  let(:water_reservoir) { WaterReservoir.new(100, 100) }
  let(:water_dispenser) { WaterDispenser.new(water_reservoir) }

  it 'has a reservoir' do
    expect(water_dispenser.reservoir).to be(water_reservoir)
  end

  it 'can dispense to a vessel' do
    vessel = Vessel.new('v1', 100)
    water_dispenser.dispense(vessel)
    expect(water_reservoir.current_water_volume).to eq(0)
  end

  it 'can dispense onlyl what it has' do
    vessel = Vessel.new('v2', 200)
    water_dispenser.dispense(vessel)
    expect(water_reservoir.current_water_volume).to eq(0)
  end

  it 'can fill a vessel' do
    vessel = Vessel.new('v3', 30)
    water_dispenser.dispense(vessel)
    expect(vessel.fill_level).to eq(30)
  end

end
