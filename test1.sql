create database quan_ly_diem_sinh_vien CHARACTER SET utf8 COLLATE utf8_general_ci;
use quan_ly_diem_sinh_vien;

create table khoa(
ma_khoa int not null primary key auto_increment ,
ten_khoa varchar(40) not null,
so_cbgd int
);

create table lop(
ma_lop int not null primary key auto_increment,
ten_lop varchar(40) not null,
ma_khoa int not null ,
foreign key(ma_khoa) references khoa(ma_khoa)
);
create table sinh_vien(
ma_sinh_vien int not null primary key auto_increment,
ho_ten varchar(40) not null,
gioi_tinh varchar(40) not null,
ngay_sinh date not null,
ma_lop int not null,
foreign key (ma_lop) references lop(ma_lop),
hoc_bong int not null,
tinh int
);
create table mon_hoc (
ma_mon_hoc int not null primary key auto_increment,
ten_mon_hoc varchar(40) ,
so_tiet int 
);

create table ket_qua(
id int not null primary key auto_increment,
ma_sinh_vien int not null,
foreign key(ma_sinh_vien) references sinh_vien(ma_sinh_vien),
ma_mon_hoc int not null,
foreign key (ma_mon_hoc) references mon_hoc(ma_mon_hoc),
diem_thi double not null
);

-- 1.Liệt kê danh sách các lớp của khoa ,thông tin cần : mã lớp ,tên lớp ,mã khoa
select L.ma_lop "mã lớp", L.ten_lop "Tên lớp", L.ma_khoa "Mã khoa"
from quan_ly_diem_sinh_vien.lop L ;

-- 2. lập danh sách sinh viên gồm: mã sinh viên ,họ tên,học bổng
select SV.ma_sinh_vien "Mã sinh viên", Sv.ho_ten "Họ và tên", SV.hoc_bong "Học bổng"
from quan_ly_diem_sinh_vien.sinh_vien SV;

-- 3. Lập danh sách sinh viên có học bổng .Danh sách cần: Mã sinh viên , nữ , học bổng
select SV.ma_sinh_vien "Mã sinh viên",SV.ho_ten "Họ tên", SV.gioi_tinh "Giới tính", SV.hoc_bong "Học bổng"
from quan_ly_diem_sinh_vien.sinh_vien SV where SV.gioi_tinh like "nu";

-- 4. Lập danh sách sinh viên nữ .Danh sách cần các thuộc tính của quan hệ sinh viên 
select * from quan_ly_diem_sinh_vien.sinh_vien SV 
where SV.gioi_tinh like "%nu%";

-- 5.lập danh sách sinh viên có họ trần
select * from quan_ly_diem_sinh_vien.sinh_vien SV 
where SV.ho_ten like "tran%";

-- 6. lập danh sách sinh viên nữ có học bổng
select * from quan_ly_diem_sinh_vien.sinh_vien SV 
where SV.hoc_bong >0
and  SV.gioi_tinh="nu";

-- 7.lập danh sách sinh viên nữ  hoặc danh sách sinh viên có học bổng 
select * from quan_ly_diem_sinh_vien.sinh_vien SV where SV.gioi_tinh="nu";
select * from quan_ly_diem_sinh_vien.sinh_vien SV where Sv.hoc_bong>0;

-- 8. Lập danh sách sinh viên có năm sinh từ 1978 đến 1985 .Danh sách cần các thuộc tính của quan hệ sinh vien
select * from quan_ly_diem_sinh_vien.sinh_vien SV 
where  year(SV.ngay_sinh)  between 1960 and 1987;

-- 9.Liệ kê danh sách sinh viên được sắp xếp tăng dần theo mã sinh viên
select * from  quan_ly_diem_sinh_vien.sinh_vien SV 
where SV.ma_sinh_vien order by(SV.ma_sinh_vien);

-- giảm dần theo mã sinh viên là:
select * from  quan_ly_diem_sinh_vien.sinh_vien SV 
where SV.ma_sinh_vien order by(SV.ma_sinh_vien) desc;

