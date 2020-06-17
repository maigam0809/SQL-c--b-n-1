
create database quan_ly_thu_vien CHARACTER SET utf8 COLLATE utf8_general_ci;

use quan_ly_thu_vien;

-- 1. Xuất bản
create table xuat_ban(
ma_xuat_ban int not null primary key auto_increment,
ten_nha_xuat_ban varchar(40)
);
-- tác giả
create table tac_gia(
ma_tac_gia int not null primary key auto_increment,
ten_tac_gia varchar(40)
);
-- loại sách
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
so_luong_ban_sao int check (so_luong_ban_sao >1),
gia_tien int check (gia_tien>0),
ngay_nhap_kho date,
vi_tri_dat_sach int,
ma_loai_sach int not null,
foreign key(ma_loai_sach) references loai_sach(ma_loai_sach)
);
-- chuyên ngành
create table chuyen_nganh(
ma_chuyen_nganh int not null primary key auto_increment,
ten_chuyen_nganh varchar(40) not null
);
-- . Sinh viên
create table sinh_vien(
ma_sinh_vien int not null primary key auto_increment,
ten_sinh_vien varchar(40) not null,
ngay_het_han_the date not null,
ma_chuyen_nganh int not null,
foreign key (ma_chuyen_nganh) references chuyen_nganh(ma_chuyen_nganh),
email varchar(40) not null unique,
sdt varchar(15) not null
);
-- . Phiếu mượn sách
create table phieu_muon_sach(
ma_phieu int not null primary key auto_increment,
ngay_muon_sach date not null,
ngay_tra date check (ngay_tra >= ngay_muon_sach),
ma_sinh_vien int not null,
foreign key (ma_sinh_vien) references sinh_vien(ma_sinh_vien)
);
-- chi tiết phiếu
create table chi_tiet_phieu(
ma_chi_tiet_phieu int not null primary key auto_increment,
ma_sach int not null,
foreign key ( ma_sach) references sach(ma_sach),
ma_phieu int not null ,
foreign key (ma_phieu) references phieu_muon_sach(ma_phieu)
); 

INSERT INTO `xuat_ban` VALUES (1, 'Kim đồng');
INSERT INTO `xuat_ban` VALUES (2, 'FPT');
INSERT INTO `xuat_ban` VALUES (3, 'Giáo dục');
INSERT INTO `xuat_ban` VALUES (4, 'Nhà văn ');
INSERT INTO `xuat_ban` VALUES (5, 'Tư pháp');
INSERT INTO `xuat_ban` VALUES (6, 'Lao động');
INSERT INTO `xuat_ban` VALUES (7, 'Vận tải');
INSERT INTO `xuat_ban` VALUES (8, 'Truyền thông');

INSERT INTO `tac_gia` VALUES (1, 'Lương Viết tú');
INSERT INTO `tac_gia` VALUES (2, 'Tiến thiều');
INSERT INTO `tac_gia` VALUES (3, 'Tiến đạt');
INSERT INTO `tac_gia` VALUES (4, 'Mai đạo');
INSERT INTO `tac_gia` VALUES (5, 'Trần ánh');
INSERT INTO `tac_gia` VALUES (6, 'Nguyến mai');

INSERT INTO `quan_ly_thu_vien`.`chuyen_nganh` (`ten_chuyen_nganh`) VALUES ('Thiết kế web');
INSERT INTO `quan_ly_thu_vien`.`chuyen_nganh` (`ten_chuyen_nganh`) VALUES ('Lập trình ứng dụng');
INSERT INTO `quan_ly_thu_vien`.`chuyen_nganh` (`ten_chuyen_nganh`) VALUES ('Lập trình moblie');
INSERT INTO `quan_ly_thu_vien`.`chuyen_nganh` (`ten_chuyen_nganh`) VALUES ('Đồ họa');
INSERT INTO `quan_ly_thu_vien`.`chuyen_nganh` (`ten_chuyen_nganh`) VALUES ('Làm đẹp');
INSERT INTO `quan_ly_thu_vien`.`chuyen_nganh` (`ten_chuyen_nganh`) VALUES ('Makketing');


INSERT INTO `sinh_vien` VALUES (1, 'Mai Thị Gấm', '2022-08-01', 1, 'gammtph10005@fpt.edu.vn', '0344358618');
INSERT INTO `sinh_vien` VALUES (2, 'Đặng Đình Phương', '2022-09-05', 1, 'phuongddph10045@fpt.efu.vn', '0383438794');
INSERT INTO `sinh_vien` VALUES (3, 'Nguyễn văn Du', '2022-07-03', 1, 'dunvph10007@fpt.edu.vn', '0345476786');
INSERT INTO `sinh_vien` VALUES (4, 'Vũ Diệu Linh', '2022-10-01', 1, 'linhvdph09988@fpt.edu.vn', '0348792197');
INSERT INTO `sinh_vien` VALUES (5, 'Lương Tú', '2024-01-01', 2, 'tuluong@gmaiul.com', '0376264926');

