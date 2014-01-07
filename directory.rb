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

# and then print them
puts "The students of my cohort at Makers Academy"
puts "-------------"
students.each do |student|
	puts student
end

# Finally, we print the total
puts "Overall, we have #{students.length} great students"
