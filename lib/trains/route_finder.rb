class RouteFinder
  def initialize(graph)
    @graph = graph
  end

  def find(start_point, end_point)
    visited = Array.new
    visited.push start_point

    result = search(visited, end_point)

    if result.size == 0
      raise NoSuchRouteException
    end

    result
  end

  def search(visited, end_point)
    result = Array.new
    begin
      routes = @graph.get_routes_starting_at visited.last
    rescue NoRoutesFoundException
      return result
    end

    routes.each do |route|
      if visited.include? route[:town]
        next
      end

      if route[:town] == end_point
        visited.push route[:town]
        result.push Route.new *visited.clone
        visited.pop
        break
      end
    end

    routes.each do |route|
      if visited.include? route[:town] || route[:town] != end_point
        next
      end

      visited.push route[:town]
      result.concat search(visited, end_point)
      visited.pop
    end

    result
  end
end

