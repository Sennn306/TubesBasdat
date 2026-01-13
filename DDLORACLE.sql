-- ===================================================
-- 1. TABEL REFERENSI / MASTER (Dibuat Paling Awal)
-- ===================================================

-- Tabel Faktor Emisi
CREATE TABLE FaktorEmisi (
    FaktorID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NamaFaktor VARCHAR2(100), 
    NilaiFaktor NUMBER(10, 4), 
    Satuan VARCHAR2(20) 
);

-- Tabel Unit
CREATE TABLE Unit (
    UnitID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NamaUnit VARCHAR2(100) NOT NULL UNIQUE, 
    JenisUnit VARCHAR2(50),
    UnitParentID NUMBER,
    CONSTRAINT FK_Unit_Parent FOREIGN KEY (UnitParentID) REFERENCES Unit(UnitID)
);

-- Tabel Gedung
CREATE TABLE Gedung (
    GedungID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NamaGedung VARCHAR2(100) NOT NULL UNIQUE,
    FaktorID NUMBER,
    CONSTRAINT FK_Gedung_Faktor FOREIGN KEY (FaktorID) REFERENCES FaktorEmisi(FaktorID)
);

-- Tabel Ruangan
CREATE TABLE Ruangan (
    RuanganID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    GedungID NUMBER,
    KodeRuangan VARCHAR2(20) UNIQUE, 
    NamaRuangan VARCHAR2(100),
    CONSTRAINT FK_Ruangan_Gedung FOREIGN KEY (GedungID) REFERENCES Gedung(GedungID)
);

-- Tabel Moda Transportasi
CREATE TABLE ModaTransportasi (
    ModaID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NamaTransportasi VARCHAR2(50) NOT NULL,
    fac_id NUMBER NOT NULL,
    CONSTRAINT FK_Moda_Faktor FOREIGN KEY (fac_id) REFERENCES FaktorEmisi(FaktorID)
);

-- ===================================================
-- 2. TABEL PENGGUNA
-- ===================================================
CREATE TABLE Pengguna (
    PenggunaID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    UnitID NUMBER, 
    AtasanID NUMBER,
    Nama VARCHAR2(100) NOT NULL,
    Posisi VARCHAR2(50), 
    Email VARCHAR2(100) UNIQUE, 
    Telepon VARCHAR2(20) UNIQUE, 
    CONSTRAINT FK_Pengguna_Unit FOREIGN KEY (UnitID) REFERENCES Unit(UnitID),
    CONSTRAINT FK_Atasan_Pengguna FOREIGN KEY (AtasanID) REFERENCES Pengguna(PenggunaID)
);

-- ===================================================
-- 3. TABEL TRANSAKSI (ACTIVITIES)
-- ===================================================

-- Tabel Induk Aktivitas
CREATE TABLE Aktivitas (
    AktivitasID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    PenggunaID NUMBER, 
    JenisAktivitas VARCHAR2(50), 
    TanggalAktivitas DATE DEFAULT SYSDATE,
    CatatanAktivitas VARCHAR2(4000), -- Menggantikan TEXT
    CONSTRAINT FK_Aktivitas_Pengguna FOREIGN KEY (PenggunaID) REFERENCES Pengguna(PenggunaID)
);

-- Detail Aktivitas: Kertas
CREATE TABLE Kertas (
    AktivitasID NUMBER, 
    FacID NUMBER,
    Jumlah NUMBER(10, 2), 
    CONSTRAINT PK_Kertas PRIMARY KEY(AktivitasID, FacID),
    CONSTRAINT FK_Kertas_Aktivitas FOREIGN KEY (AktivitasID) REFERENCES Aktivitas(AktivitasID),
    CONSTRAINT FK_Kertas_Faktor FOREIGN KEY (FacID) REFERENCES FaktorEmisi(FaktorID)
);

-- Detail Aktivitas: Listrik
CREATE TABLE Listrik (
    AktivitasID NUMBER,
    RuanganID NUMBER, 
    JumlahKonsumsi NUMBER(10, 2), 
    CONSTRAINT PK_Listrik PRIMARY KEY (AktivitasID, RuanganID),
    CONSTRAINT FK_Listrik_Aktivitas FOREIGN KEY (AktivitasID) REFERENCES Aktivitas(AktivitasID),
    CONSTRAINT FK_Listrik_Ruangan FOREIGN KEY (RuanganID) REFERENCES Ruangan(RuanganID)
);

-- Detail Aktivitas: Transportasi Harian
CREATE TABLE TransportasiHarian (
    AktivitasID NUMBER,
    ModaID NUMBER, 
    JarakHarian NUMBER(10, 2), 
    CONSTRAINT PK_TH PRIMARY KEY(AktivitasID, ModaID),
    CONSTRAINT FK_TransHarian_Aktivitas FOREIGN KEY (AktivitasID) REFERENCES Aktivitas(AktivitasID),
    CONSTRAINT FK_TransHarian_Moda FOREIGN KEY (ModaID) REFERENCES ModaTransportasi(ModaID)
);

-- Header Business Trip (Extension dari Aktivitas)
CREATE TABLE BusinessTrip (
    BTID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    AktivitasID NUMBER UNIQUE, 
    Tujuan VARCHAR2(100),
    TanggalKepulangan DATE,
    CONSTRAINT FK_BT_Aktivitas FOREIGN KEY (AktivitasID) REFERENCES Aktivitas(AktivitasID)
);

-- Detail Transportasi Business Trip
CREATE TABLE TransportasiBT (
    BTID NUMBER, 
    ModaID NUMBER, 
    JarakBT NUMBER(10, 2),
    CONSTRAINT PK_TBT PRIMARY KEY(BTID, ModaID),
    CONSTRAINT FK_TransBT_BT FOREIGN KEY (BTID) REFERENCES BusinessTrip(BTID),
    CONSTRAINT FK_TransBT_Moda FOREIGN KEY (ModaID) REFERENCES ModaTransportasi(ModaID)
);

