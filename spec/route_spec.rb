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

	it "can get the first town on a route" do
		graph = Graph.new("AB5")
		route = Route.new(graph, "A", "B")

		expect(route.next).to eq("A")
	end
end