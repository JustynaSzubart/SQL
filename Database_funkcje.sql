create database funkcje;
use funkcje;
create table script
(
script_id int not null primary key,
staly char(20) not null,
zmienny varchar (30) not null,
rzeczywisty float(25) not null,
calkowity int(30) not null,
daty date not null,
dataczas datetime not null
);
select *from script;

-- Create database script
insert into script (script_id, staly, zmienny, rzeczywisty, calkowity, daty, dataczas)
values
(1,'Daniela','Kot','-3.5','33','2012-04-04', '2012-04-04 23:59:59'),
(2,'Zbigniew','Miazga','-2.75','-76','1996-03-03','1996-03-03 12:43:00'),
(3,'Karolina','Karol','2.345','98','2020-01-01','2020-01-01 14:23:23'),
(4,'Julia','Lejek','-3.45','123','2018-12-29','2018-12-29 22:22:22');
 
 -- Determine the number of characters from the text column "staly"
 select lenght(staly) as liczba
 from script;
 
 -- Search for records with first names at least 6 letters and surnames at least 10 letters
 select*from script where lenght(staly)<=6 and lenght(zmienny >=10);
 
 -- Display one column of text in uppercase and the other in lowercase
 select upper(staly) as duze_litery from script;
 
 select lower(zmienny) as male_litery from script;
 
 -- Display last letter from first text column and first letter from second text column
 select LEFT(staly,200) + RIGHT(zmienny,1) from script;
 
 -- Display combined two text columns into one value separated by a space
 select concat(staly," ",zmienny) as polaczenie
 from script;
 
 -- Remove unnecessary leading, trailing and all spaces
 select TRIM(staly) as bez_spacji from script;
 
 -- Replace the letter "a" with "A" in the first text column
 select replace(staly,'a','A') from script;
 
 -- Find the sum of two numeric columns
 select sum(rzeczywisty) + sum(calkowity) as suma from script;
 
 -- Find the square root of an integer
 select sqrt(calkowity) as pierwiastek from script;
 
 -- Find the natural and decimal logarithm of the numbers in the column with integers
 select log10(calkowity) as dziesietny from script;
 
-- Find the value of the sine and cosine from the selected column with numerical values
select sin(rzeczywisty) as sinus from script;

select cos(rzeczywisty) as sinus from script;

-- Calculate the month from the date column
select dayofmonth(dataczas) as miesiac from script;

-- Designate only the date from the date column with the hourly part
select date(dataczas) as data_bez_godz from script;

-- Convert text to date
select str_to_date(daty) as napis_nie_data from script;
