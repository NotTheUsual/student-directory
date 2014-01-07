# Let's put all the students into an array
students = [
	"Abraham Thomas",
	"Andrey Krahmal",
	"Ayaz Goulamabasse",
	"Berta Gutierrez",
	"Biwek Shrestha",
	"Colin Frankish",
	"James Hunter",
	"Jorja Hung",
	"Kalle Malmiharju",
	"Liviu Cojocar",
	"Makis Otman",
	"Megan Folsom",
	"Nabin",
	"Peter Saxton",
	"Rolando Barbella",
	"Roy Gardiner"
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------"
end

def print_names(names)
	names.each do |name|
		puts name
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

# nothing happens until we call the methods
print_header
print_names(students)
print_footer(students)