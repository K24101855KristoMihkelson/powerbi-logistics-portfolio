create table kliendid (
    kliend_id int primary key identity(1,1),
    kliendi_Nimi varchar(25),
    asukoht varchar(50) 
);

create table autojuhid (
    juht_id int primary key identity(1,1),
    juhi_nimi varchar(25),
    auto_reg_nr varchar(10) 
);

create table saadetised (
    tellimused_id int primary key identity(1,1),
    kliendi_id int, 
    juhi_id int,    
    kaal decimal(6,2),
    loomise_kuupaev date,
    staatus varchar(15)
);

-- 1. Lisame kliendid
INSERT INTO kliendid (kliendi_Nimi, asukoht)
VALUES 
    ('AS Prisma', 'Tallinn'),
    ('OÜ Tartu Terminal', 'Tartu'),
    ('Pärnu Sadam AS', 'Pärnu'),
    ('Rimi Eesti', 'Harjumaa');

-- 2. Lisame autojuhid
INSERT INTO autojuhid (juhi_nimi, auto_reg_nr)
VALUES 
    ('Marek Tamm', '123 ABC'),
    ('Jaanus Kask', '456 DEF'),
    ('Sergei Ivanov', '789 GHI');

-- 3. Lisame saadetised (kasutame eelnevalt loodud ID-sid)
INSERT INTO saadetised (kliendi_id, juhi_id, kaal, loomise_kuupaev, staatus)
VALUES 
    (1, 1, 1500.50, '2026-05-25', 'Tarnitud'),
    (2, 2, 850.00, '2026-05-28', 'Tarnitud'),
    (3, 3, 2200.75, '2026-05-30', 'Hilinenud'),
    (4, 1, 50.00, '2026-05-31', 'Töötlemisel'),
    (1, 2, 430.20, '2026-05-31', 'Transiidil');