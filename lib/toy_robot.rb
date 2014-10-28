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

    # Methods

    def place(x, y, facing)
      return PLACE_ERROR_MESSAGE unless valid_place?(x, y, facing)
      @x = x
      @y = y
      @facing = facing
    end

    # Validation methods

    def valid_place?(x, y, facing)
      valid_x?(x) && valid_y?(y) && valid_facing?(facing)
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
