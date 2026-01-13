-- Emisi per Pengguna
SELECT 
    p.PenggunaID,
    p.Nama,
    p.Posisi,
    u.NamaUnit AS Unit,
    -- Menjumlahkan semua emisi dari berbagai sumber
    COALESCE(SUM(
        -- Hitung Transportasi Harian (Hanya jika Jenis = TransportasiHarian)
        COALESCE(th.JarakHarian * fe_th.NilaiFaktor, 0) +
        -- Hitung Listrik (Hanya jika Jenis = Listrik)
        COALESCE(l.JumlahKonsumsi * fe_l.NilaiFaktor, 0) +
        -- Hitung Kertas (Hanya jika Jenis = Kertas)
        COALESCE(k.Jumlah * 500 * fe_k.NilaiFaktor, 0) +
        -- Hitung Business Trip (Hanya jika Jenis = BusinessTrip)
        COALESCE(tbt.JarakBT * fe_bt.NilaiFaktor, 0)
    ), 0) AS TotalEmisi_KgCO2
FROM Pengguna p
LEFT JOIN Unit u ON p.UnitID = u.UnitID
-- JOIN Aktivitas TANPA filter tanggal (Mengambil semua data sejarah)
LEFT JOIN Aktivitas a ON p.PenggunaID = a.PenggunaID 
-- 1. JOIN Transportasi Harian (STRICT JOIN)
LEFT JOIN TransportasiHarian th ON a.AktivitasID = th.AktivitasID 
    AND a.JenisAktivitas = 'TransportasiHarian'
LEFT JOIN ModaTransportasi mt_th ON th.ModaID = mt_th.ModaID
LEFT JOIN FaktorEmisi fe_th ON mt_th.fac_id = fe_th.FaktorID
-- 2. JOIN Listrik (STRICT JOIN)
LEFT JOIN Listrik l ON a.AktivitasID = l.AktivitasID 
    AND a.JenisAktivitas = 'Listrik'
LEFT JOIN Ruangan r ON l.RuanganID = r.RuanganID
LEFT JOIN Gedung g ON r.GedungID = g.GedungID
LEFT JOIN FaktorEmisi fe_l ON g.FaktorID = fe_l.FaktorID
-- 3. JOIN Kertas (STRICT JOIN)
LEFT JOIN Kertas k ON a.AktivitasID = k.AktivitasID 
    AND a.JenisAktivitas = 'Kertas'
LEFT JOIN FaktorEmisi fe_k ON k.FacID = fe_k.FaktorID
-- 4. JOIN Business Trip (STRICT JOIN)
LEFT JOIN BusinessTrip bt ON a.AktivitasID = bt.AktivitasID 
    AND a.JenisAktivitas = 'BusinessTrip'
LEFT JOIN TransportasiBT tbt ON bt.BTID = tbt.BTID
LEFT JOIN ModaTransportasi mt_bt ON tbt.ModaID = mt_bt.ModaID
LEFT JOIN FaktorEmisi fe_bt ON mt_bt.fac_id = fe_bt.FaktorID

GROUP BY p.PenggunaID, p.Nama, p.Posisi, u.NamaUnit
ORDER BY TotalEmisi_KgCO2 DESC;


--Total Emisi Per Fakultas

