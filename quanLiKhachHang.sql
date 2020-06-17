create database quan_ly_khach_hang;
use quan_ly_khach_hang;

create table khach_hang(
ma_khach_hang int not null primary key auto_increment,
ten_dem varchar(50) not null,
ten varchar(50) not null,
dia_chi varchar(255) not null,
email varchar(50) not null,
dien_thoai varchar(15) not null
);

create table san_pham(
ma_san_pham int not null primary key auto_increment,
mo_ta varchar(255) not null ,
so_luong int not null,
don_gia double not null,
ten_sp varchar(50) not null
);

create table hoa_don(
 ma_hoa_don int not null primary key auto_increment,
ngay_mua_hang date not null,
ma_khach_hang int not null,
 foreign key(ma_khach_hang) references khach_hang(ma_khach_hang) ,
 trang_thai varchar(30) not null
);

create table hoa_don_chi_tiet(
ma_hoa_don_chi_tiet int not null primary key auto_increment,
ma_hoa_don int not null,
foreign key (ma_hoa_don) references hoa_don(ma_hoa_don),
ma_san_pham int not null,
foreign key (ma_san_pham) references san_pham(ma_san_pham),
so_luong int not null
);


INSERT INTO `khach_hang` (`ma_khach_hang`, `ten_dem`, `ten`, `dia_chi`, `email`, `dien_thoai`) VALUES
(1, 'Mai', 'Gam', 'Nam Dinh', 'maigam08092000@gmail.com', '0344358618'),
(2, 'Luong', 'Tu', 'Ha Noi', 'luongtu996@gmail.com', '0376864926'),
(3, 'Dang', 'Phuong', 'Hai Duong', 'dangphuong@gmail.com', '05434343284'),
(4, 'Nguyen', 'Du', 'Hai Duong', 'dunv@gmail.com', '05232641'),
(5, 'Nguyen', 'Anh', 'Bac Giang', 'anhvq@gmail.com', '04463472473'),
(6, 'Luong', 'Ham', 'Da Nang', 'daitq@gmail.com', '045634218'),
(7, 'Dao', 'Cuong', 'Thai Binh', 'daitq@gmail.com', '045634218'),
(8, 'Luu', 'Dat', 'Da Nang', 'daitq@gmail.com', '045634218'),
(9, 'Tran', 'Di', 'Thai Binh', 'daitq@gmail.com', '045634218'),
(10, 'Luong', 'La', 'Nam Dinh', 'daitq@gmail.com', '045634218'),
(11, 'Dinh', 'Bai', 'Sai Gon', 'daitq@gmail.com', '045634218'),
(12, 'Nguyen', 'Dai', 'Thai Binh', 'daitq@gmail.com', '045634218'),
(13, 'Mai', 'Huong', 'Nam Dinh', 'huongnv@gmail.com', '045678930'),
(14, 'Luong', 'Khai', 'Lang Son', 'khailv@gmail.com', '03462374'),
(15, 'Luong', 'Quoc', 'Hai Hau', 'quoclq@gmail.com', '09876453');

INSERT INTO `san_pham` (`ma_san_pham`, `mo_ta`, `so_luong`, `don_gia`, `ten_sp`) VALUES
(1, 'a', 234, 123, 'but'),
(2, 'b', 343, 6768, 'giay'),
(3, 'c', 4535, 52552, 'chi'),
(4, 'a', 21, 536, 'thuoc'),
(5, 'f', 12, 25254, 'dong ho'),
(6, 'g', 435, 500000, 'bi'),
(7, 'h', 220, 55465789, 'ao'),
(8, 'k', 269, 3255, 'quan'),
(9, 'i', 200, 0, 'jean'),
(10, 'b', 2, 4543, 'thuoc'),
(11, 'k', 101, 32532, 'giay'),
(12, 'a', 50, 12, 'but'),
(13, 'h', 24, 18, 'ao');

