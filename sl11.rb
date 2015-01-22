# SL11. The big user brother

# Drones for everything. Control. 1984. Like the novel? No, reality! We are constantly being watched, so at least brush your hair perfectly!

# The thing is, some an activist hacker organization hires you to design a platform were everyone can sign up and, more importantly,
# ¡everyone can see everyone! If the government has this power, everyone should!

# So. Implement a Sinatra web application where:
# - In “/“, you can see the list of users (showing their name) that have signed up and the number of users.
# - Also in “/“, there’s a form (pointing to “/signup”) with which you can sign up yourself. After you sign up, your user id (and your
# id only) is saved in session, and you can see it in the top (hint: use an internal data structure were you can save ids with their corresponding names and, important: ids should be incremental and not repeat).
# - There also a “/cats” page, linked from “/“, with five pictures of cats of your choice. Do your best!
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

enable :sessions
set :port, 3000
set :bind, '0.0.0.0'

get '/' do
	session[:users] = [] unless session[:users]
	@users = session[:users]
	erb :show_users
end

post '/signup' do
	session[:users] << params[:nick]
	redirect('/')
end

get '/cats' do
	erb :cats
end