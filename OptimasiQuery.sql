
--Sebelum Dioptimisasi
EXPLAIN ANALYZE
SELECT 
    p.PenggunaID,
    p.Nama,
    p.Posisi,
    u.NamaUnit AS Unit,
    COALESCE(SUM(
        COALESCE(th.JarakHarian * fe_th.NilaiFaktor, 0) +
        COALESCE(l.JumlahKonsumsi * fe_l.NilaiFaktor, 0) +
        COALESCE(k.Jumlah * 500 * fe_k.NilaiFaktor, 0) +
        COALESCE(tbt.JarakBT * fe_bt.NilaiFaktor, 0)
    ), 0) AS TotalEmisi_KgCO2
FROM Pengguna p
LEFT JOIN Unit u ON p.UnitID = u.UnitID
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
GROUP BY p.PenggunaID, p.Nama, p.Posisi, u.NamaUnit
ORDER BY TotalEmisi_KgCO2 DESC;


--Optimisasi
-- 1. INDEXING (Mempercepat JOIN dan Filter)
-- B-Tree Index pada Foreign Keys (Sesuai PPT Hal 47-51)
CREATE INDEX idx_aktivitas_user ON Aktivitas(PenggunaID);
CREATE INDEX idx_jenis_aktivitas ON Aktivitas(JenisAktivitas);

-- Index pada tabel detail untuk mempercepat akses Strict Join
CREATE INDEX idx_trans_aktivitas ON TransportasiHarian(AktivitasID);
CREATE INDEX idx_listrik_aktivitas ON Listrik(AktivitasID);
CREATE INDEX idx_kertas_aktivitas ON Kertas(AktivitasID);
CREATE INDEX idx_bt_aktivitas ON BusinessTrip(AktivitasID);

-- 2. MATERIALIZED VIEW (Menyimpan Hasil Perhitungan - PPT Hal 90)
-- Ini menggantikan proses query berat menjadi tabel fisik yang siap baca
DROP MATERIALIZED VIEW IF EXISTS mv_emisi_pengguna;

CREATE MATERIALIZED VIEW mv_emisi_pengguna AS
SELECT 
    p.PenggunaID,
    p.Nama,
    p.Posisi,
    u.NamaUnit AS Unit,
    COALESCE(SUM(
        COALESCE(th.JarakHarian * fe_th.NilaiFaktor, 0) +
        COALESCE(l.JumlahKonsumsi * fe_l.NilaiFaktor, 0) +
        COALESCE(k.Jumlah * 500 * fe_k.NilaiFaktor, 0) +
        COALESCE(tbt.JarakBT * fe_bt.NilaiFaktor, 0)
    ), 0) AS TotalEmisi_KgCO2
FROM Pengguna p
LEFT JOIN Unit u ON p.UnitID = u.UnitID
LEFT JOIN Aktivitas a ON p.PenggunaID = a.PenggunaID 
-- Strict Join Logic
LEFT JOIN TransportasiHarian th ON a.AktivitasID = th.AktivitasID 
    AND a.JenisAktivitas = 'TransportasiHarian'
LEFT JOIN ModaTransportasi mt_th ON th.ModaID = mt_th.ModaID
LEFT JOIN FaktorEmisi fe_th ON mt_th.fac_id = fe_th.FaktorID
LEFT JOIN Listrik l ON a.AktivitasID = l.AktivitasID 
    AND a.JenisAktivitas = 'Listrik'
LEFT JOIN Ruangan r ON l.RuanganID = r.RuanganID
LEFT JOIN Gedung g ON r.GedungID = g.GedungID
LEFT JOIN FaktorEmisi fe_l ON g.FaktorID = fe_l.FaktorID
LEFT JOIN Kertas k ON a.AktivitasID = k.AktivitasID 
    AND a.JenisAktivitas = 'Kertas'
LEFT JOIN FaktorEmisi fe_k ON k.FacID = fe_k.FaktorID
LEFT JOIN BusinessTrip bt ON a.AktivitasID = bt.AktivitasID 
    AND a.JenisAktivitas = 'BusinessTrip'
LEFT JOIN TransportasiBT tbt ON bt.BTID = tbt.BTID
LEFT JOIN ModaTransportasi mt_bt ON tbt.ModaID = mt_bt.ModaID
LEFT JOIN FaktorEmisi fe_bt ON mt_bt.fac_id = fe_bt.FaktorID
GROUP BY p.PenggunaID, p.Nama, p.Posisi, u.NamaUnit
WITH DATA;

-- Buat Index pada View itu sendiri untuk akses instan
CREATE UNIQUE INDEX idx_mv_hasil ON mv_emisi_pengguna(PenggunaID);
--Test Optimisasi
EXPLAIN ANALYZE
SELECT * FROM mv_emisi_pengguna
ORDER BY TotalEmisi_KgCO2 DESC;
