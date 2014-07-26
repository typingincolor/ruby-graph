require 'spec_helper'

describe Traveller do
	it 'can walk a route between two towns' do
		graph = Graph.new('AB5')
		route = Route.new('A', 'B')
		traveller = Traveller.new(graph, route)

		expect(traveller.travel).to eq({:distance => 5})
	end

	it 'can walk a route between two towns' do
		graph = Graph.new('AB5,BC4')
		route = Route.new('A', 'B', 'C')
		traveller = Traveller.new(graph, route)

		expect(traveller.travel).to eq({:distance => 9})
	end

	it 'fails when the start town is invalid' do
		graph = Graph.new('AB5,BC4')
		route = Route.new('D', 'B', 'C')
		traveller = Traveller.new(graph, route)

		expect {traveller.travel}.to raise_error(NoSuchRouteException)
	end

	it 'fails when the second town is invalid' do
		graph = Graph.new('AB5,BC4')
		route = Route.new('A', 'D', 'C')
		traveller = Traveller.new(graph, route)

		expect{traveller.travel}.to raise_error(NoSuchRouteException)
	end
end
