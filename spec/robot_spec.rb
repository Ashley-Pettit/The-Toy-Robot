require_relative '../lib/table.rb'
require_relative 'spec_helper.rb'

describe 'invalid movement' do
  it "Table should return false if a robot movement would drive robot off table" do
    table = Table.new
    expect(table.move_in_bounds?("NORTH",2,4)).to eq(false)
  end
end

describe 'valid movement' do
  it "Table should allow movement in bounds of table" do
    table = Table.new
    expect(table.move_in_bounds?("SOUTH",2,3)).to be_eql(true)
  end
end

describe 'allow placement' do
  it "Table allows placement if within bounds of table" do
    table = Table.new
    expect(table.placement_in_bounds?(2, 2, "EAST", "EAST")).to be_eql(true)
  end
end

describe 'invalid placement' do
  it "table will not allow placement outside of it's bounds" do
    table = Table.new
    expect(table.placement_in_bounds?(5, 5, "EAST", "EAST")).to be_eql(false)
  end
end
