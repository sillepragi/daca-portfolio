-- Nädal: 6      Meeskond: Turundusanalüüsi osakond   Roll: C - Pärnu kaupluse lugu

-- ÜLESANNE: Luua Pärnu kaupluse interaktiivne dashboard koos andmelooga. Pärnu on väikseim kauplus ja tugeva hooajalisusega (suvekuurort). Ülesanne on näidata hooajalist mustrit ja selle ärilist tähendust.

-- VÄLJUND: Interaktiivne dashboard (3-5 diagrammi Pärnu andmetega). Juhtide kokkuvõte (3-5 peamist järeldust). Vähemalt 2 annotatsiooni diagrammidel ja 1 viitejoon (eesmärk või keskmine). Lisada andmelugu: 3-4 lauset narratiivina.



-- Samm 1: Leian Pärnu müügitrendi kuude lõikes + arvutan kõigi kuude keskmise ostu ja leian protsentuaalse erinevuse aasta keskmisega

WITH KuineMyyk AS (
    -- 1. Arvutan iga kuu kogukäibe (kasutan DATE_TRUNC, et hoida aastad ja kuud lahus)
    SELECT 
        DATE_TRUNC('month', sale_date) AS kuu,
        SUM(total_price) AS kuu_tulu
    FROM sales
    WHERE store_location = 'Pärnu' -- Näide Pärnu poe põhjal
    GROUP BY 1
),
Statistika AS (
    -- 2. Arvutan kõigi kuude keskmise tulu
    SELECT 
        AVG(kuu_tulu) AS aasta_keskmine_kuu
    FROM KuineMyyk
)
-- 3. Leian vahe protsendi valemiga: ((Kuu tulu - Keskmine) / Keskmine) * 100
SELECT 
    kuu,
    ROUND(kuu_tulu, 2) AS kuu_kaive,
    ROUND(aasta_keskmine_kuu, 2) AS aasta_keskmine,
    ROUND(((kuu_tulu - aasta_keskmine_kuu) / aasta_keskmine_kuu) * 100, 2) AS vahe_protsent
FROM KuineMyyk, Statistika
ORDER BY vahe_protsent DESC;



-- Samm 2: Leian, kui suure protsendi moodustab suve- ja talveperiood aastakäibest

WITH MyykideKoond AS (
    SELECT 
        SUM(total_price) AS kogu_aasta_tulu,
        SUM(CASE WHEN EXTRACT(MONTH FROM sale_date) IN (6, 7, 8) THEN total_price ELSE 0 END) AS suve_tulu,
        SUM(CASE WHEN EXTRACT(MONTH FROM sale_date) IN (12, 1, 2) THEN total_price ELSE 0 END) AS talve_tulu
    FROM sales
    WHERE store_location = 'Pärnu' -- Filtreerin ainult Pärnu poe andmed
)
SELECT 
    suve_tulu,
    talve_tulu,
    kogu_aasta_tulu,
    ROUND((suve_tulu / kogu_aasta_tulu) * 100, 2) AS suve_osakaal_protsentides,
    ROUND((talve_tulu / kogu_aasta_tulu) * 100, 2) AS talve_osakaal_protsentides
FROM MyykideKoond;

-- Vastus: 29% on suve- ja 26% on talveperioodi osakaal



-- Samm 3: Leian nii kuise müügitulu sesoonsuse kui ka hälbe perioodi keskmisest

WITH KuineMyyk AS (
    -- 1. Arvutan iga kuu kogukäibe
    SELECT 
        DATE_TRUNC('month', sale_date) AS kuu,
        SUM(total_price) AS kuu_tulu
    FROM sales
    WHERE store_location = 'Pärnu' -- Filtreerin Pärnu poe andmed
    GROUP BY 1
),
Statistika AS (
    -- 2. Arvutan kõigi kuude aritmeetilise keskmise
    SELECT 
        AVG(kuu_tulu) AS aasta_keskmine_kuu
    FROM KuineMyyk
)
-- 3. Leian vahe protsendi: ((Kuu tulu - Keskmine) / Keskmine) * 100
SELECT 
    kuu,
    ROUND(kuu_tulu, 2) AS kuu_kaive,
    ROUND(aasta_keskmine_kuu, 2) AS aasta_keskmine,
    ROUND(((kuu_tulu - aasta_keskmine_kuu) / aasta_keskmine_kuu) * 100, 2) AS vahe_protsent
FROM KuineMyyk, Statistika
ORDER BY kuu;



-- Samm 4: Leian TOP 5 toote protsentuaalse panuse Pärnu poe kogukäibest

WITH KoguKäive AS (
    -- 1. Arvutan esmalt poe kogukäibe
    SELECT SUM(total_price) AS summa_kokku 
    FROM sales 
    WHERE store_location = 'Pärnu'
),
TooteKäive AS (
    -- 2. Leian iga toote käibe ja ühendan nimedega
    SELECT 
        p.product_name,
        SUM(s.total_price) AS toote_summa
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    WHERE s.store_location = 'Pärnu'
    GROUP BY p.product_name
)
-- 3. Arvutan protsendid ja võtan TOP 5
SELECT 
    product_name,
    toote_summa,
    ROUND((toote_summa / (SELECT summa_kokku FROM KoguKäive)) * 100, 2) AS protsent_käibest
FROM TooteKäive
ORDER BY toote_summa DESC
LIMIT 5;



-- Samm 5: Kontrollin kasvumäära 2024 vs 2023

WITH AastaneMyyk AS (
    -- 1. Grupeerin müügitulu aastate kaupa
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS aasta,
        SUM(total_price) AS aasta_kaive
    FROM sales
    WHERE store_location = 'Pärnu' -- Filtreerin Pärnu poe andmed
    GROUP BY 1
),
Vordlus AS (
    -- 2. Kasutan LAG() funktsiooni, et tuua eelmise aasta väärtus praeguse kõrvale
    SELECT 
        aasta,
        aasta_kaive,
        LAG(aasta_kaive) OVER (ORDER BY aasta) AS eelmine_aasta
    FROM AastaneMyyk
)
-- 3. Arvutan kasvumäära valemiga: ((Uus - Vana) / Vana) * 100
SELECT 
    aasta,
    ROUND(aasta_kaive, 2) AS tulu_2024,
    ROUND(eelmine_aasta, 2) AS tulu_2023,
    ROUND(((aasta_kaive - eelmine_aasta) / eelmine_aasta) * 100, 2) AS kasvumaar_yoy
FROM Vordlus
WHERE aasta = 2024;

-- Vastus: Kasvumäär 2024. ja 2023. aasta võrdluses on 4,30%