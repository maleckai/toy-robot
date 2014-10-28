require "toy_robot/version"

module ToyRobot

  TABLE_WIDTH = 10
  TABLE_HEIGHT = 10

  class Robot
    attr_reader :x, :y, :facing

    FACINGS = %w(EAST NORTH WEST SOUTH)
    PLACE_ERROR_MESSAGE = "X must be within 1-#{ToyRobot::TABLE_WIDTH}, " +
        "Y must be within 1-#{ToyRobot::TABLE_HEIGHT}, " +
        "FACING must be one of #{FACINGS.to_s}"
    MOVE_ERROR_MESSAGE = "The Robot would exceed the table limit of #{ToyRobot::TABLE_WIDTH}x#{ToyRobot::TABLE_HEIGHT}"

    # Methods

    def place(x, y, facing)
      return PLACE_ERROR_MESSAGE unless valid_place?(x, y, facing)
      @x = x
      @y = y
      @facing = facing
    end

    def move
      new_x = @x + Math.cos(facing_angle * Math::PI / 180).round
      new_y = @y + Math.sin(facing_angle * Math::PI / 180).round
      return MOVE_ERROR_MESSAGE unless valid_move?(new_x, new_y)
      @x = new_x
      @y = new_y
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

    private

    def facing_index
      FACINGS.index(facing)
    end

    def facing_angle
      facing_index * 90
    end

  end
end