INSERT INTO `quan_ly_thu_vien`.`loai_sach` (`ten_loai_sach`) VALUES ('CNTT');
INSERT INTO `quan_ly_thu_vien`.`loai_sach` (`ten_loai_sach`) VALUES ('Đồ họa');
INSERT INTO `quan_ly_thu_vien`.`loai_sach` (`ten_loai_sach`) VALUES ('Khách sạn');
INSERT INTO `quan_ly_thu_vien`.`loai_sach` (`ten_loai_sach`) VALUES ('Làm đẹp');
INSERT INTO `quan_ly_thu_vien`.`loai_sach` (`ten_loai_sach`) VALUES ('PR');

INSERT INTO `quan_ly_thu_vien`.`sach` (`tieu_de`, `ma_tac_gia`, `ma_xuat_ban`, `so_trang`, `so_luong_ban_sao`, `gia_tien`, `ngay_nhap_kho`, `vi_tri_dat_sach`, `ma_loai_sach`) VALUES ('SQL cơ bản', '1', '1', '23', '6', '1', '2017/2/1', '1', '1');
INSERT INTO `quan_ly_thu_vien`.`sach` (`tieu_de`, `ma_tac_gia`, `ma_xuat_ban`, `so_trang`, `so_luong_ban_sao`, `gia_tien`, `ngay_nhap_kho`, `vi_tri_dat_sach`, `ma_loai_sach`) VALUES ('SQL nâng cao', '2', '2', '45', '7', '2', '2017/2/3', '2', '1');
INSERT INTO `quan_ly_thu_vien`.`sach` (`tieu_de`, `ma_tac_gia`, `ma_xuat_ban`, `so_trang`, `so_luong_ban_sao`, `gia_tien`, `ngay_nhap_kho`, `vi_tri_dat_sach`, `ma_loai_sach`) VALUES ('HTML', '3', '4', '56', '6', '3', '2017/1/1', '3', '1');
INSERT INTO `quan_ly_thu_vien`.`sach` (`tieu_de`, `ma_tac_gia`, `ma_xuat_ban`, `so_trang`, `so_luong_ban_sao`, `gia_tien`, `ngay_nhap_kho`, `vi_tri_dat_sach`, `ma_loai_sach`) VALUES ('CSS', '4', '1', '32', '7', '4', '2017/1/3', '4', '1');
INSERT INTO `quan_ly_thu_vien`.`sach` (`tieu_de`, `ma_tac_gia`, `ma_xuat_ban`, `so_trang`, `so_luong_ban_sao`, `gia_tien`, `ngay_nhap_kho`, `vi_tri_dat_sach`, `ma_loai_sach`) VALUES ('PTS', '5', '2', '45', '10', '5', '2016/12/1', '6', '2');


-- Các câu sử lí query select tới các điều kiện 
-- 6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả
-- thuộc loại sách có mã “IT”.
select S.ma_sach "Mã sách", S.tieu_de "Tên sách",
S.gia_tien "Giá tiền", TG.ten_tac_gia "Tên tác giả",
XB.ten_nha_xuat_ban "Tên xuất bản", LS.ten_loai_sach "Tên loại sách"
from quan_ly_thu_vien.loai_sach LS
inner join quan_ly_thu_vien.sach S
on LS.ma_loai_sach=S.ma_loai_sach
inner join quan_ly_thu_vien.tac_gia TG
on TG.ma_tac_gia=S.ma_tac_gia 
inner join quan_ly_thu_vien.xuat_ban XB
on XB.ma_xuat_ban=S.ma_xuat_ban
where LS.ten_loai_sach like "%IT%";

-- 6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã
-- sinh viên có ngày mượn trong tháng 01/2017.
select PMS.ma_phieu "Mã Phiếu", CTP.ma_sach "Mã sách",
PMS.ngay_muon_sach "Ngày mượn", PMS.ma_sinh_vien "Mã sinh viên"
 from  quan_ly_thu_vien.chi_tiet_phieu CTP
inner join quan_ly_thu_vien.phieu_muon_sach PMS
on PMS.ma_phieu=CTP.ma_phieu
where year(PMS.ngay_muon_sach)=2017
and month(PMS.ngay_muon_sach)=1;

-- 6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày
-- mượn sách.
select PMS.ma_sinh_vien "Mã sinh viên",SV.ten_sinh_vien "Tên sinh viên", 
 PMS.ma_phieu "Mã phiếu" ,
 PMS.ngay_muon_sach "Ngày mượn sách" , PMS.ngay_tra "Ngày trả"
 from quan_ly_thu_vien.phieu_muon_sach PMS
 inner join quan_ly_thu_vien.sinh_vien SV
 on SV.ma_sinh_vien=PMS.ma_sinh_vien
where PMS.ngay_tra is null
order by PMS.ngay_muon_sach ;

