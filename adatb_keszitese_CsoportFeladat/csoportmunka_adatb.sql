/*
alter table Jarmu DROP CONSTRAINT IF EXISTS FK_Jarmu_Oktato;
alter table Ora DROP CONSTRAINT IF EXISTS FK_Ora_Tanfolyam;
alter table Tanfolyam DROP CONSTRAINT IF EXISTS FK_Tanfolyam_Oktato;
alter table Tanfolyam DROP CONSTRAINT IF EXISTS FK_Tanfolyam_Tanulo;
alter table Vizsga DROP CONSTRAINT IF EXISTS FK_Vizsga_Tanfolyam;
alter table Jarmu DROP CONSTRAINT IF EXISTS PK_Jarmu;
alter table Oktato DROP CONSTRAINT IF EXISTS PK_Oktato;
alter table Ora DROP CONSTRAINT IF EXISTS PK_Ora;
alter table Tanfolyam DROP CONSTRAINT IF EXISTS PK_Tanfolyam;
alter table Tanulo DROP CONSTRAINT IF EXISTS PK_Tanulo;
alter table Vizsga DROP CONSTRAINT IF EXISTS PK_Vizsga; 
*/


DROP TABLE IF EXISTS Ora;
DROP TABLE IF EXISTS Vizsga;
DROP TABLE IF EXISTS Tanfolyam;
DROP TABLE IF EXISTS Tanulo;
DROP TABLE IF EXISTS Jarmu;
DROP TABLE IF EXISTS Oktato;



CREATE TABLE Tanulo (
    tanulo_id INT NOT NULL,
    nev VARCHAR(50) NOT NULL,
    szuletesi_datum DATE NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    CONSTRAINT PK_Tanulo PRIMARY KEY (tanulo_id)
);


CREATE TABLE Oktato (
    oktato_id INT NOT NULL,
    nev VARCHAR(50) NOT NULL,
    telefonszam VARCHAR(20) NOT NULL,
    email VARCHAR(50),
    jogositvany_kategoria VARCHAR(10) NOT NULL, 
    CONSTRAINT PK_Oktato PRIMARY KEY (oktato_id)
);


CREATE TABLE Jarmu (
    jarmu_id INT NOT NULL,
    rendszam VARCHAR(20) NOT NULL UNIQUE,
    tipus VARCHAR(50) NOT NULL,
    kategoria VARCHAR(10) NOT NULL,
    oktato_id INT NOT NULL,
    CONSTRAINT PK_Jarmu PRIMARY KEY (jarmu_id),
    CONSTRAINT FK_Jarmu_Oktato FOREIGN KEY (oktato_id) REFERENCES Oktato(oktato_id)
);


CREATE TABLE Tanfolyam (
    tanfolyam_id INT NOT NULL,
    tanulo_id INT NOT NULL,
    oktato_id INT NOT NULL,
    kategoria VARCHAR(10),
    kezdet_datum DATE NOT NULL,
    allapot VARCHAR(20) DEFAULT 'folyamatban', --ez ujitas
    CONSTRAINT PK_Tanfolyam PRIMARY KEY (tanfolyam_id),
    CONSTRAINT FK_Tanfolyam_Tanulo FOREIGN KEY (tanulo_id) REFERENCES Tanulo(tanulo_id),
    CONSTRAINT FK_Tanfolyam_Oktato FOREIGN KEY (oktato_id) REFERENCES Oktato(oktato_id)
);


CREATE TABLE Ora (
    ora_id INT NOT NULL,
    tanfolyam_id INT NOT NULL,
    datum DATE NOT NULL,
    ora_tipus VARCHAR(50),
    hossz INT NOT NULL,
    CONSTRAINT PK_Ora PRIMARY KEY (ora_id),
    CONSTRAINT FK_Ora_Tanfolyam FOREIGN KEY (tanfolyam_id) REFERENCES Tanfolyam(tanfolyam_id)
);


