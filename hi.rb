require 'sinatra'
require 'sinatra/reloader'

set :port, 3000
set :bind, '0.0.0.0'

visits ||= 0

get '/' do
	visits += 1
	if visits >= 5
  		"Hello World!"
  	else
  		"Try again"
  	end
end