-- 6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số
-- lượng sách mỗi loại).

select LS.ma_loai_sach "Mã loại sách", LS.ten_loai_sach "Tên loại sách",
sum(S.so_luong_ban_sao) "Tổng số lượng sách"
from quan_ly_thu_vien.sach S 
inner join quan_ly_thu_vien.loai_sach LS
on LS.ma_loai_sach=S.ma_loai_sach
group by LS.ma_loai_sach;

-- 6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
-- select count( PMS.ma_sinh_vien) "Số lượt sinh viên mượn sách"
-- from quan_ly_thu_vien.phieu_muon_sach PMS;
select count(PMS.ma_phieu) "Số lượt sinh viên đã mượn sách "
 from quan_ly_thu_vien.phieu_muon_sach PMS;
 
 -- 6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.

select S.ma_sach "Mã sách", S.tieu_de "Tên sách" ,
TG.ten_tac_gia "Tên tác giả",XB.ten_nha_xuat_ban "Tên xuất bản"
 from quan_ly_thu_vien.sach S 
inner join quan_ly_thu_vien.tac_gia TG
on S.ma_tac_gia=TG.ma_tac_gia
inner join quan_ly_thu_vien.xuat_ban XB
on XB.ma_xuat_ban=S.ma_xuat_ban
where S.tieu_de like "%SQL%";

-- 6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã
-- phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.

select SV.ma_sinh_vien "Mã sinh viên", SV.ten_sinh_vien "Tên sinh viên"
,PMS.ma_phieu "Mã phiếu mượn ", S.tieu_de "Tiêu đề sách"
,PMS.ngay_muon_sach "Ngày mượn sách", PMS.ngay_tra "Ngày trả"
 from quan_ly_thu_vien.sinh_vien SV
inner join quan_ly_thu_vien.phieu_muon_sach PMS
on PMS.ma_sinh_vien=SV.ma_sinh_vien
inner join quan_ly_thu_vien.chi_tiet_phieu CTP
on CTP.ma_phieu=PMS.ma_phieu
inner join quan_ly_thu_vien.sach S
on S.ma_sach=CTP.ma_sach
order by PMS.ngay_muon_sach ;


-- 6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 20 lần.
select S.ma_sach "Mã sách", S.tieu_de "Tên sách"
, count(S.ma_sach) "Số lượng mượn"
from quan_ly_thu_vien.chi_tiet_phieu CTP
inner join quan_ly_thu_vien.sach S
on S.ma_sach = CTP.ma_sach
group by(S.ma_sach)
having count(S.ma_sach) >2;


-- 6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm
-- 2014 giảm 30%.

update quan_ly_thu_vien.sach 
set gia_tien = gia_tien-gia_tien *  0.3
where year(ngay_nhap_kho) < 2014;

-- 6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã
-- sinh viên PD12301 (ví dụ).
 update quan_ly_thu_vien.phieu_muon_sach
 set ngay_tra = '2019-2-19'
 where ma_sinh_vien=2
 and year(ngay_muon_sach) <=2019
 and month(ngay_muon_sach) <=2
 and day(ngay_muon_sach) <=19;
 
 -- 6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn,
-- tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
select PMS.ma_phieu "Mã phiếu", SV.ten_sinh_vien "Tên sinh viên",
 SV.email "Email", CTP.ma_sach "Mã sách", 
 PMS.ngay_muon_sach "Ngày mượn sách", CTP.ma_sach "Mã sách"
 , S.tieu_de "Tên sách" , PMS.ngay_tra "Ngày trả"
from quan_ly_thu_vien.phieu_muon_sach PMS
inner join quan_ly_thu_vien.sinh_vien SV
on SV.ma_sinh_vien = PMS.ma_sinh_vien 
inner join quan_ly_thu_vien.chi_tiet_phieu CTP
on CTP.ma_phieu = PMS.ma_phieu
inner join quan_ly_thu_vien.sach S
on S.ma_sach = CTP.ma_sach
 where (curdate() > DATE_ADD(ngay_muon_sach, INTERVAL 7 day) and ngay_tra is null)
  or
 DATE_ADD(ngay_tra, INTERVAL -7 day) > ngay_muon_sach;

-- 6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có
-- lượt mượn lớn hơn 10 

update quan_ly_thu_vien.sach S
set so_luong_ban_sao = so_luong_ban_sao + 5
where ma_sach IN( 
select CTP.ma_sach "Mã sách"
from quan_ly_thu_vien.chi_tiet_phieu CTP
group by(CTP.ma_sach)
having count(CTP.ma_sach) >=3
);

-- 6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước,"1/1/2010‟
delete from quan_ly_thu_vien.phieu_muon_sach 
where year(ngay_muon_sach)<2010
and year(ngay_tra)<2010;

--  cái này chỉ update những thằng not null thôi
--  còn những thằng null sẽ k update