INSERT INTO `hoa_don` (`ma_hoa_don`, `ngay_mua_hang`, `ma_khach_hang`, `trang_thai`) VALUES
(1, '2020-10-24', 1, 'chua thanh toan'),
(2, '2020-09-23', 3, 'chua thanh toan'),
(3, '2010-05-15', 5, ' da thanh toan'),
(4, '2016-02-19', 6, 'chua thanh toan'),
(5, '2007-07-10', 9, 'chua thanh toan'),
(6, '2009-07-02', 1, 'thanh toan'),
(7, '2016-01-05', 1, 'chua thanh toan'),
(8, '2012-02-07', 2, 'chua thanh toan'),
(9, '2016-04-29', 8, 'thanh toan'),
(10, '2016-12-17', 3, 'chua thanh toan'),
(11, '2020-10-24', 2, 'chua mua hang'),
(12, '2020-09-23', 3, 'chua mua hang'),
(13, '2010-05-15', 4, 'thanh toan'),
(14, '2006-02-19', 1, 'thanh toan'),
(15, '2007-07-10', 5, 'chua mua hang'),
(16, '2009-07-02', 1, 'thanh toan'),
(17, '2016-12-05', 7, 'chua mua hang'),
(18, '2012-02-07', 9, 'chua mua hang'),
(19, '2016-04-29', 11, 'thanh toan'),
(20, '2019-12-17', 3, 'chua mua hang'),
(21, '2016-06-05', 5, 'chua thanh toan');

INSERT INTO `hoa_don_chi_tiet` (`ma_hoa_don_chi_tiet`, `ma_hoa_don`, `ma_san_pham`, `so_luong`) VALUES
(1, 1, 2, 1),
(2, 2, 2, 12),
(3, 3, 2, 11),
(4, 4, 2, 21),
(5, 5, 2, 17),
(6, 1, 2, 81),
(7, 2, 2, 19),
(8, 3, 2, 32),
(9, 3, 2, 31),
(10, 6, 2, 15),
(11, 1, 5, 1),
(12, 2, 4, 12),
(13, 3, 6, 11),
(14, 4, 3, 21),
(15, 5, 8, 17),
(16, 1, 5, 81),
(17, 2, 9, 19),
(18, 3, 2, 32),
(19, 3, 5, 31),
(20, 6, 2, 15);


-- okok

-- Câu 1: Hiển thị tất cả thông tin trong bảng khách hàng bao gồm tát cả các cột 
select * from quan_ly_khach_hang.khach_hang;
-- Câu 2:Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã
-- khách hàng, họ và tên, email, số điện thoại 
select ma_khach_hang as "Mã khách hàng",concat(ten_dem,'-',ten) as "Họ và tên", 
mail as "Email", dien_thoai as "Điện Thoại"
from quan_ly_khach_hang.khach_hang limit 10;

--  câu 3:Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm,
-- tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select ma_san_pham "Mã sản phẩm",
      ten_sp "Tên Sản Phẩm",
      don_gia*so_luong "Tổng tền tồn kho"
	  from quan_ly_khach_hang.san_pham;
 
-- . Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột:
-- maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột
-- hoVaTenLot và Ten
select ma_khach_hang "Mã Khách Hàng",
       concat(ten_dem,'-',ten) "Họ và Tên",
       dia_chi "Địa Chỉ"
	   from quan_ly_khach_hang.khach_hang;

-- e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
select * from quan_ly_khach_hang.khach_hang 
where dia_chi like "Da Nang";

-- f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
select * from quan_ly_khach_hang.san_pham 
where so_luong >=100 and so_luong <=500;
-- cách 2:
select * from quan_ly_khach_hang.san_pham
where so_luong between 100 and 500;

-- g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng
-- trong năm 2016
select * from quan_ly_khach_hang.hoa_don 
where trang_thai 
like "chua thanh toan" 
and year(ngay_mua_hang)=2016;

-- h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003,
-- KH006
select * from quan_ly_khach_hang.hoa_don
 where ma_khach_hang in (1,3,6); 
-- cách 2:
select *from quan_ly_khach_hang.hoa_don
where (ma_khach_hang)=1
or ma_khach_hang=3
or ma_khach_hang=6;

-- Bài 2:
-- a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(ma_khach_hang) "Số lượng khách hàng" from quan_ly_khach_hang.khach_hang ;

