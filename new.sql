-- Bài 2:
-- a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
select * from quan_ly_khach_hang.khach_hang KH
inner join quan_ly_khach_hang.hoa_don HD
on HD.ma_khach_hang=KH.ma_khach_hang
where KH.ma_khach_hang
not in
(select ma_khach_hang from quan_ly_khach_hang.hoa_don HD
where year(HD.ngay_mua_hang)>=2016);

-- b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016

-- tim msp co luot mua nhieu nhat
select SP.ma_san_pham, SP.ten_sp
from quan_ly_khach_hang.san_pham SP
where sp.ma_san_pham in (
	SELECT HDCT.ma_san_pham
	from quan_ly_khach_hang.hoa_don_chi_tiet HDCT
	GROUP BY HDCT.ma_san_pham 
	having count(HDCT.ma_hoa_don) = (
		select max(sub.total) as max
		from (
			SELECT HDCT.ma_san_pham, count(HDCT.ma_hoa_don) as total
			from quan_ly_khach_hang.hoa_don_chi_tiet HDCT
			GROUP BY HDCT.ma_san_pham 
		) as sub
    )
);

SELECT HDCT.ma_san_pham, SP.ten_sp
from quan_ly_khach_hang.hoa_don_chi_tiet HDCT
INNER JOIN quan_ly_khach_hang.san_pham SP 
on HDCT.ma_san_pham = SP.ma_san_pham
GROUP BY HDCT.ma_san_pham 
having count(HDCT.ma_hoa_don) = (
	SELECT count(HDCT.ma_hoa_don) as total
	from quan_ly_khach_hang.hoa_don_chi_tiet HDCT
    inner join quan_ly_khach_hang.hoa_don HD on
    HD.ma_hoa_don = HDCT.ma_hoa_don
    where year(HD.ngay_mua_hang) = 2016 
    and month(HD.ngay_mua_hang) = 12
	GROUP BY HDCT.ma_san_pham 
	order by total desc 
	limit 1
);

-- c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
-- tinh tong tien nhieu nhat

SELECT KH.ten, YEAR(HD.ngay_mua_hang) 'Year',sum(HDCT.so_luong * SP.don_gia) 'Tong tien'
from quan_ly_khach_hang.hoa_don_chi_tiet HDCT
INNER JOIN quan_ly_khach_hang.san_pham SP 
on HDCT.ma_san_pham = SP.ma_san_pham
INNER JOIN quan_ly_khach_hang.hoa_don HD
on HD.ma_hoa_don = HDCT.ma_hoa_don
INNER JOIN quan_ly_khach_hang.khach_hang KH
on KH.ma_khach_hang = HD.ma_khach_hang
where year(HD.ngay_mua_hang)=2016
group by (HD.ma_khach_hang)
order by sum(HDCT.so_luong * SP.don_gia) desc
limit 5;


-- d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên
-- “Iphone 7 32GB” trong tháng 12/2016

select * from quan_Ly_khach_hang.khach_hang KH 
inner join quan_ly_khach_hang.hoa_don HD
on HD.ma_khach_hang=KH.ma_khach_hang
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT
on HDCT.ma_hoa_don=HD.ma_hoa_don 
inner join quan_ly_khach_hang.san_pham SP
on SP.ma_san_pham=HDCT.ma_san_pham

where KH.dia_chi like "%Da Nang%"
and year(HD.ngay_mua_hang)=2016
and month(HD.ngay_mua_hang)=12
and SP.ten_sp like "%giay%";

-- e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản
-- phẩm
select avg(so_luong) from quan_ly_khach_hang.hoa_don_chi_tiet HDCT;

select SP.ten_sp "Tên sản phẩm",HDCT.so_luong "Số lượng"
from quan_ly_khach_hang.san_pham SP
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT 
on SP.ten_san_pham=HDCT.ma_san_pham ;

select SP.ten_sp "Tên sản phẩm",HDCT.so_luong "Số lượng"
from quan_ly_khach_hang.san_pham SP
inner join quan_ly_khach_hang.hoa_don_chi_tiet HDCT 
on SP.ma_san_pham=HDCT.ma_san_pham 
where HDCT.so_luong <
(select avg(so_luong) from quan_ly_khach_hang.hoa_don_chi_tiet HDCT);








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





 
