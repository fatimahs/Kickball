require 'sinatra'
require 'csv'
require 'pry'

# get info from cvs and connnect sinatra
players = []

CSV.foreach('lackp_starting_rosters.csv', headers:true) do |row|
  players << row.to_hash
end

#path from csv to sinatra
get '/team/:team_name' do
  @team = params[:team_name] #gets team name from url
  @members = players.select{|player| player['team'] == @team} #filters out the team info we are searching
  erb :team #returns team info
 end




get '/position/:position_title' do
  @positions = params[:position_title] #gets position from url
  @spot = players.select{|player| player['position'] == @positions} #filters out the player info we are searching
  erb :position #returns player info
 end
