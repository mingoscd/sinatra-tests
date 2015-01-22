# SL10. The online calculator

# So, our Online Calculator will:
# * Have a home page (‘/‘) where you see all four available operations: add, substract, multiply and divide. Pretty simple stuff.
# * For each one of the available operations, we will have a form with two input fields and a button, which will go to another URL/route and
# display the result, like “The multiplication of 4 and 15 is 60” or “The addition of 10 and 39 is 49".

# Feel free to add more features! :D
require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :port, 3000
set :bind, '0.0.0.0'

get '/' do 
	erb :calc
end

get '/counting' do
	erb :counting
end

post '/add' do 
	@n1 = params[:n1]
	@n2 = params[:n2]
	@operation = "addition"
	@result = @n1.to_i + @n2.to_i
	erb :result
end

post '/subs' do 
	@n1 = params[:n1]
	@n2 = params[:n2]
	@operation = "substraction"
	@result = @n1.to_i - @n2.to_i
	erb :result
end

post '/multiply' do 
	@n1 = params[:n1]
	@n2 = params[:n2]
	@operation = "multiplication"
	@result = @n1.to_i * @n2.to_i
	erb :result
end

post '/divide' do 
	@n1 = params[:n1]
	@n2 = params[:n2]
	@operation = "division"
	@result = @n1.to_i / @n2.to_i
	erb :result
end