-- b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(don_gia) "Đơn giá lớn nhất" 
from quan_ly_khach_hang.san_pham;

-- c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(so_luong) "Số lượng sản phẩm thấp nhất" 
from quan_ly_khach_hang.san_pham;

-- d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select sum(so_luong) "Tổng số lượng sản phẩm"
 from quan_ly_khach_hang.san_pham;

-- e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select * from quan_ly_khach_hang.hoa_don
where trang_thai like 'chua thanh toan'
and year (ngay_mua_hang)=2016 
and month (ngay_mua_hang)=12;
-- >nếu thử tháng 1 và tháng 2 sẽ ra kết quả

-- f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select ma_hoa_don "Mã Hóa Đơn",count(ma_san_pham) "Tổng số loại sản phẩm"
from quan_ly_khach_hang.hoa_don_chi_tiet
  group by(ma_hoa_don);

-- g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu
-- chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select ma_hoa_don "Mã Hóa Đơn",count(ma_san_pham) " Số loại sản phẩm"
 from quan_ly_khach_hang.hoa_don_chi_tiet 
 group by (ma_hoa_don)
 having count(ma_san_pham) >= 5;
-- h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang,
-- maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select ma_hoa_don "Mã Hóa Đơn",ngay_mua_hang "Ngày Mua hàng",ma_khach_hang "Mã Khách hàng"
 from quan_ly_khach_hang.hoa_don
 order by  ngay_mua_hang desc;
 
--  bài hôm nay slide 6
select *from quan_ly_khach_hang.khach_hang,quan_ly_khach_hang.hoa_don 
where hoa_don.ma_khach_hang=1;

select KH.ma_khach_hang,KH.ten,HD.ma_hoa_don,HD.ma_khach_hang
 from quan_ly_khach_hang.khach_hang KH
 inner join quan_ly_khach_hang.hoa_don HD 
 on  KH.ma_khach_hang = HD.ma_khach_hang ;
 
 select KH.ma_khach_hang,KH.ten,HD.ma_hoa_don,HD.ma_khach_hang
 from quan_ly_khach_hang.khach_hang KH
 inner join quan_ly_khach_hang.hoa_don HD 
 on  KH.ma_khach_hang = HD.ma_khach_hang
 inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
 on  HDCT.hoa_don=HD.ma_hoa_don;
 
--  haft join-- 

-- a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
-- sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua
select HD.ma_hoa_don  "Mã hóa đơn", HD.ma_khach_hang "Mã khách hàng",
 HD.trang_thai "Trạng thái", HDCT.ma_san_pham "Mã sản phẩm"
 ,HDCT.so_luong "Số lượng",HD.ngay_mua_hang "Ngày mua hàng"
from quan_ly_khach_hang.hoa_don HD 
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on  HD.ma_hoa_don = HDCT.ma_hoa_don;


-- b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
-- sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với
-- điều kiện maKhachHang = ‘KH001’
select HD.ma_hoa_don "Mã hóa đơn",HD.ma_khach_hang " Mã khách hàng",
HD.trang_thai "Trạng thái",HDCT.ma_san_pham "Mã sản phẩm",
HDCT.so_luong "Số lượng", HD.ngay_mua_hang "Ngày mua hàng"
from quan_ly_khach_hang.hoa_don HD 
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on HD.ma_hoa_don=HDCT.ma_hoa_don where HD.ma_khach_hang=1;


-- c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột
-- sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành
-- tiền. Với thành tiền= donGia* soLuong

select HD.ma_hoa_don "Mã hóa đơn", HD.ngay_mua_hang "Ngày mua hàng",
SP.ten_sp "Tên sản phẩm",SP.don_gia " Đơn giá",
HDCT.so_luong "Số lượng",SP.don_gia*HDCT.so_luong "Thành tiền"
from quan_ly_khach_hang.hoa_don HD
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on  HD.ma_hoa_don=HDCT.ma_hoa_don
inner join quan_ly_khach_hang.san_pham SP
on HDCT.ma_san_pham=SP.ma_san_pham;



