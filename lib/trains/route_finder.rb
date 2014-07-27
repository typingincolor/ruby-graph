class RouteFinder
  def initialize(graph)
    @graph = graph
  end

  def find(start_point, end_point)
    visited = {:list => Array.new, :distance => 0}
    visited[:list].push start_point

    result = search(visited, end_point, false)

    if result.size == 0
      raise NoSuchRouteException
    end

    result
  end

  def search(visited, end_point, left_start)
    result = Array.new
    begin
      routes = @graph.get_routes_starting_at visited[:list].last
    rescue NoRoutesFoundException
      return result
    end

    routes.each do |route|
      if visited[:list].include? route[:town] && left_start
        next
      end

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
      if (visited[:list].include? route[:town] || route[:town] != end_point) && left_start
        next
      end

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