CREATE TABLE Vizsga (
    vizsga_id INT NOT NULL,
    tanfolyam_id INT NOT NULL,
    datum DATE NOT NULL,
    eredmeny VARCHAR(20),
    tipus VARCHAR(20),
    CONSTRAINT PK_Vizsga PRIMARY KEY (vizsga_id),
    CONSTRAINT FK_Vizsga_Tanfolyam FOREIGN KEY (tanfolyam_id) REFERENCES Tanfolyam(tanfolyam_id)
);


INSERT INTO Tanulo VALUES (1, 'Kovács Anna', '2000-05-12', '06201234567', 'kovacsanna@gmail.com'); 

INSERT INTO Tanulo VALUES (2, 'Nagy Péter', '1998-11-03', '06301234567', 'nagypeter@gmail.com'); 

INSERT INTO Tanulo VALUES (3, 'Horváth Éva', '1999-07-21', '06701234567', 'horvatheva@gmail.com'); 

INSERT INTO Tanulo VALUES (4, 'Farkas Bence', '2001-03-14', '06501234567', 'farkasbence@gmail.com'); 

INSERT INTO Tanulo VALUES (5, 'Lakatos Márk', '2002-01-05', '06901234567', 'lakatosmark@gmail.com'); 

INSERT INTO Tanulo VALUES (6, 'Szilágyi Lili', '2000-08-18', '06202345678', 'szilagyilili@gmail.com'); 

INSERT INTO Tanulo VALUES (7, 'Papp Zsolt', '1997-04-30', '06304561234', 'pappzsolt@gmail.com'); 

INSERT INTO Tanulo VALUES (8, 'Molnár Kata', '2003-02-12', '06704562345', 'molnarkata@gmail.com'); 

INSERT INTO Tanulo VALUES (9, 'Varga Tamás', '1995-09-17', '06201239876', 'vargatamas@gmail.com'); 

INSERT INTO Tanulo VALUES (10, 'Balogh Nóra', '1996-12-23', '06704569874', 'baloghnora@gmail.com');

INSERT INTO Tanulo VALUES (11, 'Mester Nikolett', '2006-8-27', '06208224353', 'mesternikolett@gmail.com');

INSERT INTO Tanulo VALUES (12, 'Nagy Botond', '2007-01-12', '06203873633', 'nagybotond@gmail.com');

INSERT INTO Tanulo VALUES (13, 'Debrődi Bálint', '2003-10-08', '06207765387', 'debrodibalint@gmail.com');

INSERT INTO Tanulo VALUES (14, 'Kiss Anna', '2002-05-14', '06301234567', 'kissanna@gmail.com');

INSERT INTO Tanulo VALUES (15, 'Szabó Péter', '1999-11-22', '06701239876', 'szabopeter@gmail.com');

INSERT INTO Tanulo VALUES (16, 'Farkas Ádám', '2001-07-09', '06204837291', 'farkasadam@gmail.com');

INSERT INTO Tanulo VALUES (17, 'Tóth Júlia', '2005-03-30', '06302837465', 'tothjulia@gmail.com');

INSERT INTO Tanulo VALUES (18, 'Horváth Márk', '1998-01-16', '06704382910', 'horvathmark@gmail.com');

 

INSERT INTO Oktato VALUES (1, 'Tóth László', '06209876543', 'tothlaszlo@gmail.com', 'B'); 

INSERT INTO Oktato VALUES (2, 'Szabó Erika', '06209874567', 'szaboerika@gmail.com', 'A2'); 

INSERT INTO Oktato VALUES (3, 'Kis Attila', '06701239876', 'kisattila@gmail.com', 'B'); 

INSERT INTO Oktato VALUES (4, 'Bíró Dóra', '06202345678', 'birodora@gmail.com', 'A1'); 

INSERT INTO Oktato VALUES (5, 'Németh Csaba', '06304567890', 'nemethcsaba@gmail.com', 'AM');

INSERT INTO Oktato VALUES (6, 'Fosztó Ibolya', '06304433526', 'fosztoibolya@gmail.com', 'B');

 

INSERT INTO Jarmu VALUES (1, 'KLW-112', 'Suzuki Swift', 'B', 1); 

INSERT INTO Jarmu VALUES (2, 'POI-392', 'Yamaha XJ6', 'A2', 2); 

INSERT INTO Jarmu VALUES (3, 'DIL-224', 'Opel Corsa', 'B', 3); 

