# Directory file including all/most of the challenge stuff
def print_header
	print "The students of my cohort at Makers Academy\n"
	print "-------------\n"
end

def print_names(students)
	#students.each_with_index do |student, index|
	#	puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
	#end
	count = 0
	while count < students.length
		puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)"
		count += 1
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :january}
		puts "Now we have #{students.length} students"
		# get another name from the user
		name = gets.chomp
	end
	# return the array of students
	students
end

# nothing happens until we call the methods
students = input_students
print_header
print_names(students)
print_footer(students)