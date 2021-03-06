require 'simplecov'
SimpleCov.start do
  add_filter do |src|
    !(src.filename =~ /^#{SimpleCov.root}\/lib/)
  end
end

require_relative '../lib/trains/graph'
require_relative '../lib/trains/route'
require_relative '../lib/trains/traveller'
require_relative '../lib/trains/route_finder_template'
require_relative '../lib/trains/route_finder'
require_relative '../lib/trains/shortest_route_finder'
require_relative '../lib/trains/routes_with_specific_number_of_stops_finder'
require_relative '../lib/trains/routes_with_maximum_distance_finder'
require_relative '../lib/trains/duplicate_route_exception'
require_relative '../lib/trains/invalid_route_exception'
require_relative '../lib/trains/end_of_route_exception'
require_relative '../lib/trains/no_such_route_exception'
require_relative '../lib/trains/no_routes_found_exception'
require_relative '../lib/trains/visited_towns'
