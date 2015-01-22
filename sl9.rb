require 'sinatra'
require 'sinatra/reloader'

set :port, 3000
set :bind, '0.0.0.0'

class SongList
	attr_accessor :song_list
	def initialize
		@song_list = []
	end

	def add_song(name,artist)
		@song_list << { name: name, artist: artist }
	end

	def get_artist(artist)
		artist_list = @song_list.select { |item| item[:artist] == artist }
	end

	def searcher(query)
		list = @song_list.select { |item| item[:artist].include?(query) || item[:name].include?(query) }
	end
end

app = SongList.new

get '/' do
	@song_list = app.song_list
	erb :spotinatra
end

get '/enough' do
	erb :enough
end

post '/songs/new' do
	name = params[:name]
	artist = params[:artist]

	redirect('/enough') if app.song_list.size == 10

	app.add_song(name,artist)
	@song_list = app.song_list
	redirect('/')
end

get '/artist/:artist' do
	@song_list = app.get_artist(params[:artist])
	erb :spotinatra
end

get '/search' do 
	@song_list = app.searcher(params[:q])
	erb :spotinatra
end
