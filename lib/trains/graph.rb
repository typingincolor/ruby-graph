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

    @nodes[start_point] = [] unless @nodes[start_point].is_a? Array

    @nodes[start_point].each do |existing_line|
      fail DuplicateRouteException if existing_line[:town] == end_point
    end

    @nodes[start_point].push({:town => end_point, :distance => distance})
  end

  def get_nodes
    @nodes
  end

  def get_routes_starting_at(start_point)
    result = @nodes[start_point]

    fail NoRoutesFoundException if result == 0

    result
  end

  def is_there_a_route?(start_point, end_point)
    routes = get_routes_starting_at start_point
    routes.each do |route|
      return route if route[:town] == end_point
    end

    raise NoSuchRouteException
  end
end
