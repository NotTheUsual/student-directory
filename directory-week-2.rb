# Directory file including all/most of the challenge stuff

require 'date'

def print_header
	print "".center(93, '=') + "\n"
	print "  THE STUDENTS OF MAKERS ACADEMY  ".center(93, '=') + "\n"
	print "".center(93, '=') + "\n"
end

def print_names(students, filtered_by_month = false, month = :January)
	count = 0
	unless students.empty?
		if filtered_by_month
			puts "  #{month} Cohort  ".center(93, '-')
			puts "".center(93, '-')
		end
		print "   " + "Name".ljust(15)
		filtered_by_month ? print(" ".ljust(5)) : print("Cohort".ljust(25))
		print "Hobbies".ljust(20) + "Place of Birth".ljust(20) + "Height".ljust(10) + "\n"
		
		puts "-".center(93, '-')
		while count < students.length
			if students[count][:name].length < 12 # Also, if students[count][:name][0].capitalise == 'A'
				print "#{count+1}. " + "#{students[count][:name]}".ljust(15)
				filtered_by_month ? print(" ".ljust(5)) : print("#{students[count][:cohort]} cohort".ljust(25))
				print "#{students[count][:hobbies]}".ljust(20)
				print "#{students[count][:country]}".ljust(20)
				puts "#{students[count][:height]}".ljust(10)
				puts "".center(93, '-')
			end
			count += 1
		end
		# puts "-".center(50, '-')
	end
end

def print_footer
	puts "Overall, we have #{@students.length} great student#{@students.length == 1 ? "" : "s"}".center(93)
	puts "-".center(93, '-')
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# check for cohort
		puts "What cohort are they in? (Default is January)"
		fixed_cohort = get_cohort

		# check for hobbies
		puts "What hobbies do they have?"
		hobbies = gets.chomp
		# check for country of birth
		puts "Where were they born?"
		country_of_birth = gets.chomp
		# height
		puts "How tall are they?"
		height = gets.chomp

		# add the student hash to the array
		@students << {name: name, cohort: fixed_cohort, hobbies: hobbies, country: country_of_birth, height: height}
		puts "Now we have #{@students.length} student" + (@students.length == 1 ? "" : "s")
		puts "Please enter the names of the students"
		puts "To finish, just hit return"
		# get another name from the user
		name = gets.chomp
	end	

	# return the array of students
	@students
end

def get_cohort
	# ask for the cohort
	cohort = gets.chomp.slice(0,3)
	formatted_cohort = cohort.capitalize
	return @cohort_list[formatted_cohort] if @cohort_list[formatted_cohort] 
	puts "That doesn't look a real month. Please try again."
	get_cohort(cohort_list)
end

def print_by_cohort
	Date::MONTHNAMES.each do |month|
		if !month.nil?
			print_names(@students.select{|entry| entry[:cohort] == month.intern}, true, month)
		end
	end 
end

def print_everything
	unless @students.empty?
		print_header
		print_by_cohort
		# print_names
		print_footer
	else
		puts "No students in directory, sorry."
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def process(selection)
	case selection
	when "1"
		input_students
	when "2"
		print_everything
	when "3"
		save_students
	when "4"
		load_students
	when "9"
		exit
	else
		puts "I don't know what you meant, try again"
	end
end

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def load_students
	file = File.open("students.csv", "r")
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

# nothing happens until we call the methods
#students = input_students(cohort_list)
#print_everything(students, cohort_list)

interactive_menu