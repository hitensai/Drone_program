class OrientationSensor 

  attr_reader :pitch, :roll_x, :roll_x

  def initialize
    @pitch = 0
    @roll_x, @roll_y = [0, 0]
  end

  def up
    self.pitch += 1 	
  end

  def down
    self.pitch -= 1
  end

  def forward
    @roll_x += 1
  end

  def backward
    @roll_x -= 1
  end

  def right
    @roll_y += 1
  end

  def left 
    @roll_y -= 1
  end

  def roll
    [@roll_x, @roll_y]
  end

end
