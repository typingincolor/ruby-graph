require_relative("./duplicate_route_exception")

class Graph
	def initialize(graph)
		@nodes = Hash.new(0)
		lines = graph.split(",")

		lines.each do |x|
			add_line x
		end
	end

	def add_line(line)
		startPoint = line[0]
		endPoint = line[1]
		distance = line[2].to_i

		@nodes[startPoint] = Array.new unless @nodes[startPoint].is_a? Array

		@nodes[startPoint].each do |existing_line|
			if existing_line[:town] == endPoint
				raise DuplicateRouteException
			end
		end

		@nodes[startPoint].push({:town => endPoint, :distance => distance})
	end

	def get_nodes
		@nodes
	end
end