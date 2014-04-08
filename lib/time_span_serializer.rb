class TimeSpanSerializer

  def initialize(unit = :seconds)
    self.unit = unit
  end

  # interface used by libs like ActiveRecord to convert instances of TimeSpan to a string.
  def dump(value)
    return if value.nil?

    case unit
    when :seconds
      value.total_seconds
    when :minutes
      value.total_minutes
    when :hours
      value.total_hours
    end
  end

  # interface used by libs like ActiveRecord to convert strings to instances of TimeSpan.
  # this is designed to be flexible in input type. So it can be as a
  # generic "Create me a TimeSpan from this thing" method
  def load(value)
    case value
    when TimeSpan
      value
    when String
      TimeSpan.parse(value, unit)
    when nil
      nil
    else
      TimeSpan.new(value, unit)
    end
  end

private

  attr_accessor :unit

end
