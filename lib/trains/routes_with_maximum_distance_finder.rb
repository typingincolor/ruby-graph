# RoutesWithMaximumDistanceFinder
class RoutesWithMaximumDistanceFinder < RouteFinderTemplate
  def initialize(graph, start_point, end_point, maximum_distance)
    @graph = graph
    @start_point = start_point
    @end_point = end_point
    @maximum_distance = maximum_distance
  end

  def handle_at_endpoint(routes, visited, result)
    routes.each do |route|
      next if route[:town] != @end_point
      visited.add route

      add_to_results_if_distance_lt_max_distance visited, result

      visited.pop route
      break
    end

    result
  end

  def add_to_results_if_distance_lt_max_distance(visited, result)
    return unless visited.distance < @maximum_distance
    result.push(route: Route.new(*visited.list.clone),
                distance: visited.distance)
  end

  def handle_not_at_endpoint(routes, _ignored, visited, result)
    routes.each do |route|
      break if visited.distance > @maximum_distance

      visited.add route
      result.concat search(visited, nil)
      visited.pop route
    end

    result
  end

  private :search,
          :handle_at_endpoint,
          :handle_not_at_endpoint,
          :add_to_results_if_distance_lt_max_distance
end
