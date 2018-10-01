class Gyroscope
  
  attr_reader :velocity_x, :velocity_y, :velocity_z

  def initialize(velocity_x=0, velocity_y=0, velocity_z=0)
    @velocity_x = velocity_x
    @velocity_y = velocity_y
    @velocity_z = velocity_z
  end

  def increase_velocity_x
    @velocity_x += 1
  end   
 
  def decrease_velocity_x
    @velocity_x -= 1 if self.velocity_x > 0
  end 

  def increase_velocity_y
    @velocity_y += 1
  end   
 
  def decrease_velocity_y
    @velocity_y -= 1 if self.velocity_y > 0
  end 

  def increase_velocity_z
    @velocity_z += 1
  end   
 
  def decrease_velocity_z
    @velocity_z -= 1 if self.velocity_z > 0
  end 


end
