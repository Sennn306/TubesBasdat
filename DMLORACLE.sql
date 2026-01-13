-- ===================================================
-- INSERT DATA REFERENSI / MASTER
-- ===================================================

-- Insert Faktor Emisi
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Motor', 0.21, 'kg CO2/km');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Mobil Pribadi', 0.25, 'kg CO2/km');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Bus', 0.12, 'kg CO2/km');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('KRL', 0.05, 'kg CO2/km');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Ojek Online', 0.15, 'kg CO2/km');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Pesawat Domestik', 0.25, 'kg CO2/km');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Pesawat Internasional', 0.30, 'kg CO2/km');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Kereta Api', 0.03, 'kg CO2/km');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('PLTU Batubara', 0.90, 'kg CO2/kWh');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('PLTG (Gas)', 0.50, 'kg CO2/kWh');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('PLTS Rooftop', 0.05, 'kg CO2/kWh');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Kertas HVS 70gr', 0.10, 'kg CO2/lembar');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Kertas HVS 80gr', 0.12, 'kg CO2/lembar');
INSERT INTO FaktorEmisi (NamaFaktor, NilaiFaktor, Satuan) VALUES ('Kertas Daur Ulang', 0.06, 'kg CO2/lembar');

-- Insert Unit
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Rektorat', 'Administrasi', NULL);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Fakultas Teknik', 'Akademik', NULL);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Fakultas Ekonomi', 'Akademik', NULL);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Fakultas Hukum', 'Akademik', NULL);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Fakultas Kedokteran', 'Akademik', NULL);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Program Studi Teknik Informatika', 'Prodi', 2);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Program Studi Teknik Elektro', 'Prodi', 2);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Program Studi Manajemen', 'Prodi', 3);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Program Studi Akuntansi', 'Prodi', 3);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Program Studi Ilmu Hukum', 'Prodi', 4);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Program Studi Pendidikan Dokter', 'Prodi', 5);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Laboratorium Komputasi', 'Lab', 6);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Laboratorium Jaringan', 'Lab', 7);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Laboratorium Akuntansi', 'Lab', 9);
INSERT INTO Unit (NamaUnit, JenisUnit, UnitParentID) VALUES ('Klinik Pendidikan', 'Lab', 11);

-- Insert Gedung dengan Faktor Emisi Listrik
INSERT INTO Gedung (NamaGedung, FaktorID) VALUES ('Gedung Rektorat', 9);
INSERT INTO Gedung (NamaGedung, FaktorID) VALUES ('Gedung A - Teknik', 9);
INSERT INTO Gedung (NamaGedung, FaktorID) VALUES ('Gedung B - Ekonomi', 10);
INSERT INTO Gedung (NamaGedung, FaktorID) VALUES ('Gedung C - Hukum', 10);
INSERT INTO Gedung (NamaGedung, FaktorID) VALUES ('Gedung D - Kedokteran', 9);
INSERT INTO Gedung (NamaGedung, FaktorID) VALUES ('Gedung E - Laboratorium', 11);

-- Insert Ruangan
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (1, 'R001', 'Ruang Rektor');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (1, 'S001', 'Sekretariat Rektorat');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (2, 'T101', 'Kelas Teknik Informatika');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (2, 'T102', 'Lab Komputasi');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (2, 'T103', 'Ruang Dosen Teknik');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (3, 'E201', 'Kelas Manajemen');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (3, 'E202', 'Lab Akuntansi');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (3, 'E203', 'Ruang Dosen Ekonomi');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (4, 'H301', 'Kelas Hukum');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (4, 'H302', 'Perpustakaan Hukum');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (5, 'K401', 'Kelas Kedokteran');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (5, 'K402', 'Klinik Pendidikan');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (5, 'K403', 'Lab Anatomi');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (6, 'L501', 'Lab Jaringan');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (6, 'L502', 'Lab Umum');
INSERT INTO Ruangan (GedungID, KodeRuangan, NamaRuangan) VALUES (6, 'L503', 'Ruang Server');

