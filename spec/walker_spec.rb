require 'spec_helper'

describe Walker do
	it 'can walk a route between two towns' do
		graph = Graph.new('AB5')
		route = Route.new('A', 'B')
		walker = Walker.new(graph, route)

		expect(walker.walk).to eq({:distance => 5})
	end

	it 'can walk a route between two towns' do
		graph = Graph.new('AB5,BC4')
		route = Route.new('A', 'B', 'C')
		walker = Walker.new(graph, route)

		expect(walker.walk).to eq({:distance => 9})
	end

	it 'fails when the start town is invalid' do
		graph = Graph.new('AB5,BC4')
		route = Route.new('D', 'B', 'C')
		walker = Walker.new(graph, route)

		expect {walker.walk}.to raise_error(NoSuchRouteException)
	end

	it 'fails when the second town is invalid' do
		graph = Graph.new('AB5,BC4')
		route = Route.new('A', 'D', 'C')
		walker = Walker.new(graph, route)

		expect{walker.walk}.to raise_error(NoSuchRouteException)
	end
end
