require 'spec_helper'

describe RoutesWithSpecificNumberOfStopsFinder do
  it 'finds three stop route between A add D' do
    graph = Graph.new('AB5,BC6,AC1,CD1,BD4,AD7')
    route_finder = RoutesWithSpecificNumberOfStopsFinder.new(graph, 'A', 'D', 3)

    routes = route_finder.find()

    expected = [
        Route.new('A', 'B', 'C', 'D')
    ]

    expect(routes).to match_array expected
  end

  it 'does not find any routes with 9 stops between A and E' do
    graph = Graph.new('AB5,BC6,AC1,CD1,BD4,AD7')
    route_finder = RoutesWithSpecificNumberOfStopsFinder.new(graph, 'A', 'E', 9)

    routes = route_finder.find()
    expect(routes.size).to eq(0)
  end
end