INSERT INTO Jarmu VALUES (4, 'GHI-852', 'Honda CB125', 'A1', 4); 

INSERT INTO Jarmu VALUES (5, 'RST-374', 'Ford Fiesta', 'B', 1); 

INSERT INTO Jarmu VALUES (6, 'OPQ-159', 'Piaggio Liberty 50', 'AM', 5); 

 
INSERT INTO Tanfolyam VALUES (1, 1, 1,'B', '2025-01-10', 'befejezett');

INSERT INTO Tanfolyam VALUES (2, 2, 2,'A2', '2025-01-15', 'befejezett');

INSERT INTO Tanfolyam VALUES (3, 3, 1,'B', '2025-01-20', 'befejezett');

INSERT INTO Tanfolyam VALUES (4, 4, 3,'B', '2025-01-25', 'befejezett');

INSERT INTO Tanfolyam VALUES (5, 5, 6,'B', '2025-01-30', 'befejezett');

INSERT INTO Tanfolyam VALUES (6, 6, 4,'A1', '2025-02-04', 'folyamatban');

INSERT INTO Tanfolyam VALUES (7, 7, 6,'B', '2025-02-09', 'folyamatban');

INSERT INTO Tanfolyam VALUES (8, 8, 5,'AM', '2025-02-14', 'befejezett');

INSERT INTO Tanfolyam VALUES (9, 9, 6,'B', '2025-02-19', 'befejezett');

INSERT INTO Tanfolyam VALUES (10, 10, 1,'B', '2025-02-24', 'folyamatban');

INSERT INTO Tanfolyam VALUES (11, 11, 1,'B', '2025-03-01', 'folyamatban');

INSERT INTO Tanfolyam VALUES (12, 12, 3,'B', '2025-03-06', 'folyamatban');

INSERT INTO Tanfolyam VALUES (13, 13, 2,'A2', '2025-03-11', 'folyamatban');

INSERT INTO Tanfolyam VALUES (14, 14, 3,'B', '2025-03-16', 'folyamatban'); 

INSERT INTO Tanfolyam VALUES (15, 15, 6,'B', '2025-03-21', 'folyamatban'); 

INSERT INTO Tanfolyam VALUES (16, 16, 3,'B', '2025-03-26', 'folyamatban'); 

INSERT INTO Tanfolyam VALUES (17, 17, 1,'B', '2025-03-31', 'folyamatban'); 

INSERT INTO Tanfolyam VALUES (18, 18, 6,'B', '2025-04-05', 'folyamatban'); 

 

INSERT INTO Ora VALUES (1, 1, '2025-02-10', 'elmélet', 1);
INSERT INTO Ora VALUES (2, 1, '2025-02-12', 'gyakorlat', 2);
INSERT INTO Ora VALUES (3, 1, '2025-02-15', 'gyakorlat', 2);
INSERT INTO Ora VALUES (4, 1, '2025-02-16', 'elmélet', 2);
INSERT INTO Ora VALUES (5, 1, '2025-02-18', 'gyakorlat', 2);

INSERT INTO Ora VALUES (6, 2, '2025-02-15', 'elmélet', 1);
INSERT INTO Ora VALUES (7, 2, '2025-02-16', 'gyakorlat', 1);
INSERT INTO Ora VALUES (8, 2, '2025-02-17', 'gyakorlat', 2);
INSERT INTO Ora VALUES (9, 2, '2025-02-18', 'gyakorlat', 1);
INSERT INTO Ora VALUES (10, 2, '2025-02-19', 'gyakorlat', 2);

INSERT INTO Ora VALUES (11, 3, '2025-02-20', 'elmélet', 1);
INSERT INTO Ora VALUES (12, 3, '2025-02-21', 'elmélet', 1);
INSERT INTO Ora VALUES (13, 3, '2025-02-22', 'gyakorlat', 1);
INSERT INTO Ora VALUES (14, 3, '2025-02-23', 'gyakorlat', 2);
INSERT INTO Ora VALUES (15, 3, '2025-02-24', 'gyakorlat', 2);

