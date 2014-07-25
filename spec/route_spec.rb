require 'spec_helper'

describe Route do
	it "cannot create an empty route" do
		graph = Graph.new("AB5")

		expect {
			Route.new(graph)
		}.to raise_error(InvalidRouteException)
	end
end

describe Route do
	it "cannot create an route with one town" do
		graph = Graph.new("AB5")

		expect {
			Route.new(graph)
		}.to raise_error(InvalidRouteException)
	end
end

describe Route do
	it "cannot create an route with no graph" do
		expect {
			Route.new("ddddd")
		}.to raise_error(InvalidRouteException)
	end
end