# STUDENT DIRECTORY

This is a project I worked through over the first two weeks at Makers Academy. In its various forms, it allows you to enter and view a list of students enrolled on the course. Because I was bad at version control, each new chunk has its own file. The most important file is 'directory-week-2.rb', as it has all the main functionality, but if you want to know more about the other files, well, here's what they can do and how.

## directory.rb

This was the introduction to the project.

```shell
$ ruby directory.rb
```

It asks you to enter all the names, one by one, before letting you end by entering a blank name. It then prints out the names of the students. Simple.

```shell
Please enter the names of the students
To finish, just hit return twice
> James
Now we have 1 students
> Alex
Now we have 2 students
> 
The students of my cohort at Makers Academy
-------------
James (january cohort)
Alex (january cohort)
Overall, we have 6 great students
```

## directory-challenges.rb

Once we'd completed the main functionality, we were then set additional challenges. Some of these were slightly contradictory, which is why there's so much text commented out (again, I promise I know better now). They included not using `puts`, implementing various filters, adding additional information, grouping by cohort and implementing your own version of `chomp`. Many of these were completed pairing with @plawtr. In its current form, it simply groups all the students by cohort and works a little as follows: 

```shell
$ ruby directory-challenges.rb
```

First, it'll present a menu, asking you whether you want to enter students, print students or exit. Press '1', '2' or '9' to get the corresponding option. If you hit '1' you'll be asked to enter a student's name as before, but you'll also get various other fields to fill in, too. Again, submit an empty name to end the process. When you subsequently hit '2', you'll see all the names you entered, grouped by cohort. '9' will exit everything.

```shell
1. Input the students
2. Show the students
9. Exit
> 1
Please enter the names of the students
To finish, just hit return twice
> James
What cohort are they in? (Default is January)
> January
What hobbies do they have?
> Sports
Where were they born?
> London
How tall are they?
> Tall
Now we have 1 student
Please enter the names of the students
To finish, just hit return
> 
1. Input the students
2. Show the students
9. Exit
> 2
=============================================================================================
=============================  THE STUDENTS OF MAKERS ACADEMY  ==============================
=============================================================================================
-------------------------------------  January Cohort  --------------------------------------
---------------------------------------------------------------------------------------------
   Name                Hobbies             Place of Birth      Height    
---------------------------------------------------------------------------------------------
1. James               Sports              London              Tall      
---------------------------------------------------------------------------------------------
                              Overall, we have 1 great student                               
---------------------------------------------------------------------------------------------
1. Input the students
2. Show the students
9. Exit
> 9
```

I was working on a way to give options to activate various filters in the menu (all the actual functionality's there), but apparently never got round to finishing it.

## typos.rb

This was a challenge to correct typos in a document without consulting Google. Seems to be working.

## directory-week-2.rb

OK, now, this version has everything working properly. You can select various filtering options, the code's much nicer and you can also save to and load from a students.csv file.

```shell
$ ruby directory-challenges.rb
```

So, we start with a new menu. '1' works much as before. '2' shows all the students. '3' shows all the students grouped by cohort, as was the default in the previous version. '4' will ask you for a letter to filter by, before showing only the students whose names begin with that letter. '5' saves the current list of students to (and creates if necessary, I think) a file named 'students.csv'. '6' will load a list of students from that file if it exists. '9' will exit, as usual.

```shell
1. Input the students
2. Show the students
3. Show the students listed by cohort
4. Show students filtered by the first letter of their name
5. Save the list to students.csv
6. Load the list from students.csv
9. Exit
> 1
Please enter the name of a student
To finish, just hit return
> James
What cohort are they in? (Default is January)
> January
What hobbies do they have?
> Coding
Where were they born?
> London
How tall are they?
> 6'-ish
Now we have 1 student
Please enter the name of another student
To finish, just hit return
> 
...
> 4
Enter the letter you want to filter by
> J
=============================================================================================
=============================  THE STUDENTS OF MAKERS ACADEMY  ==============================
=============================================================================================
   Name           Cohort                   Hobbies             Place of Birth      Height    
---------------------------------------------------------------------------------------------
1. James          January cohort           Coding              London              6'-ish    
---------------------------------------------------------------------------------------------
                              Overall, we have 1 great student                               
---------------------------------------------------------------------------------------------
...
> 4
Enter the letter you want to filter by
> A
=============================================================================================
=============================  THE STUDENTS OF MAKERS ACADEMY  ==============================
=============================================================================================
   Name           Cohort                   Hobbies             Place of Birth      Height    
---------------------------------------------------------------------------------------------
                              Overall, we have 1 great student                               
---------------------------------------------------------------------------------------------
...
> 5
```

Which should leave students.csv looking like: 

```csv
James,January,Coding,London,6'-ish
```

I also worked on a version of this with @CrowdHailer (based on his first week code), but I think all the main functionality we added together was later incorporated here. Still, that can be found (here)[https://github.com/NotTheUsual/Student-Directory-1]