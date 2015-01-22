# OC4. IronhackLIST
require 'rubygems'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

set :port, 3000
set :bind, '0.0.0.0'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'students.sqlite'
)

class Student < ActiveRecord::Base

  validates_presence_of :name, :surnames, :first_programming_experience, :birthday
  validates_numericality_of :number_of_dogs, greater_than: 0
  validates_format_of :website, with: /\Ahttp:/

end

get '/' do
	@list = Student.all
	erb :ihlist
end

post '/add_student' do
	s= Student.new(name: params[:name], surnames: params[:surnames],birthday: params[:birthday],number_of_dogs: params[:number_of_dogs], website: params[:website],first_programming_experience: params[:first_programming_experience])	
	s.save
	redirect('/')
end