SELECT 
    -- LOGIKA PENCARIAN NAMA FAKULTAS (Cek Level 1, 2, atau 3)
    COALESCE(
        CASE WHEN u1.JenisUnit = 'Akademik' THEN u1.NamaUnit END, -- Jika User langsung di Fakultas
        CASE WHEN u2.JenisUnit = 'Akademik' THEN u2.NamaUnit END, -- Jika User di Prodi (Anak)
        CASE WHEN u3.JenisUnit = 'Akademik' THEN u3.NamaUnit END  -- Jika User di Lab (Cucu)
    ) AS NamaFakultas,
    -- Jumlah User Unik
    COUNT(DISTINCT p.PenggunaID) AS JumlahPengguna,
    -- Total Emisi
    (
        COALESCE(SUM(th.JarakHarian * fe_th.NilaiFaktor), 0) + 
        COALESCE(SUM(l.JumlahKonsumsi * fe_l.NilaiFaktor), 0) + 
        COALESCE(SUM(k.Jumlah * 500 * fe_k.NilaiFaktor), 0) + 
        COALESCE(SUM(tbt.JarakBT * fe_bt.NilaiFaktor), 0)
    ) AS TotalEmisiKG,
    -- Rata-rata
    (
        COALESCE(SUM(th.JarakHarian * fe_th.NilaiFaktor), 0) + 
        COALESCE(SUM(l.JumlahKonsumsi * fe_l.NilaiFaktor), 0) + 
        COALESCE(SUM(k.Jumlah * 500 * fe_k.NilaiFaktor), 0) + 
        COALESCE(SUM(tbt.JarakBT * fe_bt.NilaiFaktor), 0)
    ) / NULLIF(COUNT(DISTINCT p.PenggunaID), 0) AS RataRataEmisi

FROM Pengguna p
-- 1. Cek Unit User saat ini
JOIN Unit u1 ON p.UnitID = u1.UnitID
-- 2. Cek Siapa Ayahnya (Parent)
LEFT JOIN Unit u2 ON u1.UnitParentID = u2.UnitID
-- 3. Cek Siapa Kakeknya (Grandparent)
LEFT JOIN Unit u3 ON u2.UnitParentID = u3.UnitID
-- Join Aktivitas & Detail (Standar)
LEFT JOIN Aktivitas a ON p.PenggunaID = a.PenggunaID 
LEFT JOIN TransportasiHarian th ON a.AktivitasID = th.AktivitasID AND a.JenisAktivitas = 'TransportasiHarian'
LEFT JOIN ModaTransportasi mt_th ON th.ModaID = mt_th.ModaID
LEFT JOIN FaktorEmisi fe_th ON mt_th.fac_id = fe_th.FaktorID
LEFT JOIN Listrik l ON a.AktivitasID = l.AktivitasID AND a.JenisAktivitas = 'Listrik'
LEFT JOIN Ruangan r ON l.RuanganID = r.RuanganID
LEFT JOIN Gedung g ON r.GedungID = g.GedungID
LEFT JOIN FaktorEmisi fe_l ON g.FaktorID = fe_l.FaktorID
LEFT JOIN Kertas k ON a.AktivitasID = k.AktivitasID AND a.JenisAktivitas = 'Kertas'
LEFT JOIN FaktorEmisi fe_k ON k.FacID = fe_k.FaktorID
LEFT JOIN BusinessTrip bt ON a.AktivitasID = bt.AktivitasID AND a.JenisAktivitas = 'BusinessTrip'
LEFT JOIN TransportasiBT tbt ON bt.BTID = tbt.BTID
LEFT JOIN ModaTransportasi mt_bt ON tbt.ModaID = mt_bt.ModaID
LEFT JOIN FaktorEmisi fe_bt ON mt_bt.fac_id = fe_bt.FaktorID

WHERE 
    -- Filter: Pastikan salah satu level induknya adalah 'Akademik' (Fakultas)
    u1.JenisUnit = 'Akademik' OR u2.JenisUnit = 'Akademik' OR u3.JenisUnit = 'Akademik'
GROUP BY 1
ORDER BY TotalEmisiKG DESC;


--Top 5 Business Trip (Individu)
SELECT 
    bt.BTID,
    p.Nama AS Pejabat,
    bt.Tujuan,
    bt.TanggalKepulangan,
    SUM(tbt.JarakBT * fe.NilaiFaktor) AS TotalEmisi_KgCO2
