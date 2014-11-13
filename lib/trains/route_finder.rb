# RouteFinder
class RouteFinder
  def initialize(graph)
    @graph = graph
  end

  def find(start_point, end_point)
    visited = { :list => [], :distance => 0 }
    visited[:list].push start_point

    result = search(visited, end_point, false)

    fail NoSuchRouteException if result.size == 0

    result
  end

  def search(visited, end_point, left_start)
    result = []
    begin
      routes = @graph.get_routes_starting_at visited[:list].last
    rescue NoRoutesFoundException
      return result
    end

    routes.each do |route|
      next if (visited[:list].include? route[:town] && left_start)

      if route[:town] == end_point
        visited[:list].push route[:town]
        visited[:distance] = visited[:distance] + route[:distance]
        result.push({:route => Route.new(*visited[:list].clone), :distance => visited[:distance]})
        visited[:distance] = visited[:distance] - route[:distance]
        visited[:list].pop
        break
      end
    end

    routes.each do |route|
      next if (visited[:list].include? route[:town] || route[:town] != end_point && left_start)

      visited[:list].push route[:town]
      visited[:distance] = visited[:distance] + route[:distance]
      result.concat search(visited, end_point, true)
      visited[:distance] = visited[:distance] - route[:distance]
      visited[:list].pop
    end

    result
  end

  private :search
end

