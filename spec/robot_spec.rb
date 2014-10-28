require 'spec_helper'

describe ToyRobot::Robot do
  let(:robot) { ToyRobot::Robot.new }

  before :all do
    @original_x = 3
    @original_y = 5
    @original_facing = 'EAST'
  end

  describe 'place' do
    before :each do
      robot.place(@original_x, @original_y, @original_facing)
    end

    it 'should place the robot at the specified x coordinate' do
      expect(robot.x).to eq(@original_x)
    end

    it 'should place the robot at the specified y coordinate' do
      expect(robot.y).to eq(@original_y)
    end

    it 'should set the robots facing to the specified facing' do
      expect(robot.facing).to eq(@original_facing)
    end

    it 'should not update the robots position if given invalid input' do
      robot.place(8, 8, 'UP')
      expect(robot.x).to eq(3)
    end
  end

  describe 'moving' do
    it 'should increase x by 1 when moving east' do
      robot.place(@original_x, @original_y, 'EAST')
      robot.move
      expect(robot.x).to eq(@original_x + 1)
    end

    it 'should increase y by 1 when moving north' do
      robot.place(@original_x, @original_y, 'NORTH')
      robot.move
      expect(robot.y).to eq(@original_y + 1)
    end

    it 'should decrease x by 1 when moving west' do
      robot.place(@original_x, @original_y, 'WEST')
      robot.move
      expect(robot.x).to eq(@original_x - 1)
    end

    it 'should decrease y by 1 when moving south' do
      robot.place(@original_x, @original_y, 'SOUTH')
      robot.move
      expect(robot.y).to eq(@original_y - 1)
    end

    it 'should not update position if it would move off the table' do
      robot.place(1, 1, 'SOUTH')
      robot.move
      expect(robot.y).to eq(1)
    end
  end

  describe 'turning' do
    before :each do
      robot.place(@original_x, @original_y, @original_facing)
    end

    it 'should change its direction from east to south when turning right' do
      robot.right
      expect(robot.facing).to eq('SOUTH')
    end

    it 'should change its direction from east to north when turning left' do
      robot.left
      expect(robot.facing).to eq('NORTH')
    end

    it 'should not modify the x position of the robot' do
      robot.left
      expect(robot.x).to eq(@original_x)
    end

    it 'should not modify the y position of the robot' do
      robot.left
      expect(robot.y).to eq(@original_y)
    end
  end

  describe 'reporting' do
    before :each do
      robot.place(@original_x, @original_y, @original_facing)
    end

    it 'should report its current x position' do
      expect(robot.report).to include(@original_x.to_s)
    end

    it 'should report its current y position' do
      expect(robot.report).to include(@original_y.to_s)
    end

    it 'should report its current facing' do
      expect(robot.report).to include(@original_facing)
    end
  end
end