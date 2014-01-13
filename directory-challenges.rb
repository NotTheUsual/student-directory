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
				#print "#{students[count][:cohort]} cohort".ljust(25) unless filtered_by_month
				filtered_by_month ? print(" ".ljust(5)) : print("#{students[count][:cohort]} cohort".ljust(25))
				print "#{students[count][:hobbies]}".ljust(20)
				print "#{students[count][:country]}".ljust(20)
				puts "#{students[count][:height]}".ljust(10)
				#puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)".center(50)
				#puts "They enjoy #{students[count][:hobbies]}.".center(50) unless students[count][:hobbies] == ""
				#puts "They were born in #{students[count][:country]}.".center(50) unless students[count][:country] == ""
				#puts "They are #{students[count][:height]} tall.".center(50) unless students[count][:height] == ""
				puts "".center(93, '-')
			end
			count += 1
		end
		# puts "-".center(50, '-')
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great student#{names.length == 1 ? "" : "s"}".center(93)
	puts "-".center(93, '-')
end

def input_students(cohort_list)
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	# create an empty array
	students = []
	# get the first name
	name = new_chomp(gets)
	# while the name is not empty, repeat this code
	while !name.empty? do
		# check for cohort
		puts "What cohort are they in? (Default is January)"
		fixed_cohort = get_cohort(cohort_list)

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
		students << {name: name, cohort: fixed_cohort, hobbies: hobbies, country: country_of_birth, height: height}
		puts "Now we have #{students.length} student" + (students.length == 1 ? "" : "s")
		puts "Please enter the names of the students"
		puts "To finish, just hit return"
		# get another name from the user
		name = gets.chomp
	end	

	# return the array of students
	students
end

def get_cohort(cohort_list)
	# ask for the cohort
	cohort = gets.chomp.slice(0,3)
	formatted_cohort = cohort.capitalize
	return cohort_list[formatted_cohort] if cohort_list[formatted_cohort] 
	puts "That doesn't look a real month. Please try again."
	get_cohort(cohort_list)
end

def print_by_cohort(students)
	Date::MONTHNAMES.each do |month|
		if !month.nil?
			print_names(students.select{|entry| entry[:cohort] == month.intern}, true, month)
		end
	end 
end

def new_chomp(input)
	is_penultimate_char_carriage = (input[-2] == "\r") or (input[-2] == "\n")
	#chop off the last character and penultimate character if it is a carriage return
	input.slice(0...(-1*(is_penultimate_char_carriage ? 2 : 1)))
end

def print_everything(students, cohort_list)
	unless students.empty?
		print_header
		print_by_cohort(students)
		# print_names(students)
		print_footer(students)
	else
		puts "No students in directory, sorry."
	end
end

def interactive_menu(cohort_list)
	students = []
	loop do
		# 1. Print the menu and as the user what to do
		puts "1. Input the students"
		puts "2. Show the students"
		puts "9. Exit"
		# 2. Read the input and save it into a variable
		selection = gets.chomp
		# 3. Do what the user has asked
		case selection
		when "1"
			students = input_students(cohort_list)
		when "2"
			print_everything(students, cohort_list)
		when "9"
			exit
		else
			puts "I don't know what you meant, try again"
		end
	end
end



# All the current available cohorts
cohort_list = {
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

interactive_menu(cohort_list)