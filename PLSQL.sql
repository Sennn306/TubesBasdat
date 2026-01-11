SELECT reset_all_data();



DO $$
DECLARE
    rec RECORD;
BEGIN
    TRUNCATE TABLE RekapEmisi; -- Pastikan bersih

    -- Loop data lama dan hitung ulang
    FOR rec IN 
        SELECT a.PenggunaID, (k.Jumlah * 500 * fe.NilaiFaktor) AS Emisi FROM Kertas k JOIN Aktivitas a ON k.AktivitasID=a.AktivitasID JOIN FaktorEmisi fe ON k.FacID=fe.FaktorID
        UNION ALL
        SELECT a.PenggunaID, (l.JumlahKonsumsi * fe.NilaiFaktor) FROM Listrik l JOIN Aktivitas a ON l.AktivitasID=a.AktivitasID JOIN Ruangan r ON l.RuanganID=r.RuanganID JOIN Gedung g ON r.GedungID=g.GedungID JOIN FaktorEmisi fe ON g.FaktorID=fe.FaktorID
        UNION ALL
        SELECT a.PenggunaID, (th.JarakHarian * fe.NilaiFaktor) FROM TransportasiHarian th JOIN Aktivitas a ON th.AktivitasID=a.AktivitasID JOIN ModaTransportasi m ON th.ModaID=m.ModaID JOIN FaktorEmisi fe ON m.fac_id=fe.FaktorID
        UNION ALL
        SELECT a.PenggunaID, (tbt.JarakBT * fe.NilaiFaktor) FROM TransportasiBT tbt JOIN BusinessTrip bt ON tbt.BTID=bt.BTID JOIN Aktivitas a ON bt.AktivitasID=a.AktivitasID JOIN ModaTransportasi m ON tbt.ModaID=m.ModaID JOIN FaktorEmisi fe ON m.fac_id=fe.FaktorID
    LOOP
        -- Masukkan ke RekapEmisi
        INSERT INTO RekapEmisi (PenggunaID, TotalEmisiKG, LastUpdate) 
        VALUES (rec.PenggunaID, rec.Emisi, CURRENT_TIMESTAMP)
        ON CONFLICT (PenggunaID) 
        DO UPDATE SET TotalEmisiKG = RekapEmisi.TotalEmisiKG + rec.Emisi;
    END LOOP;
END $$;


SELECT * FROM RekapEmisiPengguna ORDER BY TotalEmisiKG DESC;

SELECT * FROM RekapEmisiPengguna WHERE PenggunaID = 18;

-- Insert Header
INSERT INTO Aktivitas (PenggunaID, JenisAktivitas, CatatanAktivitas) 
VALUES (18, 'TransportasiHarian', 'Tes Trigger Fix');

-- Insert Detail (Trigger jalan di sini)
INSERT INTO TransportasiHarian (AktivitasID, ModaID, JarakHarian) 
VALUES ((SELECT MAX(AktivitasID) FROM Aktivitas), 1, 10.0);

-- Lihat Hasil (Harus nambah 2.1 KG)
SELECT * FROM RekapEmisiPengguna WHERE PenggunaID = 18;





-- ====================================================================
-- 1. HAPUS DATA TEST (Manual)
-- ====================================================================

-- Hapus Detailnya dulu (TransportasiHarian)
DELETE FROM TransportasiHarian 
WHERE AktivitasID IN (
    SELECT AktivitasID FROM Aktivitas 
    WHERE PenggunaID = 18 
    AND (CatatanAktivitas LIKE 'Test%' OR CatatanAktivitas LIKE 'Tes %')
);

-- Hapus Headernya (Aktivitas)
DELETE FROM Aktivitas 
WHERE PenggunaID = 18 
AND (CatatanAktivitas LIKE 'Test%' OR CatatanAktivitas LIKE 'Tes %');


-- ====================================================================
-- 2. HITUNG ULANG REKAP (Wajib dilakukan setelah Delete)
-- ====================================================================
-- Karena tidak ada trigger 'AFTER DELETE', kita harus refresh tabel rekap
-- agar angka emisi Rafi turun kembali ke asalnya.

DO $$
DECLARE
    rec RECORD;
BEGIN
    TRUNCATE TABLE RekapEmisi;

    FOR rec IN 
        SELECT a.PenggunaID, (k.Jumlah * 500 * fe.NilaiFaktor) AS Emisi FROM Kertas k JOIN Aktivitas a ON k.AktivitasID=a.AktivitasID JOIN FaktorEmisi fe ON k.FacID=fe.FaktorID
        UNION ALL
        SELECT a.PenggunaID, (l.JumlahKonsumsi * fe.NilaiFaktor) FROM Listrik l JOIN Aktivitas a ON l.AktivitasID=a.AktivitasID JOIN Ruangan r ON l.RuanganID=r.RuanganID JOIN Gedung g ON r.GedungID=g.GedungID JOIN FaktorEmisi fe ON g.FaktorID=fe.FaktorID
        UNION ALL
        SELECT a.PenggunaID, (th.JarakHarian * fe.NilaiFaktor) FROM TransportasiHarian th JOIN Aktivitas a ON th.AktivitasID=a.AktivitasID JOIN ModaTransportasi m ON th.ModaID=m.ModaID JOIN FaktorEmisi fe ON m.fac_id=fe.FaktorID
        UNION ALL
        SELECT a.PenggunaID, (tbt.JarakBT * fe.NilaiFaktor) FROM TransportasiBT tbt JOIN BusinessTrip bt ON tbt.BTID=bt.BTID JOIN Aktivitas a ON bt.AktivitasID=a.AktivitasID JOIN ModaTransportasi m ON tbt.ModaID=m.ModaID JOIN FaktorEmisi fe ON m.fac_id=fe.FaktorID
    LOOP
        INSERT INTO RekapEmisi (PenggunaID, TotalEmisiKG, LastUpdate) 
        VALUES (rec.PenggunaID, rec.Emisi, CURRENT_TIMESTAMP)
        ON CONFLICT (PenggunaID) DO UPDATE SET TotalEmisiKG = RekapEmisi.TotalEmisiKG + rec.Emisi;
    END LOOP;
END $$;


SELECT * FROM RekapEmisiPengguna WHERE PenggunaID = 18;
