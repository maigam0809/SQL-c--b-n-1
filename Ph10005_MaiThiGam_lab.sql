create database Ph10005_MaiThiGam;
use Ph10005_MaiThiGam;

-- database nó tồn tại rồi. muốn chạy lại thì xóa cả db đi  oke thank nhé
-- ko cần chạy như thế chạy lại tất cả thì chỉ cần ấn thôi ko phải bôi den
-- ko khuyến khích xóa db nhé. table nào cần sửa lại thì dùng alter table.
-- sau này db nó có dữ liệu thì xóa vậy mất hết db
-- cả table cũng thế xóa nó sẽ mất hết data. đang học thì đc phép xóa v thôi
-- hk tiếp đi a cbi đi lấy đồ 

-- e nên đặt tên nó trùng luôn với cái id e muốn liên kết đến
-- ko đặt lung tung nữa
-- ok nhé oke 

-- lưu ý khi tạo khóa ngoại.
-- Khóa ngoại phải cùng kiểu dữ liệu với khóa mà mình muốn liên kết.
-- khóa ngoại thường not null
-- e nhìn thấy nó bảo lỗi ko ? Foreign key contrainst is incorrect inform. 
-- e phải đọc được nó báo lỗi gì thì mới giải quyết đc.
-- nó báo là khóa ngoại không đúng định danh. Ko dịch đc thì google dịch 

create table van_phong(
Ma_VP char(15) not null primary key ,
Dia_Chi char(40) null
);

 create table nhan_vien(
Ma_NV char(30) not null primary key ,
Ten_NV text(30) not null,
Ma_VP char(15) not null,
foreign key (Ma_VP) references van_phong(Ma_VP),
Chuc_Vu text(20) not null 
);

create table than_nhan(
Ma_Than_Nhan char(15) not null primary key,
Ma_NV char(15) not null,
foreign key (Ma_NV) references nhan_vien(Ma_NV),
Ngay_sinh date not null,
Ten_Than_Nhan text(30) not null,
Quan_He text(20) null
);

create table chu_so_huu(
Ma_CSH char(15) not null primary key,
Ten_CSH text(20) not null ,
Dia_Chi varchar(20) not null,
phone int(10)
);

create table bat_dong_san(
Ma_BDS char(15) not null primary key,
Ma_VP char(15) not null,
foreign key (Ma_VP) references van_phong(Ma_VP),
Dia_Chi varchar(20) not null,
Ma_CSH char(15) not null,
foreign key (Ma_CSH) references chu_so_huu(Ma_CSH)
);

-- ràng buộc  check các cột
alter table van_phong
add constraint ck_van_phong
check (van_phong);

alter table nhan_vien
add constraint ck_nhan_vien
check (nhan_vien);

alter table than_nhan
add constraint ck_van_phong
check (van_phong);

alter table chu_so_huu
add constraint ck_chu_so_huu
check (chu_so_huu);

alter table bat_dong_san
add constraint ck_bat_dong_san
check (bat_dong_san);

-- ràng buộc các primary key: 
-- alter table van_phong
-- add constraint ck_primary_key1
-- primary key (Ma_VP);

-- alter table nhan_vienbat_dong_san
-- add constraint ck_primary_key2
-- primary key (Ma_NV);

-- alter table than_nhan
-- add constraint ck_primary_key3
-- primary key (Ma_Than_Nhan);

-- alter table chu_so_huu
-- add constraint ck_primary_key4
-- primary key (Ma_CSH);

-- alter table bat_dong_san
-- add constraint ck_primary_key5
-- primary key (Ma_BDS);

-- ràng buộc các foreign key: 
-- use Ph10005_MaiThiGam;
-- alter table nhan_vien
-- add constraint ck_foreign_key
-- foreign key (Ma_VP)
-- references  van_phong(Ma_VP);


-- alter table than_nhan
-- add constraint ck_foreign_key
-- foreign key (Ma_NV)
-- references  nhan_vien(Ma_NV);


-- alter table bat_dong_san
-- add constraint ck_foreign_key
-- foreign key (Ma_VP)
-- references  van_phong(Ma_VP);

-- alter table bat_dong_san
-- add constraint ck_foreign_key
-- foreign key (Ma_CSH)
-- references  chu_so_huu(Ma_CSH);

-- them du lieu cho bang
insert into van_phong (Ma_VP,Dia_Chi) values 
 ("BacGiang", "Mỹ Đình-Hà Nội"),
  ("BacNinh", "Đông Anh-HCM"),
  ("TuyenQuang", "Xuân Tiến");