-- Insert Moda Transportasi
INSERT INTO ModaTransportasi (NamaTransportasi, fac_id) VALUES ('Motor', 1);
INSERT INTO ModaTransportasi (NamaTransportasi, fac_id) VALUES ('Mobil Pribadi', 2);
INSERT INTO ModaTransportasi (NamaTransportasi, fac_id) VALUES ('Bus', 3);
INSERT INTO ModaTransportasi (NamaTransportasi, fac_id) VALUES ('KRL', 4);
INSERT INTO ModaTransportasi (NamaTransportasi, fac_id) VALUES ('Ojek Online', 5);
INSERT INTO ModaTransportasi (NamaTransportasi, fac_id) VALUES ('Pesawat Domestik', 6);
INSERT INTO ModaTransportasi (NamaTransportasi, fac_id) VALUES ('Pesawat Internasional', 7);
INSERT INTO ModaTransportasi (NamaTransportasi, fac_id) VALUES ('Kereta Api', 8);

-- ===================================================
-- INSERT DATA PENGGUNA (30+ ORANG)
-- ===================================================

INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (1, NULL, 'Dr. Ahmad Setyawan', 'Rektor', 'rektor@univ.ac.id', '08110000001');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (1, 1, 'Prof. Budi Santoso', 'Wakil Rektor', 'warek@univ.ac.id', '08110000002');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (1, 2, 'Diana Putri', 'Staf Administrasi', 'diana@univ.ac.id', '08110000003');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (2, 1, 'Prof. Candra Wijaya', 'Dekan Teknik', 'dekan.teknik@univ.ac.id', '08110000004');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (3, 1, 'Dr. Eva Nurmalasari', 'Dekan Ekonomi', 'dekan.ekonomi@univ.ac.id', '08110000005');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (4, 1, 'Prof. Fajar Hidayat', 'Dekan Hukum', 'dekan.hukum@univ.ac.id', '08110000006');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (5, 1, 'Dr. Gita Rahayu', 'Dekan Kedokteran', 'dekan.kedokteran@univ.ac.id', '08110000007');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (6, 4, 'Maya Indah, M.Kom', 'Ketua Prodi TI', 'kaprodi.ti@univ.ac.id', '08110000008');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (7, 4, 'Rizki Pratama, M.T', 'Ketua Prodi Elektro', 'kaprodi.el@univ.ac.id', '08110000009');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (8, 5, 'Nova Arianti, M.M', 'Ketua Prodi Manajemen', 'kaprodi.man@univ.ac.id', '08110000010');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (9, 5, 'Sari Dewi, M.Ak', 'Ketua Prodi Akuntansi', 'kaprodi.ak@univ.ac.id', '08110000011');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (10, 6, 'Bambang Sutrisno, M.H', 'Ketua Prodi Hukum', 'kaprodi.hukum@univ.ac.id', '08110000012');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (11, 7, 'Dr. Rina Melati, Sp.PD', 'Ketua Prodi Kedokteran', 'kaprodi.kedokteran@univ.ac.id', '08110000013');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (12, 8, 'Andi Setiawan, M.Kom', 'Kepala Lab Komputasi', 'labkom@univ.ac.id', '08110000014');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (13, 9, 'Dewi Anggraini, M.T', 'Kepala Lab Jaringan', 'labjar@univ.ac.id', '08110000015');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (14, 11, 'Rudi Hartono, M.Ak', 'Kepala Lab Akuntansi', 'labak@univ.ac.id', '08110000016');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (15, 13, 'Dr. Siska Wulandari, Sp.KK', 'Kepala Klinik', 'klinik@univ.ac.id', '08110000017');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (6, 8, 'Rafi Maulana', 'Mahasiswa', 'rafi.ti@univ.ac.id', '08120000001');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (6, 8, 'Siti Aminah', 'Mahasiswa', 'siti.ti@univ.ac.id', '08120000002');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (6, 8, 'Hendra Kurniawan', 'Mahasiswa', 'hendra.ti@univ.ac.id', '08120000003');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (6, 8, 'Wulan Sari', 'Mahasiswa', 'wulan.ti@univ.ac.id', '08120000004');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (7, 9, 'Ayu Lestari', 'Mahasiswa', 'ayu.el@univ.ac.id', '08120000005');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (7, 9, 'Fajar Ramadhan', 'Mahasiswa', 'fajar.el@univ.ac.id', '08120000006');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (8, 10, 'Bella Oktaviani', 'Mahasiswa', 'bella.man@univ.ac.id', '08120000007');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (8, 10, 'Cahyo Pratomo', 'Mahasiswa', 'cahyo.man@univ.ac.id', '08120000008');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (9, 11, 'Dito Alamsyah', 'Mahasiswa', 'dito.ak@univ.ac.id', '08120000009');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (9, 11, 'Eka Suryani', 'Mahasiswa', 'eka.ak@univ.ac.id', '08120000010');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (10, 12, 'Genta Putra', 'Mahasiswa', 'genta.hukum@univ.ac.id', '08120000011');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (10, 12, 'Hana Marlina', 'Mahasiswa', 'hana.hukum@univ.ac.id', '08120000012');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (11, 13, 'Irfan Syahputra', 'Mahasiswa', 'irfan.ked@univ.ac.id', '08120000013');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (11, 13, 'Jihan Aulia', 'Mahasiswa', 'jihan.ked@univ.ac.id', '08120000014');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (12, 14, 'Lukman Hakim', 'Asisten Lab', 'lukman.lab@univ.ac.id', '08130000001');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (13, 15, 'Mega Puspita', 'Asisten Lab', 'mega.lab@univ.ac.id', '08130000002');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (14, 16, 'Nando Septian', 'Asisten Lab', 'nando.lab@univ.ac.id', '08130000003');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (15, 17, 'Oki Setiawan', 'Asisten Klinik', 'oki.klinik@univ.ac.id', '08130000004');
INSERT INTO Pengguna (UnitID, AtasanID, Nama, Posisi, Email, Telepon) VALUES (12, 14, 'Putri Anggraeni', 'Teknisi Lab', 'putri.lab@univ.ac.id', '08130000005');

