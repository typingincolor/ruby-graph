class Route
  def initialize(*towns)
    raise InvalidRouteException if towns.size < 2

    @towns = towns
  end

  def get_stop(index)
    @towns[index]
  end

  def has_next?(index)
    return true if index < @towns.size - 1

    false
  end

  def towns
    @towns
  end

  def ==(other)
    return true if @towns == other.towns

    false
  end

  def to_s
    @towns.to_s
  end
end
