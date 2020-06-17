
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
ngay_tra date ,
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




