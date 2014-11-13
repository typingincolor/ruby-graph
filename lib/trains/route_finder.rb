# RouteFinder
class RouteFinder
  def initialize(graph, start_point, end_point)
    @graph = graph
    @start_point = start_point
    @end_point = end_point
  end

  def find
    visited = VisitedTowns.new @start_point

    result = search(visited, false)

    fail NoSuchRouteException if result.size == 0

    result
  end

  def search(visited, left_start)
    result = []
    begin
      routes = @graph.get_routes_starting_at visited.last
    rescue NoRoutesFoundException
      return result
    end

    handle_at_endpoint routes, visited, result

    handle_not_at_endpoint routes, left_start, visited, result

    result
  end

  def handle_at_endpoint(routes, visited, result)
    routes.each do |route|
      next if route[:town] != @end_point

      visited.add route
      result.push(route: Route.new(*visited.list.clone),
                  distance: visited.distance)
      visited.pop route
      break
    end

    result
  end

  def handle_not_at_endpoint(routes, left_start, visited, result)
    routes.each do |route|
      next if visited.list.include?(route[:town]) && left_start

      visited.add route
      result.concat search(visited, true)
      visited.pop route
    end

    result
  end

  private :search, :handle_at_endpoint, :handle_not_at_endpoint
end
