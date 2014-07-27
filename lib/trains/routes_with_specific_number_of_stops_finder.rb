class RoutesWithSpecificNumberOfStopsFinder
  def initialize(graph)
    @graph = graph
  end

  def find(start_point, end_point, number_of_stops)
    visited = Array.new
    visited.push start_point

    search(visited, end_point, number_of_stops)
  end

  def search(visited, end_point, number_of_stops)
    result = Array.new

    begin
      routes = @graph.get_routes_starting_at visited.last
    rescue NoRoutesFoundException
      return result
    end

    routes.each do |route|
      if visited.size > number_of_stops
        next
      end

      if route[:town] == end_point
        visited.push route[:town]
        result.push Route.new *visited.clone if visited.size == number_of_stops + 1
        visited.pop
        break
      end
    end

    routes.each do |route|
      if visited.size > number_of_stops
        next
      end

      visited.push route[:town]
      result.concat search(visited, end_point, number_of_stops)
      visited.pop
    end

    result
  end

  private :search
end