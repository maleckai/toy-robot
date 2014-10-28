require "toy_robot/version"

module ToyRobot

  TABLE_WIDTH = 10
  TABLE_HEIGHT = 10

  class Robot
    attr_reader :x, :y, :facing

    FACINGS = %w(EAST NORTH WEST SOUTH)
    EAST = 'EAST'
    NORTH = 'NORTH'
    WEST = 'WEST'
    SOUTH = 'SOUTH'

    PLACE_ERROR_MESSAGE = "X must be within 1-#{ToyRobot::TABLE_WIDTH}, " +
        "Y must be within 1-#{ToyRobot::TABLE_HEIGHT}, " +
        "FACING must be one of #{FACINGS.to_s}"
    MOVE_ERROR_MESSAGE = "The Robot would exceed the table limit of #{ToyRobot::TABLE_WIDTH}x#{ToyRobot::TABLE_HEIGHT}"
    HELP_TEXT = %Q{
TOY ROBOT

  A toy robot that can be placed on a table top, move across it, rotate and report its position

  *------------------------------------------------------------------------------------------------*
  | COMMAND            | DESCRIPTION                                                               |
  |--------------------|---------------------------------------------------------------------------|
  | place X, Y, FACING | Places the robot at coordinates X, Y on the table, with facing FACING.    |
  | move               | Moves the robot one unit forward in the direction it is currently facing. |
  | left               | Rotates the robot 90 degrees to the left.                                 |
  | right              | Rotates the robot 90 degrees to the right.                                |
  | report             | Announces the X,Y and FACING of the robot.                                |
  | help               | Shows this help menu.                                                     |
  *------------------------------------------------------------------------------------------------*

  FACINGS: #{FACINGS.to_s}
  X range: 1-#{ToyRobot::TABLE_WIDTH}
  Y range: 1-#{ToyRobot::TABLE_HEIGHT}}

    # Methods

    def place(x, y, facing)
      return PLACE_ERROR_MESSAGE unless valid_place?(x, y, facing)
      @x = x
      @y = y
      @facing = facing
      return
    end

    def move
      new_x = @x + Math.cos(facing_angle * Math::PI / 180).round
      new_y = @y + Math.sin(facing_angle * Math::PI / 180).round
      return MOVE_ERROR_MESSAGE unless valid_move?(new_x, new_y)
      @x = new_x
      @y = new_y
      return
    end

    def right(units = 1)
      turn(-units)
    end

    def left(units = 1)
      turn(units)
    end

    def report
      "The robot currently at (#{@x}, #{@y}) facing #{@facing}"
    end

    def help
      HELP_TEXT
    end

    private

    def facing_index
      FACINGS.index(facing)
    end

    def facing_angle
      facing_index * 90
    end

    def turn(units)
      new_facing_index = (facing_index + units) % 4
      @facing = FACINGS[new_facing_index]
      return
    end

    # Validation methods

    def valid_place?(x, y, facing)
      valid_x?(x) && valid_y?(y) && valid_facing?(facing)
    end

    def valid_move?(x, y)
      valid_x?(x) && valid_y?(y)
    end

    def valid_x?(x)
      x > 0 && x <= ToyRobot::TABLE_WIDTH
    end

    def valid_y?(y)
      y > 0 && y <= ToyRobot::TABLE_HEIGHT
    end

    def valid_facing?(facing)
      FACINGS.include? facing.upcase
    end

  end
end