FROM BusinessTrip bt
JOIN Aktivitas a ON bt.AktivitasID = a.AktivitasID
JOIN Pengguna p ON a.PenggunaID = p.PenggunaID
JOIN TransportasiBT tbt ON bt.BTID = tbt.BTID
JOIN ModaTransportasi mt ON tbt.ModaID = mt.ModaID
JOIN FaktorEmisi fe ON mt.fac_id = fe.FaktorID
GROUP BY bt.BTID, p.Nama, bt.Tujuan, bt.TanggalKepulangan
ORDER BY TotalEmisi_KgCO2 DESC
LIMIT 5;


--Perbandingan Transportasi & Listrik
SELECT 
    TO_CHAR(a.TanggalAktivitas, 'YYYY-MM') AS Bulan,
    -- Jika Transportasi, hitung nilainya. Jika bukan, anggap 0.
    SUM(CASE 
        WHEN a.JenisAktivitas = 'TransportasiHarian' THEN (th.JarakHarian * fe_th.NilaiFaktor)
        WHEN a.JenisAktivitas = 'BusinessTrip' THEN (tbt.JarakBT * fe_bt.NilaiFaktor)
        ELSE 0 
    END) AS EmisiTransportasi_KgCO2,
    -- Jika Listrik, hitung nilainya. Jika bukan, anggap 0.
    SUM(CASE 
        WHEN a.JenisAktivitas = 'Listrik' THEN (l.JumlahKonsumsi * fe_l.NilaiFaktor)
        ELSE 0 
    END) AS EmisiListrik_KgCO2

FROM Aktivitas a
-- Join semua tabel (Standard Join)
LEFT JOIN TransportasiHarian th ON a.AktivitasID = th.AktivitasID
LEFT JOIN ModaTransportasi mt_th ON th.ModaID = mt_th.ModaID
LEFT JOIN FaktorEmisi fe_th ON mt_th.fac_id = fe_th.FaktorID

LEFT JOIN BusinessTrip bt ON a.AktivitasID = bt.AktivitasID
LEFT JOIN TransportasiBT tbt ON bt.BTID = tbt.BTID
LEFT JOIN ModaTransportasi mt_bt ON tbt.ModaID = mt_bt.ModaID
LEFT JOIN FaktorEmisi fe_bt ON mt_bt.fac_id = fe_bt.FaktorID

LEFT JOIN Listrik l ON a.AktivitasID = l.AktivitasID
LEFT JOIN Ruangan r ON l.RuanganID = r.RuanganID
LEFT JOIN Gedung g ON r.GedungID = g.GedungID
LEFT JOIN FaktorEmisi fe_l ON g.FaktorID = fe_l.FaktorID

GROUP BY TO_CHAR(a.TanggalAktivitas, 'YYYY-MM')
ORDER BY Bulan;




--Top 10 Penyumbang Emisi
SELECT 
    p.Nama,
    u.NamaUnit AS Unit,
    -- Hitung Total Emisi per Orang
    (
        COALESCE(SUM(th.JarakHarian * fe_th.NilaiFaktor), 0) + 
        COALESCE(SUM(l.JumlahKonsumsi * fe_l.NilaiFaktor), 0) + 
        COALESCE(SUM(k.Jumlah * 500 * fe_k.NilaiFaktor), 0) + 
        COALESCE(SUM(tbt.JarakBT * fe_bt.NilaiFaktor), 0)
    ) AS TotalEmisi_KgCO2,
    -- Hitung Persentase (Total Orang Ini / Total Semua Orang * 100)
    ROUND(
        (
            COALESCE(SUM(th.JarakHarian * fe_th.NilaiFaktor), 0) + 
            COALESCE(SUM(l.JumlahKonsumsi * fe_l.NilaiFaktor), 0) + 
            COALESCE(SUM(k.Jumlah * 500 * fe_k.NilaiFaktor), 0) + 
            COALESCE(SUM(tbt.JarakBT * fe_bt.NilaiFaktor), 0)
        ) / 
        (SELECT SUM(TotalEmisiKG) FROM RekapEmisi) * 100
    , 2) AS PersentaseKontribusi

