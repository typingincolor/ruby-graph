require 'spec_helper'

describe Route do
	it "cannot create an empty route" do
		graph = Graph.new("AB5")

		expect {
			Route.new(graph)
		}.to raise_error(InvalidRouteException)
	end

	it "cannot create an route with one town" do
		graph = Graph.new("AB5")

		expect {
			Route.new(graph)
		}.to raise_error(InvalidRouteException)
	end

	it "cannot create an route with no graph" do
		expect {
			Route.new("ddddd")
		}.to raise_error(InvalidRouteException)
	end

	it "has next when at start of route" do
		graph = Graph.new("AB5")
		route = Route.new(graph, "A", "B")

		expect(route.has_next?).to be true
	end

	it "stops a route that starts at an invalid location being created" do
		graph = Graph.new("AB5")
		
		expect {
			Route.new(graph, "C", "B")
		}.to raise_error(InvalidRouteException)
	end

	it "can walk a route" do
		graph = Graph.new("AB5")
		route = Route.new(graph, "A", "B")

		expect(route.next).to eq("B")
	end

	it "stops when at the end of route" do
		graph = Graph.new("AB5")
		route = Route.new(graph, "A", "B")

		expect(route.next).to eq("B")

		expect {
			route.next
		}.to raise_error(EndOfRouteException)
	end
end