-- d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các
-- cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và
-- tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh
-- toán.
select concat(KH.ten_dem," ",KH.ten) "Họ và tên khách hàng", KH.email "Email",
KH.dien_thoai "Điện thoại", HD.ma_hoa_don "Mã hóa đơn",
HD.trang_thai "Trạng thái",HDCT.so_luong*SP.don_gia "Tổng tiền"
from quan_ly_khach_hang.khach_hang KH 
inner join quan_ly_khach_hang.hoa_don HD
on KH.ma_khach_hang=HD.ma_khach_hang
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on HD.ma_hoa_don=HDCT.ma_hoa_don
inner join quan_ly_khach_hang.san_pham SP
on HDCT.ma_san_pham=SP.ma_san_pham
where HD.trang_thai like "%chua thanh toan%";


-- e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
-- hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần
-- của cột tổng tiền.
select HD.ma_hoa_don "Mã hóa đơn",HD.ngay_mua_hang "Ngày mua hàng",
HDCT.so_luong*SP.don_gia "Tổng tiền"
from quan_ly_khach_hang.hoa_don HD
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on HD.ma_hoa_don=HDCT.ma_hoa_don
inner join quan_ly_khach_hang.san_pham SP
on HDCT.ma_san_pham=SP.ma_san_pham
where HDCT.so_luong*SP.don_gia  >=500000
order by  HDCT.so_luong*SP.don_gia desc;





-- Bài 2:
-- a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
select * from quan_ly_khach_hang.khach_hang KH2
where KH2.ma_khach_hang 
not in
(
select 
KH.ma_khach_hang "Mã khách hàng"
from quan_ly_khach_hang.khach_hang KH 
inner join quan_ly_khach_hang.hoa_don HD
on KH.ma_khach_hang=HD.ma_khach_hang
where year (HD.ngay_mua_hang)>=2016 
and month(HD.ngay_mua_hang)>=1
and date(HD.ngay_mua_hang)>=1
);

-- Kiểm tra 
select * from quan_ly_khach_hang.hoa_don HD
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on HD.ma_hoa_don=HDCT.ma_hoa_don
inner join quan_ly_khach_hang.khach_hang  KH
on KH.ma_khach_hang=HD.ma_khach_hang
where KH.ma_khach_hang=5;

-- b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
select SP.ma_san_pham "Mã sản phẩm",HD.ma_khach_hang "Mã khách hàng"
, SP.ten_sp "Tên sản phẩm",count( SP.ma_san_pham) "Số lượng sản phẩm"
,HD.ngay_mua_hang "Ngày mua hàng"
from quan_ly_khach_hang.hoa_don_chi_tiet HDCT 
inner join quan_ly_khach_hang.san_pham  SP
on HDCT.ma_san_pham=SP.ma_san_pham
inner join quan_ly_khach_hang.hoa_don HD
on HDCT.ma_hoa_don=HD.ma_hoa_don
where year(ngay_mua_hang)=2016
and month(ngay_mua_hang)=12
group by SP.ma_san_pham, SP.ten_sp 
order by count( SP.ma_san_pham) desc limit 1;




-- c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
select  KH.ma_khach_hang "Mã khách hàng",concat(KH.ten_dem," ",KH.ten) "Họ và tên",
SP.don_gia *SP.so_luong "Tổng tiền", HD.ngay_mua_hang "Ngày mua hàng"
from  quan_ly_khach_hang.san_pham SP
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on SP.ma_san_pham=HDCT.ma_san_pham
inner join quan_ly_khach_hang.hoa_don HD
on HD.ma_hoa_don=HDCT.ma_hoa_don
inner join quan_ly_khach_hang.khach_hang KH
on HD.ma_khach_hang=KH.ma_khach_hang
where year(HD.ngay_mua_hang)=2016
group by KH.ma_khach_hang
order by count( SP.ma_san_pham) desc limit 5;  


-- d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên
-- “Iphone 7 32GB” trong tháng 12/2016

