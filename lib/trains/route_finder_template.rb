# RouteFinderTemplate
class RouteFinderTemplate
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
end
