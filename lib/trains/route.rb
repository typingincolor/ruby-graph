# Route
class Route
  attr_reader :towns

  def initialize(*towns)
    fail InvalidRouteException if towns.size < 2

    @towns = towns
  end

  def get_stop(index)
    @towns[index]
  end

  def next?(index)
    return true if index < @towns.size - 1

    false
  end

  def ==(other)
    return true if @towns == other.towns

    false
  end
end