INSERT INTO Ora VALUES (16, 4, '2025-02-25', 'elmélet', 1);
INSERT INTO Ora VALUES (17, 4, '2025-02-26', 'gyakorlat', 1);
INSERT INTO Ora VALUES (18, 4, '2025-02-27', 'gyakorlat', 1);
INSERT INTO Ora VALUES (19, 4, '2025-02-28', 'gyakorlat', 2);
INSERT INTO Ora VALUES (20, 4, '2025-03-02', 'gyakorlat', 1);

INSERT INTO Ora VALUES (21, 5, '2025-02-28', 'elmélet', 1);
INSERT INTO Ora VALUES (22, 5, '2025-03-01', 'gyakorlat', 2);
INSERT INTO Ora VALUES (23, 5, '2025-03-03', 'gyakorlat', 2);
INSERT INTO Ora VALUES (24, 5, '2025-03-04', 'gyakorlat', 2);
INSERT INTO Ora VALUES (25, 5, '2025-03-05', 'gyakorlat', 1);

INSERT INTO Ora VALUES (26, 6, '2025-03-04', 'elmélet', 1);
INSERT INTO Ora VALUES (27, 6, '2025-03-06', 'elmélet', 1);
INSERT INTO Ora VALUES (28, 6, '2025-03-07', 'gyakorlat', 2);

INSERT INTO Ora VALUES (29, 7, '2025-03-09', 'elmélet', 1);
INSERT INTO Ora VALUES (30, 7, '2025-03-11', 'gyakorlat', 2);
INSERT INTO Ora VALUES (31, 7, '2025-03-12', 'gyakorlat', 2);

INSERT INTO Ora VALUES (32, 8, '2025-03-14', 'elmélet', 1);
INSERT INTO Ora VALUES (33, 8, '2025-03-15', 'gyakorlat', 2);
INSERT INTO Ora VALUES (34, 8, '2025-03-16', 'gyakorlat', 2);
INSERT INTO Ora VALUES (35, 8, '2025-03-17', 'gyakorlat', 1);
INSERT INTO Ora VALUES (36, 8, '2025-03-19', 'gyakorlat', 1);

INSERT INTO Ora VALUES (37, 9, '2025-03-21', 'elmélet', 1);
INSERT INTO Ora VALUES (38, 9, '2025-03-22', 'gyakorlat', 2);
INSERT INTO Ora VALUES (39, 9, '2025-03-23', 'gyakorlat', 1);
INSERT INTO Ora VALUES (40, 9, '2025-03-24', 'gyakorlat', 2);
INSERT INTO Ora VALUES (41, 9, '2025-03-25', 'gyakorlat', 1);

INSERT INTO Ora VALUES (42, 10, '2025-03-25', 'elmélet', 1);
INSERT INTO Ora VALUES (43, 10, '2025-03-27', 'gyakorlat', 2);

INSERT INTO Ora VALUES (44, 11, '2025-04-02', 'elmélet', 1);
INSERT INTO Ora VALUES (45, 11, '2025-04-04', 'gyakorlat', 2);

INSERT INTO Ora VALUES (46, 12, '2025-04-08', 'elmélet', 1);
INSERT INTO Ora VALUES (47, 12, '2025-04-09', 'gyakorlat', 2);


--vizsga_id, tanfolyam_id, datum, eredmeny, tipus
INSERT INTO Vizsga VALUES (1, 1, '2025-03-01', 'sikeres', 'személygépkocsi (B)'); 

INSERT INTO Vizsga VALUES (2, 2, '2025-03-20', 'sikertelen', 'motor (A2)'); 

INSERT INTO Vizsga VALUES (3, 3, '2025-04-10', 'sikertelen', 'személygépkocsi (B)'); 

INSERT INTO Vizsga VALUES (4, 4, '2025-04-15', 'sikeres', 'személygépkocsi (B)'); 

INSERT INTO Vizsga VALUES (5, 5, '2025-04-16', 'sikertelen', 'személygépkocsi (B)');

INSERT INTO Vizsga VALUES (6, 2, '2025-04-17', 'sikeres', 'motor (A2)');

INSERT INTO Vizsga VALUES (7, 8, '2025-04-18', 'sikeres', 'segédmotor (AM)');