-- ===================================================
-- INSERT AKTIVITAS & DETAIL (JANUARI 2024)
-- ===================================================

-- Aktivitas 1: Transportasi Harian multi-moda (Bus + KRL) - Mahasiswa TI
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (18, 'TransportasiHarian', DATE '2024-01-10', 'Pergi kampus');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (1, 3, 5.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (1, 4, 20.0);

-- Aktivitas 2: Transportasi Harian multi-moda (KRL + Ojek) - Mahasiswa TI
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (19, 'TransportasiHarian', DATE '2024-01-10', 'Pulang kampus');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (2, 4, 15.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (2, 5, 3.0);

-- Aktivitas 3: Transportasi Harian single-moda (Motor) - Mahasiswa TI
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (20, 'TransportasiHarian', DATE '2024-01-11', 'Pergi kuliah');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (3, 1, 10.0);

-- Aktivitas 4: Listrik Lab Komputasi (Januari)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (14, 'Listrik', DATE '2024-01-31', 'Pemakaian bulan Januari');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (4, 4, 1250.5);

-- Aktivitas 5: Kertas ujian mid TI
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (8, 'Kertas', DATE '2024-01-20', 'Ujian Mid TI');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (5, 12, 5.0); -- 5 rim = 2500 lembar

-- Aktivitas 6: Business Trip Rektor ke Surabaya
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (1, 'BusinessTrip', DATE '2024-01-25', 'Seminar Nasional di Surabaya');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (6, 'Surabaya', DATE '2024-01-27');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (1, 6, 800.0);
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (1, 2, 50.0); -- Pesawat + Mobil

-- ===================================================
-- INSERT AKTIVITAS & DETAIL (FEBRUARI 2024)
-- ===================================================

-- Aktivitas 7: Business Trip Dekan Teknik ke Jakarta
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (4, 'BusinessTrip', DATE '2024-02-05', 'Rektoran di Jakarta');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (7, 'Jakarta', DATE '2024-02-07');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (2, 8, 750.0); -- Kereta Api

-- Aktivitas 8: Transportasi Harian multi-moda (Mobil + Bus) - Mahasiswa Manajemen
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (22, 'TransportasiHarian', DATE '2024-02-12', 'Pergi kampus');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (8, 2, 8.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (8, 3, 12.0);

-- Aktivitas 9: Listrik Lab Jaringan (Februari)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (15, 'Listrik', DATE '2024-02-29', 'Pemakaian bulan Februari');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (9, 14, 980.3);

-- Aktivitas 10: Kertas administrasi akreditasi
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (10, 'Kertas', DATE '2024-02-18', 'Dokumen akreditasi');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (10, 12, 3.0); -- 3 rim = 1500 lembar

-- Aktivitas 11: Transportasi Harian (Motor) - Mahasiswa Akuntansi
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (24, 'TransportasiHarian', DATE '2024-02-20', 'Pergi praktikum');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (11, 1, 15.0);

-- ===================================================
-- INSERT AKTIVITAS & DETAIL (MARET 2024)
-- ===================================================

-- Aktivitas 12: Business Trip Wakil Rektor ke Singapura
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (2, 'BusinessTrip', DATE '2024-03-01', 'Konferensi di Singapura');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (12, 'Singapura', DATE '2024-03-05');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (3, 7, 1200.0); -- Pesawat Internasional

-- Aktivitas 13: Transportasi Harian multi-moda (Ojek + KRL + Bus) - Mahasiswa Hukum
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (26, 'TransportasiHarian', DATE '2024-03-15', 'Pulang kampus');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (13, 5, 2.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (13, 4, 18.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (13, 3, 6.0);

-- Aktivitas 14: Listrik Klinik Pendidikan (Maret)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (17, 'Listrik', DATE '2024-03-31', 'Pemakaian bulan Maret');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (14, 12, 1100.7);

-- Aktivitas 15: Kertas penelitian kedokteran
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (13, 'Kertas', DATE '2024-03-22', 'Print jurnal penelitian');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (15, 12, 8.0); -- 8 rim = 4000 lembar

-- Aktivitas 16: Listrik Ruang Rektor (Maret)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (1, 'Listrik', DATE '2024-03-31', 'Pemakaian bulan Maret');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (16, 1, 950.8);

-- ===================================================
-- INSERT AKTIVITAS & DETAIL (APRIL 2024)
-- ===================================================

-- Aktivitas 17: Business Trip Dekan Ekonomi ke Bandung
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (5, 'BusinessTrip', DATE '2024-04-10', 'Workshop di Bandung');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (17, 'Bandung', DATE '2024-04-11');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (4, 6, 150.0); -- Pesawat Domestik

-- Aktivitas 18: Transportasi Harian (Bus) - Asisten Lab
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (31, 'TransportasiHarian', DATE '2024-04-15', 'Pergi kerja');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (18, 3, 14.0);

-- Aktivitas 19: Listrik Lab Umum (April)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (32, 'Listrik', DATE '2024-04-30', 'Pemakaian bulan April');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (19, 15, 1300.9);

-- Aktivitas 20: Kertas modul praktikum
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (14, 'Kertas', DATE '2024-04-18', 'Print modul praktikum');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (20, 12, 20.0); -- 20 rim = 10000 lembar

-- ===================================================
-- INSERT AKTIVITAS & DETAIL (MEI 2024)
-- ===================================================

-- Aktivitas 21: Business Trip Ketua Prodi TI ke Medan
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (8, 'BusinessTrip', DATE '2024-05-05', 'Pelatihan di Medan');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (21, 'Medan', DATE '2024-05-08');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (5, 6, 2400.0);
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (5, 2, 35.0); -- Pesawat + Mobil

-- Aktivitas 22: Transportasi Harian multi-moda (Motor + KRL) - Mahasiswa Kedokteran
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (27, 'TransportasiHarian', DATE '2024-05-10', 'Pergi kuliah');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (22, 1, 8.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (22, 4, 15.0);

-- Aktivitas 23: Listrik Sekretariat Rektorat (Mei)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (3, 'Listrik', DATE '2024-05-31', 'Pemakaian bulan Mei');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (23, 2, 880.5);

-- Aktivitas 24: Kertas formulir wisuda
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (11, 'Kertas', DATE '2024-05-25', 'Formulir wisuda');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (24, 13, 4.5); -- 4.5 rim = 2250 lembar (kertas daur ulang)

-- Aktivitas 25: Listrik Kelas Hukum (Mei)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (12, 'Listrik', DATE '2024-05-31', 'Pemakaian bulan Mei');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (25, 9, 720.4);

-- ===================================================
-- INSERT AKTIVITAS & DETAIL (JUNI 2024)
-- ===================================================

-- Aktivitas 26: Business Trip Dekan Hukum ke Bali
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (6, 'BusinessTrip', DATE '2024-06-03', 'Konferensi Hukum di Bali');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (26, 'Bali', DATE '2024-06-06');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (6, 6, 1200.0);
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (6, 2, 40.0); -- Pesawat + Mobil

-- Aktivitas 27: Transportasi Harian (Mobil Pribadi) - Dosen
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (9, 'TransportasiHarian', DATE '2024-06-12', 'Pergi mengajar');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (27, 2, 18.0);

-- Aktivitas 28: Listrik Lab Akuntansi (Juni)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (16, 'Listrik', DATE '2024-06-30', 'Pemakaian bulan Juni');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (28, 7, 850.2);

-- Aktivitas 29: Kertas rapat fakultas
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (7, 'Kertas', DATE '2024-06-20', 'Notulensi rapat dekan');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (29, 12, 2.5); -- 2.5 rim = 1250 lembar

-- Aktivitas 30: Transportasi Harian multi-moda (Ojek + Bus) - Teknisi Lab
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (35, 'TransportasiHarian', DATE '2024-06-25', 'Pulang kerja');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (30, 5, 3.5);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (30, 3, 9.0);

-- Aktivitas 31: Listrik Lab Komputasi (Juni)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (14, 'Listrik', DATE '2024-06-30', 'Pemakaian bulan Juni');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (31, 4, 1250.3);

-- Aktivitas 32: Business Trip Dekan Kedokteran ke Semarang
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (7, 'BusinessTrip', DATE '2024-06-28', 'Simposium di Semarang');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (32, 'Semarang', DATE '2024-06-29');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (7, 8, 450.0);
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (7, 2, 25.0); -- Kereta + Mobil

-- ===================================================
-- TAMBAHAN AKTIVITAS UNTUK VARIASI
-- ===================================================

-- Aktivitas 33: Transportasi Harian (KRL) - Mahasiswa Elektro
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (21, 'TransportasiHarian', DATE '2024-04-08', 'Pergi praktikum');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (33, 4, 22.0);

-- Aktivitas 34: Listrik Kelas Teknik (April)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (9, 'Listrik', DATE '2024-04-30', 'Pemakaian bulan April');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (34, 3, 780.6);

-- Aktivitas 35: Kertas skripsi mahasiswa
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (25, 'Kertas', DATE '2024-05-15', 'Print draft skripsi');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (35, 12, 15.0); -- 15 rim = 7500 lembar

-- Aktivitas 36: Transportasi Harian (Bus + Ojek) - Mahasiswa
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (23, 'TransportasiHarian', DATE '2024-03-18', 'Pergi kampus');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (36, 3, 6.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (36, 5, 4.0);

-- Aktivitas 37: Listrik Perpustakaan Hukum (Februari)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (12, 'Listrik', DATE '2024-02-28', 'Pemakaian bulan Februari');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (37, 10, 650.0);

-- Aktivitas 38: Kertas laporan keuangan
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (3, 'Kertas', DATE '2024-04-05', 'Laporan triwulan I');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (38, 12, 6.0); -- 6 rim = 3000 lembar

-- Aktivitas 39: Business Trip Ketua Prodi Hukum ke Solo
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (12, 'BusinessTrip', DATE '2024-05-22', 'Lokakarya di Solo');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (39, 'Solo', DATE '2024-05-23');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (8, 8, 300.0); -- Kereta Api

-- Aktivitas 40: Transportasi Harian (Motor) - Asisten Klinik
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (34, 'TransportasiHarian', DATE '2024-06-18', 'Pulang kerja');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (40, 1, 12.0);

-- Aktivitas 41: Business Trip Ketua Prodi Manajemen ke Palembang
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (10, 'BusinessTrip', DATE '2024-06-10', 'Seminar di Palembang');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (41, 'Palembang', DATE '2024-06-12');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (9, 6, 1100.0);
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (9, 2, 28.0); -- Pesawat + Mobil

-- Aktivitas 42: Transportasi Harian multi-moda (Bus + KRL + Ojek) - Mahasiswa TI
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (18, 'TransportasiHarian', DATE '2024-01-15', 'Pergi kampus');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (42, 3, 4.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (42, 4, 18.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (42, 5, 2.0);

-- Aktivitas 43: Listrik Klinik Pendidikan (April)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (17, 'Listrik', DATE '2024-04-30', 'Pemakaian bulan April');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (43, 12, 1150.0);

-- Aktivitas 44: Kertas administrasi akademik
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (11, 'Kertas', DATE '2024-02-10', 'Formulir KRS');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (44, 12, 7.0); -- 7 rim = 3500 lembar

-- Aktivitas 45: Business Trip Ketua Prodi Akuntansi ke Yogyakarta
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (11, 'BusinessTrip', DATE '2024-03-18', 'Pelatihan Akuntansi di Yogyakarta');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (45, 'Yogyakarta', DATE '2024-03-20');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (10, 8, 550.0);
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (10, 2, 30.0); -- Kereta + Mobil

-- Aktivitas 46: Transportasi Harian (Motor) - Mahasiswa Kedokteran
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (28, 'TransportasiHarian', DATE '2024-05-22', 'Pergi praktikum klinik');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (46, 1, 12.0);

-- Aktivitas 47: Listrik Lab Jaringan (Maret)
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (15, 'Listrik', DATE '2024-03-31', 'Pemakaian bulan Maret');
INSERT INTO Listrik (AktivitasID, RuanganID, JumlahKonsumsi) VALUES (47, 14, 1020.8);

-- Aktivitas 48: Kertas proposal penelitian
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (14, 'Kertas', DATE '2024-06-05', 'Print proposal penelitian');
INSERT INTO Kertas (AktivitasID, FacID, Jumlah) VALUES (48, 13, 3.5); -- 3.5 rim = 1750 lembar (daur ulang)

-- Aktivitas 49: Business Trip Kepala Lab Komputasi ke Bandung
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (14, 'BusinessTrip', DATE '2024-04-25', 'Workshop Teknologi di Bandung');
INSERT INTO BusinessTrip (AktivitasID, Tujuan, TanggalKepulangan) VALUES (49, 'Bandung', DATE '2024-04-26');
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (11, 6, 150.0);
INSERT INTO TransportasiBT (BTID, ModaID, JarakBT) VALUES (11, 2, 20.0); -- Pesawat + Mobil

-- Aktivitas 50: Transportasi Harian multi-moda (Bus + KRL) - Mahasiswa Hukum
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, TanggalAktivitas, CatatanAktivitas) VALUES (26, 'TransportasiHarian', DATE '2024-02-14', 'Pergi kuliah');
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (50, 3, 8.0);
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) VALUES (50, 4, 16.0);

-- ... (lanjutkan dengan aktivitas 51-80 sesuai kebutuhan)

COMMIT;
