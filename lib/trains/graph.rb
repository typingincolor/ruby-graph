class Graph
  def initialize(graph)
    @nodes = Hash.new(0)
    lines = graph.split(',')

    lines.each do |x|
      add_line x
    end
  end

  def add_line(line)
    start_point = line[0]
    end_point = line[1]
    distance = line[2].to_i

    @nodes[start_point] = Array.new unless @nodes[start_point].is_a? Array

    @nodes[start_point].each do |existing_line|
      if existing_line[:town] == end_point
        raise DuplicateRouteException
      end
    end

    @nodes[start_point].push({:town => end_point, :distance => distance})
  end

  def get_nodes
    @nodes
  end

  def get_routes_starting_at(start_point)
    result = @nodes[start_point]

    if result == 0
      raise NoRoutesFoundException
    end

    result
  end

  def is_there_a_route?(start_point, end_point)
    routes = get_routes_starting_at start_point
    routes.each do |route|
      if route[:town] == end_point
        return route
      end
    end

    raise NoSuchRouteException
  end
end