require_relative '../lib/commander.rb'
require_relative '../lib/robot.rb'
require_relative 'spec_helper.rb'
# add simplecov

describe 'robot_placed' do
  it "After accepting a correct place command the robot should be placed" do
    input = "PLACE 0,0,WEST"
    expect(!!@x_poistion).to eql(true)
  end
end

describe 'a valid command is accepted' do
  it 'valid_command? should return true if the command exists in VALID_COMMANDS' do
    input = 'LEFT'
    expect(valid_command?).to eql(true)
  end
end

describe 'No move command sent before placed' do
  it "The place command should not be sent to the robot before the robot is placed" do
    input = "MOVE"
    expect(!@robot.robot_placed).to eql(true)
  end
end
