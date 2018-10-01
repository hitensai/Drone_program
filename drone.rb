require_relative './engine'
require_relative './gyroscope'
require_relative './orientation_sensor'

class Drone

  OFF      = 0
  ON       = 1
  MOVING   = 2
  HOVERING = 3
  LANDED   = 4

  PITCH = 0  #pitch engine
  ROLL  = 1  #roll engine
  F_B   = 2  #forward/back engine
  L_R   = 3  #left/right engine

  attr_reader :gyroscope, :orientation_sensor, :engines, :status

  def initialize(gyroscope, orientation_sensor, *engines)
    @status = OFF 
    @gyroscope = gyroscope
    @orientation_sensor = orientation_sensor
    @engines = engines  
  end

  def start
    self.engines.each do |engine|
      engine.start
    end
    check_all_engines
    @status = ON
  end

  def stop
    self.engines.each do |engine|
      engine.stop
    end
    @status = OFF
  end

  def take_off  #(take the drone in the air)
    self.start if self.status == OFF
    5.times { move_up }   #move up 5 feet 
    stabilize
  end

  def move_forward
    @status = MOVING
    self.engines[F_B].increase_power
    self.orientation_sensor.forward 
    self.gyroscope.increase_velocity_z
  end

  def move_left
    @status = MOVING	
    self.engines[L_R].decrease_power
    self.orientation_sensor.left
    self.gyroscope.decrease_velocity_x
  end

  def move_right
    @status = MOVING	
    self.engines[L_R].increase_power
    self.orientation_sensor.right
    self.gyroscope.increase_velocity_x
  end
end