FROM Pengguna p
LEFT JOIN Unit u ON p.UnitID = u.UnitID
LEFT JOIN Aktivitas a ON p.PenggunaID = a.PenggunaID
-- (JOIN DETAIL TABEL LENGKAP SEPERTI QUERY 1 DI ATAS - DI SINI DISINGKAT AGAR TIDAK KEPANJANGAN)
LEFT JOIN TransportasiHarian th ON a.AktivitasID = th.AktivitasID AND a.JenisAktivitas = 'TransportasiHarian'
LEFT JOIN ModaTransportasi mt_th ON th.ModaID = mt_th.ModaID
LEFT JOIN FaktorEmisi fe_th ON mt_th.fac_id = fe_th.FaktorID
LEFT JOIN Listrik l ON a.AktivitasID = l.AktivitasID AND a.JenisAktivitas = 'Listrik'
LEFT JOIN Ruangan r ON l.RuanganID = r.RuanganID
LEFT JOIN Gedung g ON r.GedungID = g.GedungID
LEFT JOIN FaktorEmisi fe_l ON g.FaktorID = fe_l.FaktorID
LEFT JOIN Kertas k ON a.AktivitasID = k.AktivitasID AND a.JenisAktivitas = 'Kertas'
LEFT JOIN FaktorEmisi fe_k ON k.FacID = fe_k.FaktorID
LEFT JOIN BusinessTrip bt ON a.AktivitasID = bt.AktivitasID AND a.JenisAktivitas = 'BusinessTrip'
LEFT JOIN TransportasiBT tbt ON bt.BTID = tbt.BTID
LEFT JOIN ModaTransportasi mt_bt ON tbt.ModaID = mt_bt.ModaID
LEFT JOIN FaktorEmisi fe_bt ON mt_bt.fac_id = fe_bt.FaktorID

GROUP BY p.PenggunaID, p.Nama, u.NamaUnit
ORDER BY TotalEmisi_KgCO2 DESC
LIMIT 10;



--Tren Emisi
SELECT 
    A.Bulan,
    A.TotalEmisi AS EmisiBulanIni,
    B.TotalEmisi AS EmisiBulanLalu,
    -- Hitung Selisih
    (A.TotalEmisi - COALESCE(B.TotalEmisi, 0)) AS Selisih,
    -- Hitung Persentase (Hindari pembagian dengan 0)
    ROUND(
        (A.TotalEmisi - COALESCE(B.TotalEmisi, 0)) * 100.0 / NULLIF(B.TotalEmisi, 0)
    , 2) AS PersentasePerubahan
