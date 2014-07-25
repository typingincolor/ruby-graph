require 'spec_helper'

describe "acceptance tests" do
	it "passes test case 1" do
		graph = Graph.new("AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7")
		route = Route.new(graph, "A", "B", "C")

		expect(route.get_distance).to eq(9)
	end

	it "passes test case 2" do
		graph = Graph.new("AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7")
		route = Route.new(graph, "A", "D")

		expect(route.get_distance).to eq(5)
	end

	it "passes test case 3" do
		graph = Graph.new("AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7")
		route = Route.new(graph, "A", "D", "C")

		expect(route.get_distance).to eq(13)
	end

	it "passes test case 4" do
		graph = Graph.new("AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7")
		route = Route.new(graph, "A", "E", "B", "C", "D")

		expect(route.get_distance).to eq(22)
	end

	it "passes test case 5" do
		graph = Graph.new("AB5,BC4,CD8,DC8,DE6,AD5,CE2,EB3,AE7")
		route = Route.new(graph, "A", "E", "D")

		expect{route.get_distance}.to raise_error(NoSuchRouteException)
	end
end