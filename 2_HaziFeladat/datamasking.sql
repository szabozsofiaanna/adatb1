--letrehozom az Ugyfel tabla masolatat
CREATE TABLE UGYFEL (
    LOGIN VARCHAR(32) PRIMARY KEY,
    EMAIL VARCHAR(64),
    NEV VARCHAR(64),
    SZULEV NUMERIC(4),
    NEM VARCHAR(1),
    CIM VARCHAR(128)
);

--adatok beillesztese
INSERT INTO UGYFEL (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM) VALUES
('adam1', 'ádám.kiss@mail.hu', 'Kiss Ádám', 1991, 'F', '5630 Békés, Szolnoki út 8.'),
('adam3', 'adam3@gmail.com', 'Barkóci Ádám', 1970, 'F', '3910 Tokaj, Dózsa György utca 37.'),
('adam4', 'ádám.bieniek@mail.hu', 'Bieniek Ádám', 1976, 'F', '8630 Balatonboglár, Juhászföldi út 1.'),
('agnes', 'agnes@gmail.com', 'Lengyel Ágnes', 1979, 'N', '5200 Törökszentmiklós, Deák Ferenc út 5.'),
('agnes3', 'agnes3@gmail.com', 'Hartyánszky Ágnes', 1967, 'N', '6430 Bácsalmás, Posta köz 2.'),
('AGNESH', 'AGNESH@gmail.com', 'Horváth Ágnes', 1981, 'N', '8200 Veszprém, Rákóczi utca 21.'),
('AGNESK', 'AGNESK@gmail.com', 'Kovács Ágnes', 1988, 'N', '1084 Budapest, Endrődi Sándor utca 47.'),
('akos', 'ákos.bíró@mail.hu', 'Bíró Ákos', 1982, 'F', '9023 Győr, Kossuth Lajos utca 47/b.'),
('aladar', 'aladár.dunai@mail.hu', 'Dunai Aladár', 1980, 'F', '5931 Nagyszénás, Árpád utca 23.'),
('alexandra', 'alexandra.bagóczki@mail.hu', 'Bagóczki Alexandra', 1992, 'N', '2381 Táborfalva, Petőfi utca 1/2.'),
('alexis', 'alexbiro@gmail.com', 'Biró Alexander', 2000, 'F', '6914 Pitvaros, Deák F. u. 38.'),
('andi', 'andrea.maródi@mail.hu', 'Maródi Andrea', 1968, 'N', '5465 Cserkeszőlő, Árpád utca 4.'),
('andras2', 'andrás.tóth@mail.hu', 'Tóth András', 1997, 'F', '4071 Egyek, Petőfi utca 30.'),
('andras21', 'andrás.molnár@mail.hu', 'Molnár András', 1977, 'F', '7900 Szigetvár, Rákóczi utca 67.'),
('andras3', 'andrás.vígh@mail.hu', 'Vígh András', 1971, 'F', '1118 Budapest, Arany János utca 1.'),
('andras4', 'andras4@gmail.com', 'Back András', 1984, 'F', '3783 Edelény, Fő út 169.'),
('andras41', 'andras41@gmail.com', 'Komjáti András', 1997, 'F', '5065 Nagykörű, Kossuth út 24.'),
('ANDRASE', 'ANDRASE@gmail.com', 'Erdei András', 1997, 'F', '5071 Besenyszög, Szolnoki út 8.'),
('ANDRASN', 'andrás.nagy@mail.hu', 'Nagy András', 1980, 'F', '6500 Baja, Fő út 169.'),
('andrea', 'andrea.kiss@mail.hu', 'Kiss Andrea', 1993, 'N', '1113 Budapest, Petőfi Sándor utca 87.'),
('andrea3', 'andrea3@gmail.com', 'Szomor Andrea', 1996, 'N', '7960 Sellye, Bécsi utca 82.');


--letrehozok egy maszkolt ugyfel tablat
CREATE TABLE UGYFEL_MASKED (
    LOGIN VARCHAR(32) PRIMARY KEY,
    EMAIL VARCHAR(64) MASKED WITH (FUNCTION = 'email()'),
    NEV VARCHAR(64) MASKED WITH (FUNCTION = 'partial(1,"XXXX",1)'),
    SZULEV NUMERIC(4) MASKED WITH (FUNCTION = 'random(1970, 2005)'),
    NEM VARCHAR(1),
    CIM VARCHAR(128) MASKED WITH (FUNCTION = 'default()')
);

--Ugyfel tablambol atmasolom az adatokat az UGYFEL_MASKED-ba
INSERT INTO UGYFEL_MASKED (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM)
SELECT LOGIN, EMAIL, NEV, SZULEV, NEM, CIM
FROM UGYFEL;

--letrehozok egy usert, akinek maszkolt hozzaferese van es adok jogosultsagot hogy lassa a maszkolt adatokat
CREATE USER masked_user WITHOUT LOGIN;
GRANT SELECT ON dbo.UGYFEL_MASKED TO masked_user;

--masked_userkent lekerdezem az adatokat, hogy lassam mukodik e
EXECUTE AS USER = 'masked_user';
SELECT * FROM dbo.UGYFEL_MASKED;
REVERT;