-- 10.Liệt kê danh sách sinh viên được sắp xếp giảm dần theo học bổng
select * from quan_ly_diem_sinh_vien.sinh_vien  SV
where SV.hoc_bong 
order by (SV.hoc_bong) desc;

-- 11. Lập danh sách sinh viên có điểm thi môn CSDl>=8
select * from quan_ly_diem_sinh_vien.sinh_vien SV
inner join quan_ly_diem_sinh_vien.ket_qua KQ
on SV.ma_sinh_vien=KQ.ma_sinh_vien 
inner join quan_ly_diem_sinh_vien.mon_hoc MH
on MH.ma_mon_hoc=KQ.ma_mon_hoc
where MH.ten_mon_hoc like "CSDL"
and KQ.diem_thi>=8;

-- 12.lập danh sách sinh viên có học bổng của khoa CNTT Thông tin cần : mã sinh viên, Họ tên, Học bổng,
-- Tên lớp ,tên khoa
select SV.ma_sinh_vien "Mã sinh viên", SV.ho_ten "Họ và tên",
SV.hoc_bong "Học bổng", L.ten_lop "Tên lớp",
K.ten_khoa "Tên khoa"
from quan_ly_diem_sinh_vien.sinh_vien SV
inner join quan_ly_diem_sinh_vien.lop L
on L.ma_lop=SV.ma_lop
inner join quan_ly_diem_sinh_vien.khoa K
on K.ma_khoa=L.ma_khoa
where K.ten_khoa like "CNTT"
and SV.hoc_bong>0 ;


-- 13.Lập danh sách sinh viên có học bổng của khoa CNTT .Thông tin cần:  mã sinh viên,Họ tên, tên lớp ,Tên khoa
select SV.ma_sinh_vien "Mã sinh viên", SV.ho_ten "Họ và tên",
SV.hoc_bong "Học bổng", L.ten_lop "Tên lớp",
K.ten_khoa "Tên khoa"
from quan_ly_diem_sinh_vien.sinh_vien SV
inner join quan_ly_diem_sinh_vien.lop L
on L.ma_lop=SV.ma_lop
inner join quan_ly_diem_sinh_vien.khoa K
on K.ma_khoa=L.ma_khoa
where K.ten_khoa like "CNTT"
and SV.hoc_bong>0 ;

-- 14.Cho biết số sinh viên của mỗi lớp
select count(SV.ma_sinh_vien) "Số sinh viên"
from quan_ly_diem_sinh_vien.sinh_vien SV;


-- 15.Cho biết số lượng sinh viên mỗi khoa
select K.ma_khoa, K.ten_khoa ,count(SV.ma_sinh_vien)

from quan_ly_diem_sinh_vien.sinh_vien SV
inner join quan_ly_diem_sinh_vien.lop L
on L.ma_lop=SV.ma_lop
inner join quan_ly_diem_sinh_vien.khoa K
on K.ma_khoa=L.ma_khoa

group by(K.ma_khoa);

-- 16.Cho biết số lượng sinh viên nữa ở mỗi khoa 

-- 17.Cho biết tổng tiền học của mỗi lớp

-- 18.Cho biết tổng số tiền học bổng của mỗi khoa

-- 19.Lập danh sách nững khoa có nhiều hơn 100 sinh viên.Danh sách : mã kha tên khoa<sốluwongj

-- 20.Lập danh sách những khoa có nhiều hơn 50 sinh viên nữ .Danh sách cần: mã khoa,tên khoa ,Số luwomngj 

-- 21.Lập danh sách những khoa có tổng tiền học bổng >=10000000

-- 22. Lập danh sách sinh viên có học bổng cao nhất

-- 23.Lập danh sách sinh viên có điểm thi môn CSDL cao nhất


-- 24.Lập danh sách những sinh viên không có điểm thi môn CSDL


-- 25.Cho biết nững khoa nào có nhiều sinh viên nhất.


