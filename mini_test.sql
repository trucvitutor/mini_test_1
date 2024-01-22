drop database if exists quan_ly_hoc_vien;
create database if not exists quan_ly_hoc_vien;
use quan_ly_hoc_vien;
create table if not exists Address(
id int primary key auto_increment not null,
address varchar(200) not null
);
insert into Address values (1,'da nang');
insert into Address (address) values ('hue');
insert into Address (address) values ('tp hcm');
insert into Address (address) values ('nha trang');
insert into Address (address) values ('quang nam');
select*from Address;
create table if not exists Classes(
id int primary key auto_increment,
name_ varchar(200),
language_ varchar(200),
description_ varchar(200)
);
insert into Classes values(1,'Truc Vi','java','dev');
insert into Classes (name_,language_,description_) values('Thanh dung','java','dev');
insert into Classes (name_,language_,description_) values('Phap','java','dev');
insert into Classes (name_,language_,description_) values('Dat','java','dev');
insert into Classes (name_,language_,description_) values('Nhat','java','dev');
select*from Classes;
create table if not exists Students (
id int primary key auto_increment,
fullname varchar(200),
address_id int,
age int,
phone varchar(45) unique,
classes_id int,
foreign key (address_id) references Address(id),
foreign key (classes_id) references Classes(id)
);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',1,15,'00000000',1);
insert into Students (fullname,address_id,age,phone,classes_id) values('Tran Trúc Vi',1,18,'00000001',2);
insert into Students(fullname,address_id,age,phone,classes_id) values('Ho Trúc Vi',4,18,'00000002',3);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',2,18,'00000003',4);
insert into Students (fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',1,16,'00000004',1);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Anh',2,18,'00000005',1);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',1,17,'00000006',2);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Thanh Anh',5,18,'00000007',2);
insert into Students (fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',1,19,'00000008',3);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',1,18,'00000009',2);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',4,18,'00000333',2);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',1,18,'00000444',2);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',3,18,'00000555',2);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',3,18,'00000069',2);
insert into Students(fullname,address_id,age,phone,classes_id) values('Nguyen Trúc Vi',2,18,'0000007777',2);
select*from Students;
create table if not exists Course (
id int primary key auto_increment,
name varchar(45),
description varchar(200));
insert into Course(name,description) values('toan','abc'),('Ly','abc'),('sinh','abc');


create table if not exists  Points (
id int primary key auto_increment,
course_id int,
student_id int,
point float,
foreign key (course_id) references Course(id),
foreign key (student_id) references Students(id)
);
insert into Points (course_id,student_id,point) values (1,2,9);
insert into Points (course_id,student_id,point) values (1,2,9);
insert into Points (course_id,student_id,point) values (1,2,9);
insert into Points (course_id,student_id,point) values (1,2,9);
insert into Points (course_id,student_id,point) values (1,2,9);
insert into Points (course_id,student_id,point) values (1,2,9);
insert into Points (course_id,student_id,point) values (1,2,9);
insert into Points (course_id,student_id,point) values (1,2,9);
insert into Points (course_id,student_id,point) values (1,2,9);
select*from Points;
select*from Students where fullname like 'Nguyen%';
select*from Students where fullname like '%Anh';
select*from Students where age between 15 and 18;
select*from Students where id in (12,13);
select classes_id, count(*) as so_luong_hoc_vien from Students group by classes_id;
select address_id, count(*) as so_luong_tinh from Students group by address_id;
select point, avg(point) as diem_trung_binh from Points group by point;







