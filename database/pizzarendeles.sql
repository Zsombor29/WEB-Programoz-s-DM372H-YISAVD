-- Adatbázis takarítása
DROP TABLE IF EXISTS rendeles;
DROP TABLE IF EXISTS pizza;
DROP TABLE IF EXISTS kategoria;

-- Táblák létrehozása (Általános kódolással)
CREATE TABLE kategoria (
    nev VARCHAR(50) PRIMARY KEY,
    ar INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE pizza (
    nev VARCHAR(50) PRIMARY KEY,
    kategorianev VARCHAR(50),
    vegetarianus TINYINT(1),
    FOREIGN KEY (kategorianev) REFERENCES kategoria(nev)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE rendeles (
    az INT AUTO_INCREMENT PRIMARY KEY,
    pizzanev VARCHAR(50),
    darab INT NOT NULL,
    felvetel DATETIME,
    kiszallitas DATETIME,
    FOREIGN KEY (pizzanev) REFERENCES pizza(nev)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ADATOK BETÖLTÉSE

INSERT INTO kategoria (nev, ar) VALUES
('apród', 850),
('főnemes', 950),
('király', 1250),
('lovag', 1150);

INSERT INTO pizza (nev, kategorianev, vegetarianus) VALUES
('Áfonyás', 'király', 0),
('Babos', 'lovag', 0),
('Barbecue chicken', 'lovag', 0),
('Betyáros', 'király', 0),
('Caribi', 'apród', 0),
('Country', 'király', 0),
('Csabesz', 'király', 0),
('Csupa sajt', 'lovag', 1),
('Erdő kapitánya', 'apród', 0),
('Erős János', 'lovag', 0),
('Excellent', 'király', 0),
('Főnök kedvence', 'lovag', 0),
('Francia', 'főnemes', 0),
('Frankfurti', 'király', 0),
('Füstös', 'lovag', 0),
('Gino', 'király', 0),
('Gombás', 'apród', 1),
('Góré', 'lovag', 0),
('Görög', 'király', 0),
('Gyros pizza', 'király', 0),
('HamAndEggs', 'lovag', 0),
('Hamm', 'lovag', 0),
('Hawaii', 'főnemes', 0),
('Hellas', 'király', 0),
('Hercegnő', 'király', 0),
('Ilike', 'lovag', 0),
('Ínyenc', 'lovag', 0),
('Jázmin álma', 'lovag', 0),
('Jobbágy', 'király', 0),
('Juhtúrós', 'lovag', 0),
('Kagylós', 'király', 0),
('Kétszínű', 'lovag', 0),
('Kiadós', 'király', 0),
('Király pizza', 'király', 0),
('Kívánság', 'lovag', 1),
('Kukoricás', 'apród', 1),
('Laci bácsi kedvence', 'király', 0),
('Maffiózó', 'király', 0),
('Magvas', 'lovag', 0),
('Mamma fia', 'lovag', 0),
('Margit', 'apród', 1),
('Matróz', 'lovag', 0),
('Mexikói', 'lovag', 0),
('Mixi', 'király', 0),
('Napoletana', 'főnemes', 0),
('Négysajtos', 'lovag', 1),
('Négy évszak', 'lovag', 0),
('Nyuszó-Muszó', 'lovag', 0),
('Pásztor', 'lovag', 0),
('Pástétomos', 'lovag', 0),
('Pikáns', 'lovag', 0),
('Pipi', 'lovag', 0),
('Popey', 'lovag', 0),
('Ráki', 'király', 0),
('Rántott húsos', 'király', 0),
('Röfi', 'lovag', 0),
('Sajtos', 'apród', 1),
('Sajtos-gombás', 'apród', 1),
('Sonkás', 'apród', 0),
('Sonkás-gombás', 'apród', 0),
('Sonkás-gombás-kukoricás', 'főnemes', 0),
('Sonkás-kukoricás', 'apród', 0),
('Szalámis', 'apród', 0),
('Szicíliai', 'lovag', 0),
('Szőke kapitány', 'király', 0),
('Tenger gyümölcsei', 'lovag', 0),
('Tündi kedvence', 'király', 0),
('Tüzes', 'lovag', 0),
('UFO', 'lovag', 0),
('Viking', 'lovag', 0);

INSERT INTO rendeles (pizzanev, darab, felvetel, kiszallitas) VALUES
('Popey', 2, '2005-11-12 11:21:00', '2005-11-12 12:11:00'),
('Kagylós', 1, '2005-11-12 11:41:00', '2005-11-12 12:26:00'),
('Barbecue chicken', 1, '2005-11-12 12:38:00', '2005-11-12 13:02:00'),
('Röfi', 1, '2005-11-12 13:18:00', '2005-11-12 13:58:00'),
('Tündi kedvence', 1, '2005-11-12 13:44:00', '2005-11-12 16:53:00'),
('Hercegnő', 2, '2005-11-12 14:10:00', '2005-11-12 14:57:00'),
('Mixi', 1, '2005-11-12 14:20:00', '2005-11-12 16:25:00'),
('Ráki', 3, '2005-11-12 14:51:00', '2005-11-12 17:06:00'),
('Szőke kapitány', 1, '2005-11-12 15:13:00', '2005-11-12 16:11:00'),
('Áfonyás', 1, '2005-11-12 15:35:00', '2005-11-12 16:11:00'),
('Excellent', 2, '2005-11-12 16:11:00', '2005-11-12 17:49:00'),
('Mexikói', 1, '2005-11-12 16:36:00', '2005-11-12 18:29:00'),
('Nyuszó-Muszó', 1, '2005-11-12 17:10:00', '2005-11-12 18:49:00'),
('Jobbágy', 1, '2005-11-12 17:52:00', '2005-11-12 19:24:00'),
('Négysajtos', 1, '2005-11-12 18:13:00', '2005-11-12 19:42:00'),
('Kagylós', 1, '2005-11-12 18:45:00', '2005-11-12 21:07:00'),
('Mamma fia', 2, '2005-11-12 19:11:00', '2005-11-12 21:30:00'),
('Mexikói', 1, '2005-11-12 19:35:00', '2005-11-12 22:31:00'),
('Pásztor', 1, '2005-11-12 20:05:00', '2005-11-12 22:56:00'),
('Négysajtos', 1, '2005-11-12 20:25:00', '2005-11-12 22:15:00'),
('Excellent', 1, '2007-01-18 11:34:00', '2007-01-18 14:12:00'),
('Excellent', 1, '2007-01-18 11:51:00', '2007-01-18 14:48:00'),
('Pikáns', 1, '2007-01-18 12:03:00', '2007-01-18 15:01:00'),
('Kívánság', 1, '2007-01-18 12:56:00', '2007-01-18 13:58:00'),
('Ráki', 1, '2007-01-18 13:38:00', '2007-01-18 16:34:00'),
('Nyuszó-Muszó', 1, '2007-01-18 14:08:00', '2007-01-18 15:55:00'),
('Mamma fia', 2, '2007-01-18 14:58:00', '2007-01-18 17:19:00'),
('Kívánság', 1, '2007-01-18 15:38:00', '2007-01-18 16:57:00'),
('Erős János', 1, '2007-01-18 15:52:00', '2007-01-18 18:11:00'),
('Maffiózó', 1, '2007-01-18 16:07:00', '2007-01-18 18:53:00'),
('Pásztor', 2, '2007-01-18 16:50:00', '2007-01-18 19:03:00'),
('Pástétomos', 1, '2007-01-18 17:42:00', '2007-01-18 20:55:00'),
('Mixi', 1, '2007-01-18 17:54:00', '2007-01-18 18:25:00'),
('Magvas', 1, '2007-01-18 18:34:00', '2007-01-18 20:22:00'),
('Barbecue chicken', 1, '2007-01-18 18:54:00', '2007-01-18 20:08:00'),
('Kétszínű', 1, '2007-01-18 19:16:00', '2007-01-18 20:18:00');