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
    meret VARCHAR(20),
    vevonev VARCHAR(100),
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
