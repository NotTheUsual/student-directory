# Let's put all the students into an array
students = [
	{:name => "Abraham Thomas", :cohort => :november},
	{:name => "Andrey Krahmal", :cohort => :november},
	{:name => "Ayaz Goulamabasse", :cohort => :november},
	{:name => "Berta Gutierrez", :cohort => :november},
	{:name => "Biwek Shrestha", :cohort => :november},
	{:name => "Colin Frankish", :cohort => :november},
	{:name => "James Hunter", :cohort => :november},
	{:name => "Jorja Hung", :cohort => :november},
	{:name => "Kalle Malmiharju", :cohort => :november},
	{:name => "Liviu Cojocar", :cohort => :november},
	{:name => "Makis Otman", :cohort => :november},
	{:name => "Megan Folsom", :cohort => :november},
	{:name => "Nabin", :cohort => :november},
	{:name => "Peter Saxton", :cohort => :november},
	{:name => "Rolando Barbella", :cohort => :november},
	{:name => "Roy Gardiner", :cohort => :november}
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------"
end

def print_names(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

# nothing happens until we call the methods
print_header
print_names(students)
print_footer(students)

# reached "Adding more information about the student"