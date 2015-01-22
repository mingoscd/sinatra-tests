# SL11. Valid students are valid students

# 3. Once all the specs pass add some more validations of your own. For example, we won’t accept students born before 1970 that have more
# than one dog, and we also won’t accept students which have “Xavier” name, because we want him to be the only Xavier in Ironhack <3 (repeat
# the same with “Nick”, because we love him starting at us doing yoga)
# 4. Finally, remove all the ActiveRecord validations and implement them on your own with the “validate” DSL method. Let’s go, folks!

# Note: you will find a student.rb template file and the student.sqlite database in Slack.
require 'sinatra'
require 'sinatra/reloader'
require 'rubygems'
require 'date'
# require 'active_record'

# ActiveRecord::Base.establish_connection(
#   adapter: 'sqlite3',
#   database: 'students.sqlite'
# )

class Student #< ActiveRecord::Base

  AGE_MINIMUM = 11

  validate :proper_age
  validates_numericality_of :number_of_dogs, greater_than: 0
  validate :proper_age

  private

  def proper_age
    max_age = Date.today.year - 1970
    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
    unless birthday > max_age.years.ago && :number_of_dogs > 1
      errors.add(:birthday, 'is too old')
    end
  end

  def proper_name
    validates_presence_of :name, :surnames
    if :name == "Xavier"
      errors.add(:name, 'only can exist one Xavier at Ironhack')
    end
  end

  def complete_name(name,surname)
  	return nil unless name.is_a?(String)
  	return nil unless surname.is_a?(String)
  	name + " " + surname
  end
end


describe 'Student' do
	before do
		@student = Student.new
    @student.name = "Jose"
    @student.surname = "Ring"
    @student.birthday = Date.new(1991,19,1)
    @student.number_of_dogs = 1
	end	
	describe 'complete_name' do
		it "should return the complete name when the parameters are 2 strings" do
			expect(Student.new.complete_name("name","surname")).to eq("name surname")
		end
		it "should return nil if any of them is not an string" do
			expect(Student.new.complete_name("name",1)).to eq(nil)
		end
	end
  describe 'Manual validation' do

  end
end