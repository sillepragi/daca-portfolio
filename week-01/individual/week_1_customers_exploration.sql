-- Nädal: 1          Meeskond: Turundusanalüüsi osakond          Roll: Kliendiandmete uurija

-- Uurin klientide koguarvu
SELECT COUNT (*) AS klientide_arv
FROM customers;
-- Kliente on kokku 3150

-- Vaatan tabeli customers veergude struktuuri
SELECT *
FROM customers
LIMIT 10;
-- Tabelis on 9 veergu: customer_id, first_name, last_name, email, phone, city, registration_date, loyalty_tier ja birth_year

-- Uurin linnade jaotust
SELECT distinct city
FROM customers;
-- Esindatud on 12 linna (tekib linnade kordused, kuna linnad erinevate vormingutega - suurtäht, väiketäht, tühikud jne, mistõttu ei tule päringuga õiget tulemit)

-- Filtreerin kindla linna kliendid
SELECT *
FROM customers
WHERE city = 'Tallinn'
ORDER BY last_name ASC
LIMIT 15;
-- Antud päring ei anna soovitud tulemust, kuna tabeli andmetes on linnade nimetused erinevate vorminguteda

-- Kontrollin registreerimise kuupäevasid
SELECT
  MIN(registration_date) AS vanim,
  MAX(registration_date) AS uusim
FROM customers;
-- Esimene klient registreerus 02.01.2020 ja viimane 27.02.2025

-- Kontrollin puuduvaid väärtusi
-- Kliendid, kelle eesnimi puudu
SELECT COUNT (*) - COUNT (first_name) AS puuduvad_eesnimed
FROM customers;
-- Mitte ühegi kliendi eesnimi ei ole puudu

-- Kliendid, kelle e-mail on puudu
SELECT COUNT (*) - COUNT (email) AS puuduvad_emailid
FROM customers;
-- 380 kliendi e-mail on puudu

-- Leian dublikaatsed e-mailid
SELECT
  COUNT (*) AS kokku_emaile,
  COUNT (DISTINCT email) AS unikaalseid_emaile,
  COUNT (*) - COUNT (DISTINCT email) AS dublikaatsed_emailid
FROM customers;
-- E-maile on kokku 3150, unikaalseid e-maile 2640, seega dublikaatseid e-maile on 510

-- Loen kliendid linnade alusel kokku
SELECT city,
COUNT (*) AS klientide_arv
FROM customers
GROUP BY city
ORDER BY klientide_arv DESC;
-- Antud päring ei anna soovitud tulemust, kuna tabeli andmetes on linnade nimetused erinevate vormingutega

-- Leian viimase 6 kuu registreerimised
SELECT *
FROM customers
WHERE registration_date >='2024-07-01'
ORDER BY registration_date DESC;
-- 6 kuu jooksul on kokku 425 registreerimist

/* 
KOKKUVÕTE
UrbanStyle'is on kokku 3150 klienti. Esindatud on 12 erinevat linna: Tallinn, Tartu, Pärnu, Narva, Viljandi, Rakvere, Valga, Kuressaare, Haapsalu, Jõhvi, Võru, Paide.
Andmeid analüüsides märkasin üsna palju probleeme. Esmalt linnade nimetused on tabelis erinevate vormingutega ehk tekkisid kordused ja ma ei saanud päringu abil esindatud linnade arvu. Näiteks on sisestatud Tartu linn nii läbivalt väikeste- ja suurte tähtedega, kui ka suure algustähega või hoopis enne Tartut on tühikud. See tekitab probleeme nii kindla linna klientide filtreerimisega kui ka klientide loendamisel linnade alusel. Samuti on kliendiandmetes puudu 380 kliendi e-mail ja dublikaatseid e-maile on kokku on 510.

JÄRELDUS
Tuleb parandada customer tabeli city ja email veergude andmeid.
*/