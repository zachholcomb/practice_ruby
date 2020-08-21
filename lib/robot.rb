class Robot
  attr_reader :bearing, :coordinates

  def initialize
    @bearing = nil
    @directions = [:north, :east, :south, :west]
    @coordinates = []
  end

  def orient(direction)
    unless @directions.include?(direction)
      raise ArgumentError, "Invalid direction"
    end
    @bearing = direction
  end

  def turn_right
    @directions.each_with_index do |dir, index|
      return orient(:north) if @bearing == :west

      new_direction = @directions[index + 1]
      return orient(new_direction) if dir == @bearing
    end
  end

  def turn_left
    @directions.each_with_index do |dir, index|
      return orient(:west) if @bearing == :north

      new_direction = @directions[index - 1]
      return orient(new_direction) if dir == @bearing
    end
  end

  def at(x_coord, y_coord)
    @coordinates = [x_coord, y_coord]
  end

  def advance
    @coordinates[1] += 1 if @bearing == :north
    @coordinates[0] += 1 if @bearing == :east
    @coordinates[1] -= 1 if @bearing == :south
    @coordinates[0] -= 1 if @bearing == :west
  end
end

class Simulator
  def instructions(directions)
    directions.chars.map do |dir|
      if dir == 'L'
        :turn_left 
      elsif dir == 'R'
        :turn_right 
      elsif dir == 'A'
        :advance 
      end
    end
  end

  def place(robot, details)
    robot.at(details[:x], details[:y])
    robot.orient(details[:direction])
  end

  def evaluate(robot, dir_params)
    instructions(dir_params).each do |dir|
      robot.send(dir)
    end
  end
end