FROM 
    -- TABEL A: Data Bulan Ini
    (
        SELECT 
            TO_CHAR(a.TanggalAktivitas, 'YYYY-MM') AS Bulan,
            EXTRACT(MONTH FROM a.TanggalAktivitas) AS AngkaBulan,
            -- (Rumus Total Emisi seperti Query 1)
            COALESCE(SUM(th.JarakHarian * fe_th.NilaiFaktor), 0) + 
            COALESCE(SUM(l.JumlahKonsumsi * fe_l.NilaiFaktor), 0) + 
            COALESCE(SUM(k.Jumlah * 500 * fe_k.NilaiFaktor), 0) + 
            COALESCE(SUM(tbt.JarakBT * fe_bt.NilaiFaktor), 0) AS TotalEmisi
        FROM Aktivitas a
        -- (LEFT JOIN SEMUA TABEL DETAIL DISINI SEPERTI QUERY 1)
        LEFT JOIN TransportasiHarian th ON a.AktivitasID = th.AktivitasID AND a.JenisAktivitas = 'TransportasiHarian'
        LEFT JOIN ModaTransportasi mt_th ON th.ModaID = mt_th.ModaID
        LEFT JOIN FaktorEmisi fe_th ON mt_th.fac_id = fe_th.FaktorID
        LEFT JOIN Listrik l ON a.AktivitasID = l.AktivitasID AND a.JenisAktivitas = 'Listrik'
        LEFT JOIN Ruangan r ON l.RuanganID = r.RuanganID
        LEFT JOIN Gedung g ON r.GedungID = g.GedungID
        LEFT JOIN FaktorEmisi fe_l ON g.FaktorID = fe_l.FaktorID
        LEFT JOIN Kertas k ON a.AktivitasID = k.AktivitasID AND a.JenisAktivitas = 'Kertas'
        LEFT JOIN FaktorEmisi fe_k ON k.FacID = fe_k.FaktorID
        LEFT JOIN BusinessTrip bt ON a.AktivitasID = bt.AktivitasID AND a.JenisAktivitas = 'BusinessTrip'
        LEFT JOIN TransportasiBT tbt ON bt.BTID = tbt.BTID
        LEFT JOIN ModaTransportasi mt_bt ON tbt.ModaID = mt_bt.ModaID
        LEFT JOIN FaktorEmisi fe_bt ON mt_bt.fac_id = fe_bt.FaktorID
        
        WHERE a.TanggalAktivitas BETWEEN '2024-01-01' AND '2024-06-30'
        GROUP BY TO_CHAR(a.TanggalAktivitas, 'YYYY-MM'), EXTRACT(MONTH FROM a.TanggalAktivitas)
    ) A
LEFT JOIN 
    -- TABEL B: Data Bulan Lalu (Query yang sama persis)
    (
        SELECT 
            EXTRACT(MONTH FROM a.TanggalAktivitas) AS AngkaBulan,
            COALESCE(SUM(th.JarakHarian * fe_th.NilaiFaktor), 0) + 
            COALESCE(SUM(l.JumlahKonsumsi * fe_l.NilaiFaktor), 0) + 
            COALESCE(SUM(k.Jumlah * 500 * fe_k.NilaiFaktor), 0) + 
            COALESCE(SUM(tbt.JarakBT * fe_bt.NilaiFaktor), 0) AS TotalEmisi
        FROM Aktivitas a
        -- (LEFT JOIN SEMUA TABEL DETAIL LAGI DISINI)
        LEFT JOIN TransportasiHarian th ON a.AktivitasID = th.AktivitasID AND a.JenisAktivitas = 'TransportasiHarian'
        LEFT JOIN ModaTransportasi mt_th ON th.ModaID = mt_th.ModaID
        LEFT JOIN FaktorEmisi fe_th ON mt_th.fac_id = fe_th.FaktorID
        LEFT JOIN Listrik l ON a.AktivitasID = l.AktivitasID AND a.JenisAktivitas = 'Listrik'
        LEFT JOIN Ruangan r ON l.RuanganID = r.RuanganID
        LEFT JOIN Gedung g ON r.GedungID = g.GedungID
        LEFT JOIN FaktorEmisi fe_l ON g.FaktorID = fe_l.FaktorID
        LEFT JOIN Kertas k ON a.AktivitasID = k.AktivitasID AND a.JenisAktivitas = 'Kertas'
        LEFT JOIN FaktorEmisi fe_k ON k.FacID = fe_k.FaktorID
        LEFT JOIN BusinessTrip bt ON a.AktivitasID = bt.AktivitasID AND a.JenisAktivitas = 'BusinessTrip'
        LEFT JOIN TransportasiBT tbt ON bt.BTID = tbt.BTID
        LEFT JOIN ModaTransportasi mt_bt ON tbt.ModaID = mt_bt.ModaID
        LEFT JOIN FaktorEmisi fe_bt ON mt_bt.fac_id = fe_bt.FaktorID
        
        WHERE a.TanggalAktivitas BETWEEN '2024-01-01' AND '2024-06-30'
        GROUP BY EXTRACT(MONTH FROM a.TanggalAktivitas)
    ) B ON A.AngkaBulan = B.AngkaBulan + 1 
ORDER BY A.Bulan;
