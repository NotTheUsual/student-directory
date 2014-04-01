# Directory file including all/most of the challenge stuff

require 'date'

def print_header
	print "".center(93, '=') + "\n"
	print "  THE STUDENTS OF MAKERS ACADEMY  ".center(93, '=') + "\n"
	print "".center(93, '=') + "\n"
end

def print_names(students, conditions = nil, month = :January)
	unless students.empty?
		if conditions && conditions.include?("with_cohort_filter")
			puts "  #{month} Cohort  ".center(93, '-')
			puts "".center(93, '-')
		end
		print "   " + "Name".ljust(15)
		conditions && conditions.include?("with_cohort_filter") ? print(" ".ljust(25)) : print("Cohort".ljust(25))
		print "Hobbies".ljust(20) + "Place of Birth".ljust(20) + "Height".ljust(10) + "\n"		
		puts "-".center(93, '-')

		students.each_with_index do |student, i|
			if conditions && conditions.include?("with_letter_filter")
				print_line(student, i, conditions) if student[:name][0].capitalize == @letter
			else
				print_line(student, i, conditions)
			end
		end
	end
end

def print_line(student, i, conditions = nil)
	print "#{i + 1}. " + "#{student[:name]}".ljust(15)
	conditions && conditions.include?("with_cohort_filter") ? print("".ljust(25)) : print("#{student[:cohort]} cohort".ljust(25))
	print "#{student[:hobbies]}".ljust(20)
	print "#{student[:country]}".ljust(20)
	puts "#{student[:height]}".ljust(10)
	puts "".center(93, '-')
end

def print_footer
	puts "Overall, we have #{@students.length} great student#{@students.length == 1 ? "" : "s"}".center(93)
	puts "-".center(93, '-')
end

def input_students
	puts "Please enter the name of a student"
	puts "To finish, just hit return"
	# get the first name
	name = STDIN.gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# check for cohort
		puts "What cohort are they in? (Default is January)"
		fixed_cohort = get_cohort
		# check for hobbies
		puts "What hobbies do they have?"
		hobbies = STDIN.gets.chomp
		# check for country of birth
		puts "Where were they born?"
		country_of_birth = STDIN.gets.chomp
		# height
		puts "How tall are they?"
		height = STDIN.gets.chomp

		# add the student hash to the array
		@students << {name: name, cohort: fixed_cohort, hobbies: hobbies, country: country_of_birth, height: height}
		puts "Now we have #{@students.length} student" + (@students.length == 1 ? "" : "s")
		# get another name from the user
		puts "Please enter the name of another student"
		puts "To finish, just hit return"
		name = STDIN.gets.chomp
	end	
end

def get_cohort
	# ask for the cohort
	cohort = STDIN.gets.chomp.slice(0,3)
	formatted_cohort = cohort.capitalize
	return @cohort_list[formatted_cohort] if @cohort_list[formatted_cohort] 
	puts "That doesn't look a real month. Please try again."
	get_cohort(cohort_list)
end

def print_by_cohort
	Date::MONTHNAMES.each do |month|
		if !month.nil?
			print_names(@students.select{|entry| entry[:cohort] == month.intern}, ["with_cohort_filter"], month)
		end
	end 
end

def print_everything(conditions = nil, letter = nil)
	unless @students.empty?
		print_header
		if conditions && conditions.include?("with_cohort_filter")
			print_by_cohort
		elsif conditions && conditions.include?("with_letter_filter")
			print_names(@students, ["with_letter_filter"])
		else
			print_names(@students)
		end
		print_footer
	else
		puts "No students in directory, sorry."
	end
end

def print_by_letter
	puts "Enter the letter you want to filter by"
	@letter = STDIN.gets.slice(0,1)
	print_everything(["with_letter_filter"])
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Show the students listed by cohort"
	puts "4. Show students filtered by the first letter of their name"
	puts "5. Save the list to students.csv"
	puts "6. Load the list from students.csv"
	puts "9. Exit"
end

def process(selection)
	case selection
	when "1"
		input_students
	when "2"
		print_everything
	when "3"
		print_everything(["with_cohort_filter"])
	when "4"
		print_by_letter
	when "5"
		save_students
	when "6"
		load_students
	when "9"
		exit
	else
		puts "I don't know what you meant, try again"
	end
end

def interactive_menu
	try_load_students
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort, hobbies, country, height = line.chomp.split(',')
		@students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country: country, height: height}
	end
	file.close
end

def save_students
	# Open the file for writing
	file = File.open("students.csv", "w")
	# Iterate over the array of students
	@students.each do |student|
		student_data = [student[:name],student[:cohort],student[:hobbies],student[:country],student[:height]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def try_load_students
	filename = ARGV.first # First argument from the command line
	return if filename.nil? # Get out of the method if it isn't given
	if File.exists?(filename) # Check the file exists
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else # If it doesn't exist
		puts "Sorry, #{filename} doesn't exist"
		exit # Quit the program
	end
end

# Empty students array
@students = []
# All the current available cohorts
@cohort_list = {
	"" => :January, 
	"Jan" => :January, 
	"Feb" => :February, 
	"Mar" => :March,
	"Apr" => :April,
	"May" => :May,
	"Jun" => :June,
	"Jul" => :July,
	"Aug" => :August,
	"Sep" => :September,
	"Oct" => :October,
	"Nov" => :November,
	"Dec" => :December
}
# Letter
@letter = nil

# nothing happens until we call the methods
#students = input_students(cohort_list)
#print_everything(students, cohort_list)

interactive_menu