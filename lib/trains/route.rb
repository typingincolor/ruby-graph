class Route
  def initialize(*towns)
    if towns.size < 2
      raise InvalidRouteException
    end

    @towns = towns
  end

  def get_stop(index)
    @towns[index]
  end

  def has_next?(index)
    if index < @towns.size - 1
      return true
    end

    false
  end

  def towns
    @towns
  end

  def ==(other)
    if @towns == other.towns
      return true
    end

    false
  end

  def to_s
    @towns.to_s
  end
end