-- sub
select *
from quan_ly_khach_hang.khach_hang KH
where KH.dia_chi = 'Da Nang'
and KH.ma_khach_hang in(
select HD.ma_khach_hang
from quan_ly_khach_hang.hoa_don HD
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on HDCT.ma_hoa_don=HD.ma_hoa_don
inner join quan_ly_khach_hang.san_pham SP
on HDCT.ma_san_pham=SP.ma_san_pham
where SP.ten_sp="giay" 
and year(HD.ngay_mua_hang)=2016
and month(HD.ngay_mua_hang)=12
);


select KH.ma_khach_hang "Mã khách hàng",
KH.ten "Tên khách hàng", KH.dia_chi "Địa chỉ",
SP.ten_sp "Tên sản phẩm", HD.ngay_mua_hang "Ngày mua hàng"
from quan_ly_khach_hang.khach_hang KH
inner join quan_ly_khach_hang.hoa_don HD
on KH.ma_khach_hang=HD.ma_khach_hang
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on HDCT.ma_hoa_don=HD.ma_hoa_don
inner join quan_ly_khach_hang.san_pham SP
on HDCT.ma_san_pham=SP.ma_san_pham
where KH.dia_chi="Da Nang" 
and SP.ten_sp="giay"
and year(HD.ngay_mua_hang)=2016
and month(HD.ngay_mua_hang)=12;




-- e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản
-- phẩm

-- Cách làm mấy câu subquery: 
-- Phân tích subquery thành 2 câu query
-- Làm vế sau trước làm vế đầu sau rồi ghép 2 câu vào 1
-- Đọc cái này nhá oke anh


-- Ở đây phân tích thành 2 câu như sau: 
-- 1: Tìm lượt mua trung bình các các sản phẩm
SELECT avg(HDCT.so_luong) "Tổng trung bình" FROM quan_ly_khach_hang.hoa_don_chi_tiet as HDCT;

-- 2: Hiển thị tên sản phẩm có lượt đặt mua bất kì
select SP.ten_sp "Tên sản phẩm", HDCT.so_luong "Số lượng bán"
from 
quan_ly_khach_hang.san_pham as SP
 inner join quan_ly_khach_hang.hoa_don_chi_tiet as HDCT 
 on SP.ma_san_pham = HDCT.ma_hoa_don;

-- Làm được 2 câu này rồi nối lại với nhau qua điều kiện lượt đặt mua nhỏ hơn lượt mua trung bình
-- => OK

select SP.ten_sp "Tên sản phẩm", HDCT.so_luong "Số lượng bán"
from quan_ly_khach_hang.san_pham as SP 
inner join quan_ly_khach_hang.hoa_don_chi_tiet as HDCT
 on SP.ma_san_pham = HDCT.ma_hoa_don
where HDCT.so_luong < (
SELECT avg(HDCT.so_luong) "Tổng trung bình" 
FROM quan_ly_khach_hang.hoa_don_chi_tiet as HDCT
);

 
-- đề bải họ bảo là số lượng đặt mua. không phải là mã sản phẩm.
-- mã sản phầm chỉ có tác dụng liên kết với các bảng khác và đánh dấu là duy nhất thôi
-- e tính trung bình mã sản phầm có được gì đâu.

SELECT SP.ma_san_pham "Mã sản phẩm"
FROM quan_ly_khach_hang.san_pham SP
WHERE SP.ma_san_pham > (SELECT avg(SP.ma_san_pham) AS "Tổng trung bình" FROM quan_ly_khach_hang.san_pham)
ORDER BY ma_san_pham;


select SP.ten_sp "Tên sản phẩm", count(SP.ma_san_pham) "Số mã sản phẩm"
 from quan_ly_khach_hang.san_pham SP
 having count(SP.ma_san_pham)< (select avg(SP.ma_san_pham) from quan_ly_khach_hang.san_pham);
 
--  lab 07
update quan_ly_khach_hang.san_pham as SP
set SP.don_gia=6 where quan_ly_khach_hang.hoa_don_chi_tiet =(select HDCT.ma_san_pham from quan_ly_khach_hang.hoa_don_chi_tiet HDCT);

-- Tạo chỉ mục



 