INSERT INTO Vizsga VALUES (8, 5, '2025-04-19', 'sikeres', 'személygépkocsi (B)');

INSERT INTO Vizsga VALUES (9, 3, '2025-04-21', 'sikertelen', 'személygépkocsi (B)');



--Az oktatok altal tartott oraszam - oraszam szerint csokkeno sorrendben
--penzugyi elszamolas szempontjabol fontos tudni
--osszes_ora_hossz = ora hosszainak osszeadasa

SELECT 
    o.nev AS oktato_nev,
    COUNT(ora.ora_id) AS orak_szama,
    SUM(ora.hossz) AS osszes_ora_hossz
FROM Oktato o
JOIN Tanfolyam tf ON o.oktato_id = tf.oktato_id
JOIN Ora ora ON tf.tanfolyam_id = ora.tanfolyam_id
GROUP BY o.nev
ORDER BY osszes_ora_hossz DESC;



--Sikeres és sikertelen vizsgák aránya oktatónként - sikeresseg szerint csokkeno

SELECT 
    o.nev AS oktato_nev,
    SUM(CASE WHEN v.eredmeny = 'sikeres' THEN 1 ELSE 0 END) AS sikeres_vizsgak,
    SUM(CASE WHEN v.eredmeny = 'sikertelen' THEN 1 ELSE 0 END) AS sikertelen_vizsgak,
    CAST(SUM(CASE WHEN v.eredmeny = 'sikeres' THEN 1 ELSE 0 END) AS FLOAT) /
    NULLIF(COUNT(v.vizsga_id), 0) AS sikeressegi_arany
FROM Oktato o
JOIN Tanfolyam tf ON o.oktato_id = tf.oktato_id
JOIN Vizsga v ON tf.tanfolyam_id = v.tanfolyam_id
GROUP BY o.nev
ORDER BY sikeressegi_arany DESC;




--Melyik oktatónál mennyi tanuló van jelenleg? - aki sikeres vizsgat tett, az mar nem szamit

SELECT 
    o.nev AS oktato_nev,
    COUNT(DISTINCT tf.tanulo_id) AS aktiv_tanulok_szama
FROM Oktato o
JOIN Tanfolyam tf ON o.oktato_id = tf.oktato_id
LEFT JOIN Vizsga v ON tf.tanfolyam_id = v.tanfolyam_id AND v.eredmeny = 'sikeres'
WHERE v.vizsga_id IS NULL
GROUP BY o.nev
ORDER BY aktiv_tanulok_szama DESC;



--Tanulok legutobbi vizsgaeredmenye - kivancsiak vagyunk hogy vegzett e az iskolaban, vagy sikertelen vizsgat tett e

SELECT 
    t.nev AS tanulo_nev,
    v.datum AS legutobbi_vizsga_datum,
    v.eredmeny
FROM Tanulo t
JOIN Tanfolyam tf ON t.tanulo_id = tf.tanulo_id
JOIN Vizsga v ON tf.tanfolyam_id = v.tanfolyam_id
WHERE v.datum = (SELECT MAX(v2.datum)
    FROM Tanfolyam tf2
    JOIN Vizsga v2 ON tf2.tanfolyam_id = v2.tanfolyam_id
    WHERE tf2.tanulo_id = t.tanulo_id
)
ORDER BY legutobbi_vizsga_datum DESC;



--Melyik oktato hany tanfolyamot vezet - csak a folyamatban levok szamitanak

SELECT 
    o.nev AS oktato_nev,
    COUNT(tf.tanfolyam_id) AS folyamatban_tanfolyamok
FROM Oktato o
JOIN Tanfolyam tf ON o.oktato_id = tf.oktato_id
WHERE tf.allapot = 'folyamatban'
GROUP BY o.nev
ORDER BY folyamatban_tanfolyamok DESC;



--oktatonkent hasznalt jarmuvek listaja rendszamokkal

SELECT 
    o.nev AS oktato_nev,
    j.tipus AS jarmu_tipus,
    j.rendszam
FROM Oktato o
JOIN Jarmu j ON o.oktato_id = j.oktato_id
ORDER BY o.nev, j.tipus;

