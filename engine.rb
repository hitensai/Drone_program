class Engine

  OFF = 0
  ON  = 1
  MALFUNCTION = -1

  INITIAL_RANGE = 25
  POWER_RANGE = 100

  attr_reader :status, :power, :name

  def initialize(name)
    @power = 0
    @status = OFF
    @name = name
  end

  def start
    @power += 1 while self.power < INITIAL_RANGE
    self.status == ON
  end

  def increase_power
    @power += 1 if self.power < POWER_RANGE
  end

  def decrease_power
    @power -= 1 if self.power > POWER_RANGE
  end

  def changeto_initial_power
    @power -= 1 until self.power == INITIAL_RANGE
  end

  def stop
    @power -= 1 while self.power > 0 
    self.status == OFF
  end

  def status
    case self.power 
      when 0 
        OFF 
      when 1..100
        ON
      else
        MALFUNCTION
      end
  end

  def check
    if self.status == MALFUNCTION
      perform_malfunction_action
    elsif self.status == OFF
      raise EngineNotStartedException.new("#{self.name} - engine not running")
    end
  end
 
  private

  def perform_malfunction_action
    $stdout.puts "#{self.name} malfunctioning detected. Sending Distress signal"
    raise EngineMalfunctionException.new("#{self.name} - engine malfunctioning.")
  end

end


class EngineMalfunctionException < Exception;end
class EngineNotStartedException <  Exception;end

