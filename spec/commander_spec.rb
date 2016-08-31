require_relative '../lib/commander.rb'
require_relative '../lib/robot.rb'
require_relative 'spec_helper.rb'

RSpec.describe Commander do
  before do
    commander = Commander.new
  end

  describe '.initialize' do
    it 'immediately creates a table and a robot. Passing the table to the robot.' do
      expect @table.to.be present
    end
  end

  # describe '.robot_placed' do
  #   it "After accepting a correct place command the robot should be placed" do
  #     commander.place_robot('0,0,WEST')
  #     expect(@x_poistion).to eql(0)
  #   end
  # end

  # describe 'a valid command is accepted' do
  #   xit 'valid_command? should return true if the command exists in VALID_COMMANDS' do
  #     input = 'LEFT'
  #     expect(valid_command?).to eql(true)
  #   end
  # end

  # describe 'No move command sent before placed' do
  #   xit "The place command should not be sent to the robot before the robot is placed" do
  #     input = "MOVE"
  #     expect(!@robot.robot_placed).to eql(true)
  #   end
  # end

end
