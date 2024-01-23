drop database if exists quan_ly_du_lich;
create database if not exists quan_ly_du_lich;
use quan_ly_du_lich;
create table if not exists thanh_pho(
id int auto_increment primary key,
ten_thanh_pho varchar(45) not null
);
insert into thanh_pho(ten_thanh_pho) values('da nang'),('hai phong'),('ha noi'),('phap'),('can tho');
select*from thanh_pho;
create table if not exists bang_diem_den_du_lich(
id int auto_increment ,
ten_diem_den varchar(200),
mo_ta varchar(45),
gia_trung_binh int,
thanh_pho_id int,
 primary key(id),
 foreign key (thanh_pho_id) references thanh_pho(id)
);
insert into bang_diem_den_du_lich(ten_diem_den,mo_ta,gia_trung_binh,thanh_pho_id) values ('ho chi minh','suoi tien',7700000,1),('italia','may bay',7700000,4),
('lao','song',7700000,2),('da lat','mong mo',7700000,3),('ca mau','song nuoc',7700000,5);
select*from bang_diem_den_du_lich ;
create table if not exists bang_khach_dat_tour(
id int auto_increment,
ten_khach varchar(200),
so_can_cuoc int,
nam_sinh int,
thanh_pho_id int,
primary key(id),
foreign key (thanh_pho_id) references thanh_pho(id)
);
insert into bang_khach_dat_tour(ten_khach,so_can_cuoc,nam_sinh,thanh_pho_id) values('phuong',123,1999,1),('phuong',103,1999,5),
('kieu anh',143,1999,2),('phuong',123,1999,3),('phuong',123,1999,4),('phuong',123,1999,5),
('phuong',129,1999,1),('chanh',163,1999,2),('trung',173,1999,3),('phuong',128,1999,4);
select*from bang_khach_dat_tour;
create table if not exists loai_tour(
id int primary key auto_increment,
ma_loai varchar(200),
ten_loai varchar(200)
);
insert into loai_tour(ma_loai,ten_loai) values ('vip','cao cap'),('khong vip','dan thuong');
create table if not exists tour(
id int auto_increment ,
ma_tour varchar(225),
loai_tour_id int,
gia_diem_den_id int,
id_bat_dau date,
id_ket_thuc date,
primary key (id),
foreign key(loai_tour_id) references loai_tour(id),
foreign key(gia_diem_den_id) references bang_diem_den_du_lich(id)
);
insert into tour(ma_tour,loai_tour_id,gia_diem_den_id,id_bat_dau,id_ket_thuc) values ('T01',1,1,'2020-01-22','2020-04-30'),('T01',1,2,'2023-01-01','2024-10-10'),
('T01',2,3,'2020-03-04','2024-10-10'),('T01',1,4,'2020-03-03','2020-04-30'),('T01',1,5,'2020-03-01','2024-10-10'),
('T01',2,1,'2023-01-01','2024-10-10'),('T01',1,2,'2023-01-01','2020-03-10'),('T01',1,3,'2023-01-01','2024-10-10'),('T01',1,4,'2023-01-01','2024-10-10'),
('T01',2,5,'2020-03-07','2020-03-01'),('T01',1,4,'2020-03-01','2024-10-10'),('T01',1,3,'2023-01-01','2024-10-10'),('T01',1,2,'2023-01-01','2024-10-10'),
('T01',2,2,'2020-03-06','2024-10-10');
select*from tour;
create table if not exists hoa_don_dat_tour(
id int auto_increment,
tour_id int,
khach_hang_id int,
trang_thai varchar(225),
primary key(id),
foreign key(tour_id) references tour(id),
foreign key(khach_hang_id) references bang_khach_dat_tour(id)
);
insert into hoa_don_dat_tour(tour_id,khach_hang_id,trang_thai) values(1,1,'chờ xử lý'),(1,2,'hoàn thành'),(2,3,'hoàn thành'),(3,4,'chờ xử lý'),(4,5,'chờ xử lý'),
(8,9,'hoàn thành'),(9,6,'hoàn thành'),(11,1,'hoàn thành'),(12,7,'hoàn thành'),(10,8,'hoàn thành');

select*from hoa_don_dat_tour;
select thanh_pho.ten_thanh_pho as ten_thanh_pho , tour.gia_diem_den_id as id , count( tour.gia_diem_den_id) as so_luong
from tour join thanh_pho on tour.gia_diem_den_id=thanh_pho.id group by thanh_pho.id ;
select count(*) as so_luong,tour.id_bat_dau as thoi_gian from tour where day(tour.id_bat_dau)=01 and month(tour.id_bat_dau) = 03 and year(tour.id_bat_dau)=2020 group by tour.id_bat_dau;
select count(*) as so_luong,tour.id_ket_thuc as thoi_gian from tour where day(tour.id_ket_thuc)=30 and month(tour.id_ket_thuc) = 04 and year(tour.id_ket_thuc)=2020 group by tour.id_ket_thuc;
-- select*from tour 
-- where month(t.tour)=3
