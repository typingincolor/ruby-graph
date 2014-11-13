# RoutesWithMaximumDistanceFinder
class RoutesWithMaximumDistanceFinder
  def initialize(graph, start_point, end_point, maximum_distance)
    @graph = graph
    @start_point = start_point
    @end_point = end_point
    @maximum_distance = maximum_distance
  end

  def find()
    visited = { list: [], distance: 0 }
    visited[:list].push @start_point

    result = search(visited)

    fail NoSuchRouteException if result.size == 0

    result
  end

  def search(visited)
    result = []
    begin
      routes = @graph.get_routes_starting_at visited[:list].last
    rescue NoRoutesFoundException
      return result
    end

    handle_at_endpoint routes, visited, result

    handle_not_at_endpoint routes, visited, result

    result
  end

  def handle_at_endpoint(routes, visited, result)
    routes.each do |route|
      break if visited[:distance] > @maximum_distance

      if route[:town] == @end_point
        visited[:list].push route[:town]
        visited[:distance] = visited[:distance] + route[:distance]
        if visited[:distance] < @maximum_distance
          result.push(route: Route.new(*visited[:list].clone),
                      distance: visited[:distance])
        end
        visited[:distance] = visited[:distance] - route[:distance]
        visited[:list].pop
        break
      end
    end

    return result
  end

  def handle_not_at_endpoint routes, visited, result
    routes.each do |route|
      break if visited[:distance] > @maximum_distance

      visited[:list].push route[:town]
      visited[:distance] = visited[:distance] + route[:distance]
      result.concat search(visited)
      visited[:distance] = visited[:distance] - route[:distance]
      visited[:list].pop
    end

    return result
  end

  private :search, :handle_at_endpoint, :handle_not_at_endpoint
end
