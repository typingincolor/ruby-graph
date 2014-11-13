# RoutesWithSpecificNumberOfStopsFinder
class RoutesWithSpecificNumberOfStopsFinder
  def initialize(graph, start_point, end_point, number_of_stops)
    @graph = graph
    @start_point = start_point
    @end_point = end_point
    @number_of_stops = number_of_stops
  end

  def find()
    visited = [@start_point]
    search(visited)
  end

  def search(visited)
    result = []

    begin
      routes = @graph.get_routes_starting_at visited.last
    rescue NoRoutesFoundException
      return result
    end

    routes.each do |route|
      next if visited.size > @number_of_stops

      next if route[:town] != @end_point

      visited.push route[:town]
      result.push Route.new(*(visited.clone)) if \
        visited.size == @number_of_stops + 1
      visited.pop
      break
    end

    routes.each do |route|
      next if visited.size > @number_of_stops

      visited.push route[:town]
      result.concat search(visited)
      visited.pop
    end

    result
  end

  private :search
end
