require 'spec_helper'

describe Route do
  it 'cannot create an empty route' do
    graph = Graph.new('AB5')

    expect do
      Route.new(graph)
    end.to raise_error(InvalidRouteException)
  end

  it 'cannot create an route with one town' do
    graph = Graph.new('AB5')

    expect do
      Route.new(graph)
    end.to raise_error(InvalidRouteException)
  end
end
