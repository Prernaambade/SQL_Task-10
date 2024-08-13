Physics_wallah(physics_wallah_id,state,city,teacher_id,teacher_name,cource_id,cource_name,offline_students,online_students,total_students)

create table Physics_wallah(
	physics_wallah_id varchar(100) primary key,
	state varchar(100),
	city varchar(100),
	teacher_id varchar(100),
	teacher_name varchar(100),
	cource_id varchar(100),
	cource_name varchar (100),
	offline_students int,
	online_students int,
	total_students int
)
select * from Physics_wallah

insert into Physics_wallah values('PW-01','Uttarpradesh','Lucknow,prayagraj,varanasi','PW-U','Alakh_Pandey','PY-01','PHYSICS',100,50,150)
insert into Physics_wallah values('PW-02','Gujrat','Surat,Vadodra','PW-G','Sarvesh_sir','CH-02','CHEMISTRY',200,50,250)
insert into Physics_wallah values('PW-03','Rajasthan','Kota,Jaipur','PW-R','Tarun_mishra','M-03','MATHS',220,50,270)
insert into Physics_wallah values('PW-04','Maharashra','Mumbai,Pune','PW-M','Taniya_Mam','G-04','GEOLOGY',300,50,350)
insert into Physics_wallah values('PW-05','Bihar','Patna,Bhagapur','PW-B','Manish_sir','Z-05','ZOOLOGY',160,40,200)
insert into Physics_wallah values('PW-06','Madhya_pradesh','Indore,Bhopal','PW-M','Nimisha_mam','B-06','BIOLOGY',100,50,150)

---1.1NF
select physics_wallah_id, state, city from Physics_wallah

create table PW as select physics_wallah_id, state, city from Physics_wallah

select * from PW

SELECT
      physics_wallah_id ,
      state,
      TRIM(split_city)AS city
FROM
    PW,
    LATERAL 
	UNNEST (STRING_TO_ARRAY (city,','))AS split_city;

---2.2NF
create table PW1 as select physics_wallah_id ,teacher_id ,cource_name from Physics_wallah
select * from PW1

create table PW11 as select physics_wallah_id ,teacher_id  from Physics_wallah
select * from PW11

create table PW12 as select teacher_id ,cource_name from Physics_wallah
select * from PW12

select a.physics_wallah_id ,a.teacher_id ,b.cource_name from PW12 as b
inner  join PW11 as a
on a.teacher_id=b.teacher_id

---3.3NF
create table PW2 as select teacher_id,cource_name,offline_students,teacher_name,online_students,total_students from Physics_wallah
select * from PW2

create table PW21 as select teacher_name,cource_name,offline_students,online_students,total_students from Physics_wallah
select * from PW21

create table PW22 as select  teacher_name,teacher_id from Physics_wallah
select * from PW22

select a.teacher_name,a.cource_name,a.offline_students,a.online_students,a.total_students,b.teacher_name,b.teacher_id from PW22 as b
inner join PW21 aS a
on b.teacher_name=a.teacher_name
		
		
				