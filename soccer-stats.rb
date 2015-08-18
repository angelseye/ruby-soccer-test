######################################
#
#	Ruby Soccer Test
#	Ashley Wilson
#	August 18, 2015
#
#	An exercise to read data from a CSV
#	file and then display stats to the
#	console for the reader.
#
######################################

require 'CSV'


class Soccer


	# Main function for facilitating stats to show
	def self.stats(file)
		# turn file into data object
		data = get_data_from_file(file)
		# team with the smallest difference in 'for' and 'against' goals
		smallest_goal_difference(data)
		# list of the top 10 teams with the highest win percentage
		top_ten_win_percentage(data)
		# Full stats for the team with the most draws (include all columns available in CSV file)
		most_draws(data)
	end



	# Gets a data object from a given file
	def self.get_data_from_file(file)
		# read file and return
		CSV.read(file)
	end



	# returns team with the smallest goal difference
	def self.smallest_goal_difference(data)
		# remove headers
		
		# compare and contrast for smallest difference
		team = data[1][0]

		# return data
		puts ""
		puts "Team with the smallest goal difference between 'for' and 'against': " + team
		puts ""
	end



	# returns top 10 teams with highest win percentage
	def self.top_ten_win_percentage(data)
		# read data

		# grab top 10 teams
		results = "teams go here"
		
		# return data
		puts ""
		puts "Top 10 teams by win percentage (%):"
		puts results
		puts ""
	end



	# returns fulls stats by most draws
	def self.most_draws(data)
		# read data
		# get record of team with most draws
		row = data[2]
		# return data
		puts ""
		puts "Team with the most draws (full stats):"
		puts row.inspect
		puts ""
	end


end




file = 'soccer.csv'
Soccer.stats(file)

