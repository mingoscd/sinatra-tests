# 3. GET '/info' will get all the information for a specific movie or TV show: name, year of release, cast members... you name it

require 'sinatra'
require 'sinatra/reloader'
require 'imdb'

set :port, 3000
set :bind, '0.0.0.0'

def top_x(n)
    top_rating = Imdb::Top250.new
    [*0 .. n - 1].map do |item|
      	x = top_rating.movies[item].title.gsub("\n","")
      	x.slice(5,x.size-1)
    end
end

def rating_by_id(id)
	movie = Imdb::Movie.new(id)
	@name = movie.title
	@rating = movie.rating
end

def rating_by_name(name)
	query = Imdb::Search.new(name)
    query = query.movies.first
    movie = Imdb::Movie.new(query.id)
    @name = name
	@rating = movie.rating
end

def info(name)
	query = Imdb::Search.new(name)
    query = query.movies.first
    movie = Imdb::Movie.new(query.id)
    @info = { name: movie.title, summary: movie.plot_summary, poster: movie.poster, cast_members: movie.cast_members, rating: movie.mpaa_rating}
end

get '/warning' do
	"This movie is such bad as programming machine code for all your life"
end

get '/top250' do
	num = params[:limit] ? params[:limit] : 250
	@list = top_x(num.to_i)	
	erb :top250
end

get '/rating' do
	if params[:id]
		rating_by_id(params[:id])
	elsif params[:name]
		rating_by_name(params[:name])
	end
	@rating > 5 ? erb(:rating) : erb(:warning)
end

get '/info/:movie' do
	info(params[:movie])
	erb :info
end

