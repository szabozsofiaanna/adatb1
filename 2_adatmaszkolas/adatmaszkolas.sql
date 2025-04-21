--letrehozom az Ugyfel tabla masolatat
CREATE TABLE UGYFEL (
    LOGIN VARCHAR(32) PRIMARY KEY,
    EMAIL VARCHAR(64),
    NEV VARCHAR(64),
    SZULEV NUMERIC(4),
    NEM VARCHAR(1),
    CIM VARCHAR(128)
);

--beillesztek mintaadatokat (elso 10 sor)
INSERT INTO UGYFEL (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM) VALUES
('adam1', 'adam.kiss@mail.hu', 'Kiss Ádám', 1991, 'F', '5630 Békés, Szolnoki út 8.'),
('adam3', 'adam3@gmail.com', 'Barkóci Ádám', 1970, 'F', '3910 Tokaj, Dózsa György utca 37.'),
('adam4', 'adam.bieniek@mail.hu', 'Bieniek Ádám', 1976, 'F', '8630 Balatonboglár, Juhászföldi út 1.'),
('agnes', 'agnes@gmail.com', 'Lengyel Ágnes', 1979, 'N', '5200 Törökszentmiklós, Deák Ferenc út 5.'),
('agnes3', 'agnes3@gmail.com', 'Hartjánszky Ágnes', 1967, 'N', '6430 Bácsalmás, Posta köz 2.'),
('AGNESH', 'AGNESH@gmail.com', 'Horváth Ágnes', 1981, 'N', '8200 Veszprém, Rákóczi utca 21.'),
('AGNESK', 'AGNESK@gmail.com', 'Kovács Ágnes', 1988, 'N', '1084 Budapest, Endrődi Sándor utca 47.'),
('akos', 'akos.biro@mail.hu', 'Bíró Ákos', 1982, 'F', '9023 Győr, Kossuth Lajos utca 47/b.'),
('aladar', 'aladar.dunai@mail.hu', 'Dunai Aladár', 1980, 'F', '5931 Nagyszénás, Árpád utca 23.'),
('alexandra', 'alexandra.bagoczki@mail.hu', 'Bagóczki Alexandra', 1992, 'N', '2381 Táborfalva, Petőfi út 1/2.');

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
GRANT SELECT ON UGYFEL_MASKED TO masked_user;

--masked_userkent lekerdezem az adatokat, hogy lassam mukodik e
EXECUTE AS USER = 'masked_user';
SELECT * FROM UGYFEL_MASKED;
REVERT;

