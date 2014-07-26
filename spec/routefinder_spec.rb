require 'spec_helper'

describe RouteFinder do
  it "finds two route between A and B" do
    graph = Graph.new('AB5,AC4,CB3')
    route_finder = RouteFinder.new(graph)

    routes = route_finder.find('A', 'B')

    expect(routes.size).to eq(2)
    expect(routes).to include(Route.new 'A', 'B')
    expect(routes).to include(Route.new 'A', 'C', 'B')
  end
end