


-- E Tập viết lệnh đi đừng dùng cái tự tạo
-- dấu -- là để comment
-- mà thứ tự ưu tiên để tạo table là những table nào không có khóa ngoại thì sé tạo trước.
-- Ví dụ như văn phòng. Nó không có khóa ngoại nào nên tạo trước.
-- NHân viên thì có khóa ngoại là vanphong_id nên phải tạo sau.
-- khóa ngoại là cái  liên kết giữa các table với nhau ý.van_phongvan_phong
-- những bảng nào mà chứa khóa ngoại thì khi tạo sẽ lỗi.
-- ví dụ như e tạo bảng nhân viên trước văn phòng thì cái liên kết giữa nhân viên với văn phòng ko có do văn phòng chưa được tạo.
-- để a làm 1 ví dụ tạo db cho xem r tự nghiên cứu.
-- sử dụng lệnh ko dùng chuột để tạo

-- ví dụ tạo 1 db tên là sv nhé.
-- tao 2 table lop hoc va sinh vien. moi lop hoc co nhieu sv
-- create DB
create database qlsv;
-- tro vao database
use qlsv;

-- tao table lophoc
create table lop_hoc (
	lh_id int(11) not null primary key auto_increment,
    lh_ten varchar(30)
);

-- tao table sv
-- sinh vien thuoc lop hoc nen phai tao khoa ngoai 

create table sinh_vien (
	sv_id int(11) not null primary key auto_increment,
    sv_name varchar(25),
    sv_sex varchar(5),
    sv_address varchar(255),
    khoa_ngoai int(11) not null,
    foreign key (khoa_ngoai) references lop_hoc(lh_id)
);

-- auto_increment là tạo auto tăng. khi insert em không cần truyền id vào nó sẽ tự tăng id 1 đơn vị cho cho e.
-- quen chưa khai bao cai khoa_ngoai. e muon de ten la gi cung duoc nha
-- Chỉnh sửa bảng
-- thêm column:ALTER TABLE ten_bang ADD ten_cot kieu_du_lieu;
alter table lop_hoc
add siso int(11),
add ga varchar(50);

-- sua ALTER TABLE ten_bang DROP COLUMN ten_cot;
alter table lop_hoc
modify siso int(11) not null,
modify ga varchar(50) not null;

-- doi ten 1 column
alter table lop_hoc 
change ga gvcn varchar(50) not null;
-- xoa ALTER TABLE ten_bang DROP COLUMN ten_cot;
-- add vai cot ling tinh de xoa
alter table lop_hoc
add test int(11);

-- xoa
alter table lop_hoc
drop test;



-- doi ten bang
ALTER TABLE lop_hoc1 RENAME lop_hoc;

-- xoa bang
create table test(
	id int(11) primary key not null
);

drop table test;

-- insert data
alter table lop_hoc
drop gvcn;
-- lophoc

insert into lop_hoc (lh_ten, siso) values 
("Toan", 30),
("Ly", 30),
("Hoa", 30);

-- insert sv tự thêm



-- update 
update lop_hoc set 
siso = 40
where lh_id = 2;

-- xoa
delete from lop_hoc 
where lh_ten = "Hoa";

-- Select
SELECT * FROM qlsv.lop_hoc;

-- select 1 so truong 

select siso, lh_ten from qlsv.lop_hoc;

select siso, lh_ten from qlsv.lop_hoc
where siso = 40;



