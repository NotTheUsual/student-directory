# Directory file including all/most of the challenge stuff
def print_header
	print "-".center(50, '-') + "\n"
	print "The students of my cohort at Makers Academy".center(50) + "\n"
	print "-".center(50, '-') + "\n"
end

def print_names(students)
	count = 0
	while count < students.length
		if students[count][:name].length < 12 # Also, if students[count][:name][0].capitalise == 'A'
			puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)".center(50)
			puts "They enjoy #{students[count][:hobbies]}.".center(50)
			puts "They were born in #{students[count][:country]}.".center(50)
			puts "They are #{students[count][:height]} tall.".center(50)
			puts "-".center(50, '-')
		end
		count += 1
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students".center(50)
	puts "-".center(50, '-')
end

def input_students(cohort_list)
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
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
		puts "Now we have #{students.length} students"
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
students = input_students(cohort_list)
print_header
print_names(students)
print_footer(students)