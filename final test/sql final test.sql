create database final_test ;
use final_test;


CREATE TABLE Students (
student_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
age INT,
grade_level VARCHAR(10),
city VARCHAR(50)
);

CREATE TABLE Courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
instructor VARCHAR(50)
);

CREATE TABLE Enrollments (
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

#1. Retrieve all columns and rows from the Students table
select * from students;

#2. Retrieve all students ordered by their last name in ascending order
select * from students order by last_name asc;
#3. Retrieve all students ordered by their last name in descending order
select * from students order by last_name desc;
#4. Retrieve all students who are in the 10th grade
select * from students where grade_level = 10;
#5. Retrieve distinct cities from the Students table
select distinct city from students;
#6. Retrieve all students who are in the 10th grade and live in &#39;New York&#39;
select * from students where grade_level = 10 and city  = "new york" ;
#7. Retrieve all students who are in the 10th grade or live in &#39;Los Angeles&#39;
select * from students where grade_level = 10 and city = "los angeles";
#8. Retrieve all students who live in &#39;New York&#39;, &#39;Los Angeles&#39;, or &#39;Chicago&#39;
select * from students where city in ( "new york","los angeles","chicago");
#9. Retrieve all students who do not live in &#39;New York&#39;, &#39;Los Angeles&#39;, or &#39;Chicago&#39;
select * from students where city not in ( "new yprk","los angeles","chicago");
#10. Retrieve all students whose age is between 14 and 18
select * from students where age between 14 and 18 ;
#11. Retrieve all students who do not have a city listed (related with null/not null concept)
select * from students  where  city is null;
#12. Retrieve all students whose first name starts with &#39;A&#39;
select * from students where first_name like "A%";
#13. Retrieve all students whose first name ends with &#39;A&#39;
select * from students where first_name like "%a";
#14. Retrieve all students whose name contain letter &#39;A&#39;
select * from students where first_name like "%a%";
#15. Retrieve the first 5 students from the Students table
select * from students limit 5 ;

#16. Write a query to retrieve the first and last names of students along with their cities,
#ordered by their last name. Display the 6th to 10th records (assuming the first
#record is 1). (related with limit and offset)
select first_name ,last_name ,city from students order by last_name limit 5 offset 5 ;
#17. Write a query to retrieve the first and last names of all students along with their
#corresponding enrollment IDs using a LEFT JOIN. Include students who do not have any
#enrollments.
select first_name ,last_name enrollment_id from students  s left join enrollments e on s.student_id = e.student_id;
#18. Write a query to retrieve the first and last names of all students along with their
#corresponding enrollment IDs using a RIGHT JOIN. Include enrollments that do not have
#corresponding students.
select first_name , last_name ,enrollment_id  from students s right join enrollments e on s.student_id = e.student_id ;
#19. Write a query to retrieve the first and last names of all students along with their
#corresponding enrollment IDs using an INNER JOIN.
select first_name , last_name ,enrollment_id from students s inner join enrollments e on s.student_id = e.student_id ;
#20. Retrieve the first and last names of all students along with their enrolled course names.
select first_name ,last_name , enrollment_id ,course_name from students s join enrollments e on s.student_id = e.student_id 
join courses c on c.course_id = e.course_id ;
#21. Retrieve the list of students along with their enrollment dates. Include students who have
#not enrolled in any courses.
 select first_name, last_name, enrollment_date  from students s
 left join enrollments e on s.student_id = e.student_id ;
#22. List the names of students who have not enrolled in any courses.
select first_name, last_name ,enrollment_date  from students s
 left join enrollments e on s.student_id = e.student_id where e.enrollment_id is null ; 
#23. Retrieve the first name, last name, and course name for all students enrolled in courses
#taught by &#39;Dr. Smith&#39;.
select first_name , last_name ,course_name from students s join enrollments e 
on s.student_id = e.student_id  join courses c on c.course_id = e.course_id where instructor = "dr. smith";
#24. List all students who are aged 18 or older and have enrolled in at least one course.
select * from students s join enrollments  e on s.student_id = e.student_id join courses c on
c.course_id = e.course_id where age>=18 ;

#25. Count how many rows fetched when using left join, right join, inner join , cross join,
#natural join
#Table 1  Table 2
1            1               inner join  8 rows 
1             1               left join 11 rows
1              2            right join 10 rows 
2              2              cross join 42 rows 
3             4                natural join 8 rows 
3             null
3