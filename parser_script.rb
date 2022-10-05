require './lib/parser.rb'

file = ARGV.last
new_parser = Parser.new(file:)
new_parser.parse_log_file
new_parser.read_views
