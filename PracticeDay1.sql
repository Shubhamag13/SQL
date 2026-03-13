create database vansh;
use vansh;
create table personal (
id int,
name varchar(20),
DOB date,
phone varchar(12),
gender varchar(1)
);

insert into personal(id,name,DOB,phone,gender) 
values
(103,"aman","2002-03-07","434353343","M"),
(104,"Mohit","2001-09-12","343445366","M");
 
 create table student(
 id int not null unique,
 name varchar(50) not null,
 age int not null check(age>=18),
 gender varchar(10) not null,
 phone varchar(10) not null unique,
 city varchar(10) not null default 'Jaipur' 
 );
 
 insert into student(id,name,age,gender,phone) 
 values
 (102,"shubham",20,"m","2377925295"),
 (103,"Rohit",58,"m","9377925295"),
 (104,"Mohit",28,"m","8377925295") ;

update student set id=202,name="vansh" where id=201;
commit;
update student set id=1,name="vansh" where id=102;
rollback;
update student set id =3 where id=103;
update student set id=4 where id =104;
commit;
update student set id=2 where id= 102;
rollback;
update student set id=2 where id= 202;
update student set id=5 where id= 102;

delete from student where id=2;
rollback;
delete from student where id=4;
rollback;
delete from student where gender='m';
rollback;

-- primary key  unique and not null value;
Alter table student add primary key(id);

-- foreign key (fk() references city())
-- alter table table_name add foreign key(city) references city(cid);

create table city
(
cid int not null auto_increment,
cityname varchar(50) not null,
primary key(cid)
);

insert into city(cityname) values('Agra'),('Delhi'),('Bhopal'),('Jaipur');

create table personal(
id int not null,
name varchar(20) not null,
percentage int not null,
age int not null,
gender varchar(1) not null,
city int not null,
primary key(id),
foreign key (city) references city(cid)
);

insert into personal (id,name, percentage, age, gender, city)
values
(1,"Rahul Kumar",45,19,"M",1),
(2,"Sarita Kumari",45,21,"F",2),
(3,"Salman Khan",5,22,"M",1),
(4,"Juhi Chawla",65,18,"F",3),
(5,"Anil Kapoor",75,22,"M",1),
(6,"John Abraham",64,21,"M",2),
(7,"Shahid kapoor",52,20,"M",1);

-- inner join 
select id,name,age from personal as p join city as c on p.city =c.cid where c.cityname="agra"order by p.name;


-- left join
select * from personal as p left join city as c on p.city = c.cid;

-- right join
select * from personal as p right join city as c on p.city=c.cid;

-- cross join 
SELECT * from personal cross join city;


-- how to join multiple tables 
-- select columns from table1 inner join table 2 on table1.c_name = table2.c_name inner join table 3 on table 1.c_name= table3.c_name;

-- GROUP BY
SELECT CITYNAME, COUNT(PERSONAL.CITY) FROM PERSONAL JOIN CITY ON PERSONAL.CITY = CITY.CID  GROUP BY CITY ORDER BY COUNT(PERSONAL.CITY);

-- HAVING 
SELECT CITYNAME, COUNT(PERSONAL.CITY) FROM PERSONAL JOIN CITY ON PERSONAL.CITY = CITY.CID  GROUP BY CITY HAVING COUNT(PERSONAL.CITY)>2 ORDER BY COUNT(PERSONAL.CITY);

-- SUB QUERY



-- if 
select id,name, percentage, if(percentage >=45,"PASS","FAIL") as result from personal;


-- case
SELECT id, name, percentage,
			CASE
				WHEN percentage >= 80 AND percentage <= 100 THEN "Merit"
				WHEN percentage >= 60 AND percentage < 80 THEN "Ist Division"
				WHEN percentage >= 45 AND percentage < 60 THEN "IInd Division"
				WHEN percentage >= 33 AND percentage < 45 THEN "IIIrd Division"
				WHEN percentage < 33 THEN "Fail"
				ELSE "Not Correct %"
			END AS Grade
			FROM personal;
            
update personal set percentage = (case id
when 3 then 39
when 7 then 120 
end) 
where id in(3,7);
            
            
