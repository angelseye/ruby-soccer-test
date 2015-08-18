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
		CSV.read(file, {headers: true, header_converters: :symbol})
	end



	# returns team with the smallest goal difference
	def self.smallest_goal_difference(data)
		# compare and contrast for smallest difference
		team = data.dup.sort { |x,y|  goal_diff(x) <=> goal_diff(y) }

		# return data
		puts ""
		puts "Team with the smallest goal difference between 'for' and 'against' goals: " + team[0][:team]
		puts ""
	end



	# function to process goal difference sorting
	def self.goal_diff(z)
		# vars
		goals = z[:goals].to_i
		goals_allowed = z[:goals_allowed].to_i
		# figure out difference
		diff = goals - goals_allowed
		# make positive if negative
		diff = diff * -1 if diff < 0
		return diff
	end



	# returns top 10 teams with highest win percentage
	def self.top_ten_win_percentage(data)
		# grab top 10 teams
		results = data.dup.sort{ |x,y| win_pct(x) <=> win_pct(y) }.reverse
		
		# return data
		puts ""
		puts "Top 10 teams by win percentage (%):"
		format = '%-3s %-15s'
		i=0
		n=1
		while i < 10 do
			puts format % [ n, results[i][:team] ]
			i+=1
			n+=1
		end
		puts ""
	end



	# win percentage
	def self.win_pct(z)
		# vars
		games = z[:games].to_f
		wins = z[:wins].to_f
		draws = z[:draws].to_f
		# calculate pct
		((wins + (draws/2)) / games) * 100
	end



	# returns fulls stats by most draws
	def self.most_draws(data)
		# get record of team with most draws
		sorted = data.dup.sort_by{ |i| i.values_at(:draws).reverse }
		row = sorted[0]
		# return data
		puts ""
		puts "Team with the most draws (full stats):"
		format = '%-20s %-6s %-5s %-7s %-6s %-6s %-14s %-7s'
		puts format % ["Team", "Games", "Wins", "Losses", "Draws", "Goals", "Goals Allowed", "Points"]
		puts format % [row[:team], row[:games], row[:wins], row[:losses], row[:draws], row[:goals], row[:goals_allowed], row[:points] ]
		puts ""
	end


end




file = 'soccer.csv'
Soccer.stats(file)

