create database Zatrudnieni;
use Zatrudnieni;
create table Employee
(
Address_id int not null primary key,
FirstName varchar(50) not null,
SecondName varchar(50) null,
LastName varchar(50) not null,
Gender enum('W','M') null,
BirthDate date not null,
Salary float(4) not null,
DepartmentId float(1) not null,
HireDate date not null,
ReliveDate date null,
Active1 enum('0','1') not null
);

insert into Employee (Address_id, FirstName, SecondName, LastName, Gender, BirthDate, Salary, DepartmentId, HireDate, ReliveDate, Active1)
values
(1,'Mary','','Smith','W','1985-12-18','2000','1','2011-05-06','1'),
(2,'Paul','Gorge','Johnson','M','1990-01-13','1500','3','2011-10-29','','1'),
(3,'Patricia','','Wilson','W','1995-05-28','1000','4','2012-01-04','2013-11-25','0'),
(4,'Linda','Lisa','Brown','W','1983-07-11','2700','2','2012-06-15','','1'),
(5,'Johnatan','','Davis','M','1978-01-24','1200','1','2013-01-15','','1'),
(6,'John','','Miler','','','1993-10-20','2000','4','2013-03-27','2014-10-06','0'),
(7,'Elizabeth','Dorothy','Taylor','W','1992-09-09','2110','1','2013-05-01','','1'),
(8,'James','','Wilson','M','1987-03-19','1000','3','2013-10-09','2014-03-01','1'),
(9,'Robert', '','Anderson','M','1989-12-13','2900','2','2013-12-20','2014-05-05','0'),
(10,'John','Mark','Smith','M','1990-05-24','2500','1','2014-01-24','','1');

-- Display the first name, last name, date of birth for every employee
select FirstName, LastName, BirthDate from Employee;

-- Display the first name, last name, year, month, day, weekday from date of birth for every employee
select FirstName, LastName,
year(BirthDate),
month(BirthDate),
day(BirthDate),
weekday(BirthDate) from Employee;

-- Display all of information for every employee where date of birth = 1990
select *from Employee where year(BirthDate)=1990;

-- Display all of information for every employee where date of birth = 1990 and month of birth = May
select *from Employee where year(BirthDate)=1990 and month(BirthDate)=05;

-- Display current date and time
select curdate() as dzisiaj;
select curtime() as czas;

-- Display how much has been since 01.01.1990
select datediff(year,'1990-01-01','2020-04-07');

-- Display all of information for every employee with age
select *from Employee where datediff(year,BirthDate,'2020-04-07');

-- Display all of information for every employee where age is over 25
select *from Employee where datediff(year,BirthDate,'2020-04-07')>25;

-- Display all of information for every employee where age is under 30 and salary under 2000
select *from Employee where datediff(year,BirthDate,'2020-04-07')<30 and Salary<2000;

-- Display first name, last name and how many year work for every actively working employee 
select  FirstName, LastName, datediff(year,HireDate,'2020-04-07') from Employee where Active1=1;

-- Display first name, last name and how many month work for every actively workingemployee
select  FirstName, LastName, datediff(month,HireDate,'2020-04-07') from Employee where Active1=1;
 
 -- Display all of information for every emplyee who has been working for more than 10 months and less than 20 months
 select *from Employee where datediff(month,HireDate,'2020-04-07')>=10 and datediff(month,HireDate,'2020-04-07')<=20;
 
 -- Display first name, second name, year of birth, year of Hire and how many years have when he was at work
 select  FirstName, SecondName, year(BirthDate), year(HireDate), datediff(year,BirthDate,HireDate) from Employee;
 
 -- Check to see if there are any employees who mistakenly have a date of employment that is later than the date of dismissal
 select *from Employee where datediff(HireDate,ReliveDate)<'0000-00-00';
 
 -- Display first name, second name and number of months for former employee
select FirstName, SecondName, datediff(month,HireDate,ReliveDate) from Employee where Active1=0;

-- Display first name, second name and initials for every employee
 select FirstName, SecondName, substring(FirstName,1) and substring(LastName,1) from Employee;
 
 -- Display last name and length of letters in last name for every employee
 select LastName and lenght(LastName) from Employee;
 
 -- Display all of information for every employee where lenghts of letters is greater than 6
select *from Employee where lenght(LastName)>6;

 -- For every employee, display their first name in lowercase and their last name in uppercase
select lower(FirstName) and upper(LastName) from Employee;
  
  -- For every employee, display their login. The login is made up of the first letter of the first name and the full name
 select substring(FirstName,1) and LastName from Employee as login;

-- For every active employee, display their login in lowercase. Login, as before, consists of the first letter of the first name and the full surname
 select lower(substring(FirstName,1)) and lower(LastName) from Employee where Active1=1;

-- For every employee, display a short login that consists of the first letter of the first name and the first five letters of the surname. Display this login in capital letters
select upper(substring(FirstName,1)) and upper(LastName,1,5) from Employee;

