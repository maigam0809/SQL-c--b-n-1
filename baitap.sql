
CREATE DATABASE LAYLOIHOI_DB;

use LAYLOIHOI_DB;

CREATE TABLE KHACH_HANG(
    MAKH INT PRIMARY KEY, 
    TENKH VARCHAR(30),
    DIACHI VARCHAR(50),
    SODT CHAR(11)
) ;
CREATE TABLE PHONG(
    MAPHONG INT PRIMARY KEY,
    LOAIPHONG VARCHAR(20),
    SOKHACHTOIDA INT,
    GIAPHONG DECIMAL(6,3),
    MOTA VARCHAR(255)
);
CREATE TABLE DAT_PHONG(
    MADATPHONG INT PRIMARY KEY,
    MAPHONG INT,
    MAKH INT,
    NGAYDAT DATE,
    GIOBATDAU TIME,
    GIOKETTHUC TIME,
    TIENDATCOC DECIMAL(6,3),
    GHICHU VARCHAR(255),
    TRANGTHAIDAT VARCHAR(30),
    FOREIGN KEY (MAPHONG) REFERENCES PHONG(MAPHONG) ON DELETE CASCADE ,
    FOREIGN KEY (MAKH) REFERENCES khach_hang(MAKH) ON DELETE CASCADE 
);
CREATE TABLE DICH_VU_DI_KEM(
    MADV INT PRIMARY KEY,
    TENDV VARCHAR(255),
    DONVITINH VARCHAR(30),
    DONGIA DECIMAL(6,3)
);
CREATE TABLE CHI_TIET_SU_DUNG_DV(
    MADATPHONG INT,
    MADV INT,
    SOLUONG INT,
    PRIMARY KEY (MADATPHONG, MADV),
    FOREIGN KEY (MADATPHONG) REFERENCES dat_phong(MADATPHONG) ON DELETE CASCADE 
);
 
-- INSERT DATA 
 
INSERT INTO `phong` (`MAPHONG`, `LOAIPHONG`, `SOKHACHTOIDA`, `GIAPHONG`, `MOTA`) VALUES
(1, 'LOAI 1', 20, '60.000', ''),
(2, 'LOAI 1', 25, '80.000', ''),
(3, 'LOAI 2', 15, '50.000', ''),
(4, 'LOAI 3', 20, '50.000', '');
 
INSERT INTO `khach_hang` (`MAKH`, `TENKH`, `DIACHI`, `SODT`) VALUES
(1, 'MARIA OZAWA', 'HOA XUAN', '11111111111'),
(2, 'TOKUDA', 'HOA XUAN', '11111111112'),
(3, 'MIKAMI YUA', 'HOA XUAN', '11111111113'),
(4, 'NGUYEN VAN D', 'HOA XUAN', '11111111114');
 
INSERT INTO `dich_vu_di_kem` (`MADV`, `TENDV`, `DONVITINH`, `DONGIA`) VALUES
(1, 'HOT GIRL', 'EM', '10.000'),
(2, 'HOA HAU', 'EM', '20.000'),
(3, 'BEER', 'LON', '10.000'),
(4, 'TRAI CAY', 'DIA', '35.000');
 
 
INSERT INTO `dat_phong` (`MADATPHONG`, `MAPHONG`, `MAKH`, `NGAYDAT`, `GIOBATDAU`, `GIOKETTHUC`, `TIENDATCOC`, `GHICHU`, `TRANGTHAIDAT`) VALUES
(1, 1, 2, '2018-03-26', '11:00:00', '13:00:00', '100.000', '', 'DA DAT'),
(2, 1, 3, '2018-03-27', '17:15:00', '19:15:00', '50.000', '', 'DA HUY'),
(3, 2, 2, '2018-03-26', '20:30:00', '22:15:00', '100.000', '', 'DA DAT'),
(4, 3, 1, '2018-04-01', '19:30:00', '21:15:00', '200.000', '', 'DA DAT');
 
INSERT INTO `chi_tiet_su_dung_dv` (`MADATPHONG`, `MADV`, `SOLUONG`) VALUES
(1, 1, 20),
(1, 2, 10),
(1, 3, 3),
(2, 2, 10),
(2, 3, 1),
(3, 3, 2),
(3, 4, 10);


