# VisitedTowns
class VisitedTowns
  attr_reader :distance
  attr_reader :list

  def initialize(start_point)
    @list = [start_point]
    @distance = 0
  end

  def add(route)
    @list.push route[:town]
    @distance += route[:distance]
  end

  def pop(route)
    @distance -= route[:distance]
    @list.pop
  end

  def last
    @list.last
  end

  def size
    list.size
  end
end
