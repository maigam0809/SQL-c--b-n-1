-- Tạo database
create database quan_ly_thu_vien CHARACTER SET utf8 COLLATE utf8_general_ci;
use quan_ly_thu_vien;

-- 1. Xuất bản
create table xuat_ban(
ma_xuat_ban int not null primary key auto_increment,
ten_nha_xuat_ban varchar(40)
);
-- 2.Tác giả
create table tac_gia(
ma_tac_gia int not null primary key auto_increment,
ten_tac_gia varchar(40)
);

-- 3.loại sách
create table loai_sach(
ma_loai_sach int not null primary key auto_increment,
ten_loai_sach varchar(40)
);
-- sách
create table sach(
ma_sach int not null primary key auto_increment,
tieu_de varchar(40) not null,
ma_tac_gia int not null,
foreign key (ma_tac_gia) references tac_gia(ma_tac_gia),
ma_xuat_ban int not null,
foreign key (ma_xuat_ban) references xuat_ban(ma_xuat_ban),
so_trang int not null check (so_trang >5),
so_luong int check (so_luong >1),
gia_tien int check (gia_tien>0),
ngay_nhap_kho date,
vi_tri_dat_sach int
);

create table chuyen_nganh(
ma_chuyen_nganh int not null primary key auto_increment,
ten_chuyen_nganh varchar(40) not null
);
-- 5. Sinh viên
create table sinh_vien(
ma_sinh_vien int not null primary key auto_increment,
ten_sinh_vien varchar(40) not null,
ngay_het_han_ma date not null,
ma_chuyen_nganh int not null,
foreign key (ma_chuyen_nganh) references chuyen_nganh(ma_chuyen_nganh),
email varchar(40) not null unique,
sdt varchar(15) not null
);
-- 8. Phiếu mượn sách
create table phieu_muon_sach(
ma_phieu int not null primary key auto_increment,
ngay_muon_sach date not null,
ngay_phai_tra date not null,
ma_sinh_vien int not null,
foreign key (ma_sinh_vien) references sinh_vien(ma_sinh_vien),
trang_thai varchar(20) not null default "chua tra"
);
create table chi_tiet_phieu(
ma_chi_tiet_phieu int not null primary key auto_increment,
ma_sach int not null,
foreign key ( ma_sach) references sach(ma_sach),
ma_phieu int not null ,
foreign key (ma_phieu) references phieu_muon_sach(ma_phieu)
); 

-- insert cho các bảng
insert into xuat_ban(ma_xuat_ban,ten_nha_xuat_ban) values
('1',"Kim Đồng"),
('2',"Trẻ"),
('3',"Giáo dục"),
('4',"Thông tin và truyền thông"),
('5',"Chính trị quốc gia sự thật"),
('6',"Nhà Văn"),
('7',"Tư pháp"),
('8',"Lao Động"),
('9',"Giao thông vận tải");

insert into tac_gia(ma_tac_gia,ten_tac_gia) values
('1',"Lê Liên"),
('2',"Hồng Gấm"),
('3',"Lương Tú"),
('4',"Tiến Đạt"),
('5',"Tiến Thiều"),
('6',"Quang  Duẩn"),
('7',"Mai Trang"),
('8',"Văn Đạo"),
('9',"Thị Ngoãn");

insert into loai_sach(ma_loai_sach,ten_loai_sach) values
('1',"IT"),
('2',"Du lịch"),
('3',"Văn Học"),
('4',"Ngoại Ngữ"),
('5',"Khách sạn"),
('6',"IT HTML"),
('7',"CNTT");

insert into sach(ma_sach, tieu_de, ma_tac_gia, ma_xuat_ban, so_trang, so_luong, gia_tien, ngay_nhap_kho, vi_tri_dat_sach) values
('1', "Khóa học cơ bản cho HTML", '2', '3','10','1','1',"2000/9/8",'1'),
('2',"Khoa học trừu tượng",'3','4','23','3','4',"2006/12/8",'4'),
('3',"Khoa học trừ tượng viễn tưởng",'1','1','32','5','2',"2009/10/24",'5'),
('4',"Bí kíp khách sạn",'4','5','29','2','4',"2016/12/5",'2'),
('5',"English my protection",'3','4','35','3','1',"2019/10/1",'2') ;

insert into chuyen_nganh( ten_chuyen_nganh) values
('Thiết kế wb'),
('Quản lí khách sạn'),
('PR sự kiện'),
('Maketting'),
('Đồ hoa'),
('Ứng dụng'),
('Lâp trình mobile');

insert into sinh_vien( ten_sinh_vien, ngay_het_han_ma, ma_chuyen_nganh, email, sdt) values
( "Mai Thị Gấm", "2021/2/3", '1', "gammtph10005@gmail.com","0344358618"),
( "Lương Viết Tú", "2018/6/7", '4', "tuluong996@gmial.com","0378964926"),
( "Nguyến Thị Nhung", "2017/5/6", '2', "nhung@gmail.com","09672587" ),
( "Nguyễn Văn Du", "2020/4/5", '1', "dunvph10007@fpt.edu.vn","0367273647"),
( "Đăng Đình Khải", "2000/8/5", '4', "kahvx@fpt.edu.vn","098746547");

insert into phieu_muon_sach(ngay_muon_sach, ngay_phai_tra, ma_sinh_vien) values
("2019/4/1", "2019/4/8", '1'),
("2018/3/1", "2018/3/8", '3'),
("2019/5/2", "2019/5/9", '1'),
("2019/2/4", "2019/2/11", '5'),
("2020/8/1", "2020/8/1", '2');

insert into chi_tiet_phieu(ma_sach, ma_phieu) values
('1', '3'),
('2', '2'),
('4', '1'),
('3', '5'),
('1', '2');

-- 6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả
-- thuộc loại sách có mã “IT”.
select S.tieu_de "Tên sách", S.ma_sach "Mã sách",
 S.gia_tien "Giá tiền",TG.ten_tac_gia "Tên tác giả",
 LS.ten_loai_sach "Tên loại sách"
 from quan_ly_thu_vien.sach as S
 inner join quan_ly_thu_vien.tac_gia TG
 on S.ma_sach=TG.ma_tac_gia
 inner join quan_ly_thu_vien.chi_tiet_sach CTS
 on S.ma_sach=CTS.ma_sach
 inner join quan_ly_thu_vien.loai_sach LS
 on LS.ma_loai_sach=CTS.ma_loai_sach
 where LS.ten_loai_sach like "%IT%";
 

-- 6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã
-- sinh viên có ngày mượn trong tháng 01/2017.

-- 6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày
-- mượn sách.
-- 6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số
-- lượng sách mỗi loại).
-- 6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
-- 6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.
-- 6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã
-- phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.
-- 6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 20 lần.
-- 6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm
-- 2014 giảm 30%.
-- 6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã
-- sinh viên PD12301 (ví dụ).
-- 6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn,
-- tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
-- 6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có
-- lượt mượn lớn hơn 10
-- 6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước „1/1/2010‟

