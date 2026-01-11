--Tabel FaktorEmisi
CREATE TABLE FaktorEmisi (
    FaktorID SERIAL PRIMARY KEY,
    NamaFaktor VARCHAR(100),
    NilaiFaktor DECIMAL(10, 4),
    Satuan VARCHAR(20)
);

--Tabel Unit
CREATE TABLE Unit (F
    UnitID SERIAL PRIMARY KEY,
    NamaUnit VARCHAR(100) UNIQUE NOT NULL,
    JenisUnit VARCHAR(50),
    UnitParentID INT,
    CONSTRAINT FK_UnitID FOREIGN KEY (UnitParentID) REFERENCES Unit(UnitID)
);

--Tabel Gedung
CREATE TABLE Gedung (
    GedungID SERIAL PRIMARY KEY,
    NamaGedung VARCHAR(100) UNIQUE NOT NULL,
    FaktorID INT,
    CONSTRAINT FK_FaktorEmisi FOREIGN KEY (FaktorID) REFERENCES FaktorEmisi(FaktorID)
);

--Tabel Ruangan
CREATE TABLE Ruangan (
    RuanganID SERIAL PRIMARY KEY,
    GedungID INT,
    KodeRuangan VARCHAR(20) UNIQUE,
    NamaRuangan VARCHAR(100),
    CONSTRAINT FK_Ruangan_Gedung FOREIGN KEY (GedungID) REFERENCES Gedung(GedungID)
);

--Tabel  ModaTransportasi
CREATE TABLE ModaTransportasi (
    ModaID SERIAL PRIMARY KEY,
    NamaTransportasi VARCHAR(50) NOT NULL,
    fac_id INT NOT NULL,
    CONSTRAINT FK_faktor_emisi FOREIGN KEY (fac_id) REFERENCES FaktorEmisi(FaktorID)
);

--Tabel Pengguna
CREATE TABLE Pengguna (
    PenggunaID SERIAL PRIMARY KEY,
    UnitID INT,
    AtasanID INT,
    Nama VARCHAR(100) NOT NULL,
    Posisi VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Telepon VARCHAR(20) UNIQUE,
    CONSTRAINT FK_Pengguna_Unit FOREIGN KEY (UnitID) REFERENCES Unit(UnitID),
    CONSTRAINT FK_AtasanID FOREIGN KEY (AtasanID) REFERENCES Pengguna(PenggunaID)
);

--Tabel Aktivitas
CREATE TABLE Aktivitas (
    AktivitasID SERIAL PRIMARY KEY,
    PenggunaID INT,
    JenisAktivitas VARCHAR(50),
    TanggalAktivitas DATE DEFAULT CURRENT_DATE,
    CatatanAktivitas TEXT,
    CONSTRAINT FK_Aktivitas_Pengguna FOREIGN KEY (PenggunaID) REFERENCES Pengguna(PenggunaID)
);

--Tabel  Kertas
CREATE TABLE Kertas (
    AktivitasID INT,
    FacID INT,
    Jumlah DECIMAL(10, 2),
    CONSTRAINT PK_Kertas PRIMARY KEY (AktivitasID, FacID),
    CONSTRAINT FK_Kertas_Aktivitas FOREIGN KEY (AktivitasID) REFERENCES Aktivitas(AktivitasID),
    CONSTRAINT FK_Kertas_FaktorEmisi FOREIGN KEY (FacID) REFERENCES FaktorEmisi(FaktorID)
);

--Tabel Listrik
CREATE TABLE Listrik (
    AktivitasID INT,
    RuanganID INT,
    JumlahKonsumsi DECIMAL(10, 2),
    CONSTRAINT PK_Listrik PRIMARY KEY (AktivitasID, RuanganID),
    CONSTRAINT FK_Listrik_Aktivitas FOREIGN KEY (AktivitasID) REFERENCES Aktivitas(AktivitasID),
    CONSTRAINT FK_Listrik_Ruangan FOREIGN KEY (RuanganID) REFERENCES Ruangan(RuanganID)
);

--Tabel TransportasiHarian
CREATE TABLE TransportasiHarian (
    AktivitasID INT,
    ModaID INT,
    JarakHarian DECIMAL(10, 2),
    CONSTRAINT PK_TH PRIMARY KEY (AktivitasID, ModaID),
    CONSTRAINT FK_TransHarian_Aktivitas FOREIGN KEY (AktivitasID) REFERENCES Aktivitas(AktivitasID),
    CONSTRAINT FK_TransHarian_Moda FOREIGN KEY (ModaID) REFERENCES ModaTransportasi(ModaID)
);

--Tabel BusinessTrip
CREATE TABLE BusinessTrip (
    BTID SERIAL PRIMARY KEY,
    AktivitasID INT UNIQUE,
    Tujuan VARCHAR(100),
    TanggalKepulangan DATE,
    CONSTRAINT FK_BT_Aktivitas FOREIGN KEY (AktivitasID) REFERENCES Aktivitas(AktivitasID)
);

--Tabel  TransportasiBT
CREATE TABLE TransportasiBT (
    BTID INT,
    ModaID INT,
    JarakBT DECIMAL(10, 2),
    CONSTRAINT PK_TBT PRIMARY KEY (BTID, ModaID),
    CONSTRAINT FK_TransBT_BT FOREIGN KEY (BTID) REFERENCES BusinessTrip(BTID),
    CONSTRAINT FK_TransBT_Moda FOREIGN KEY (ModaID) REFERENCES ModaTransportasi(ModaID)
);
