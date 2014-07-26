require 'spec_helper'

describe RoutesWithSpecificNumberOfStopsFinder do
  it 'finds three stop route between A add D' do
    graph = Graph.new('AB5,BC6,AC1,CD1,BD4,AD7')
    route_finder = RoutesWithSpecificNumberOfStopsFinder.new(graph)

    routes = route_finder.find('A', 'D', 3)

    expect(routes.size).to eq(1)
    expect(routes).to include(Route.new 'A', 'B', 'C', 'D')
  end

  it 'does not find any routes with 9 stops between A and E' do
    graph = Graph.new('AB5,BC6,AC1,CD1,BD4,AD7')
    route_finder = RoutesWithSpecificNumberOfStopsFinder.new(graph)

    routes = route_finder.find('A', 'E', 9)
    expect(routes.size).to eq(0)
  end
end