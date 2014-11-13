# RoutesWithSpecificNumberOfStopsFinder
class RoutesWithSpecificNumberOfStopsFinder
  def initialize(graph, start_point, end_point, number_of_stops)
    @graph = graph
    @start_point = start_point
    @end_point = end_point
    @number_of_stops = number_of_stops
  end

  def find
    visited = VisitedTowns.new @start_point
    search(visited)
  end

  def search(visited)
    result = []

    begin
      routes = @graph.get_routes_starting_at visited.last
    rescue NoRoutesFoundException
      return result
    end

    handle_at_endpoint routes, visited, result

    handle_not_at_endpoint routes, visited, result

    result
  end

  def handle_at_endpoint(routes, visited, result)
    routes.each do |route|
      next if visited.size > @number_of_stops

      next if route[:town] != @end_point

      visited.add route
      result.push \
        Route.new(*(visited.list.clone)) if visited.size == @number_of_stops + 1
      visited.pop route
      break
    end
  end

  def handle_not_at_endpoint(routes, visited, result)
    routes.each do |route|
      next if visited.size > @number_of_stops

      visited.add route
      result.concat search(visited)
      visited.pop route
    end
  end

  private :search, :handle_at_endpoint, :handle_not_at_endpoint
end
