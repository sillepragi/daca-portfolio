-- Nädal: 2          Meeskond: Turundusanalüüsi osakond          Roll: Tooteandmete puhastaja (Product Data Cleaner)

-- Ülesanne on leida duplikaadid, NULL väärtused ja ebajärjekindlused products tabelis ning dokumenteerida probleemid.
-- Väljundiks on puhastamisraport (duplikaadid leitud, NULL-id leitud, formaadivead, soovitused) + SQL skript.

-- Loon test koopia
CREATE TABLE products_test AS
SELECT * 
FROM products;

-- Vaatan mitu rida on products_test tabelis - kas on sama palju ridu nagu products tabelis
SELECT COUNT(*) AS ridade_arv
FROM products_test;

SELECT COUNT(*) AS ridade_arv
FROM products;
-- Loodud products_test tabelis on kokku 362 rida ja klapib products tabeli ridade arvuga.

-- Leian tootenimede dublikaadid
SELECT 
  product_name, 
  COUNT(*) AS koopiate_arv
FROM products_test
GROUP BY product_name
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;
-- Kokku on 12 dublikaatset tootenime.

-- Dublikaatide koguarvu kontroll -- 12
SELECT COUNT(*) - COUNT(DISTINCT product_name) AS dublikaatide_arv_kokku
FROM products_test;

-- Millised konkreetsed read on dublikaadid
SELECT * FROM (
    SELECT
      product_id,
      product_name,
      category,
      subcategory,
      ROW_NUMBER () OVER (PARTITION BY product_name ORDER BY product_id) AS rn
    FROM products_test
) numbered
WHERE rn > 1;


-- Leian NULL väärtused kriitilistes väljades
-- Kõigepealt tuletan meelde, millised on tabeli veerud, et valida välja kriitilised väljad, mida analüüsida
SELECT *
FROM products_test
LIMIT 5;

SELECT
    COUNT(*) FILTER (WHERE product_name IS NULL OR product_name = '') AS null_nimi,
    COUNT(*) FILTER (WHERE category IS NULL OR category = '') AS null_kategooria,
    COUNT(*) FILTER (WHERE cost_price IS NULL) AS null_ostuhind,
    COUNT(*) FILTER (WHERE retail_price IS NULL) AS null_müügihind,
    COUNT(*) FILTER (WHERE supplier IS NULL OR supplier = '') AS null_tarnija
FROM products_test;
-- Leitud: 0 NULL nime, 0 NULL kategooriat, 0 NULL ostuhinda, 0 NULL müügihinda, 0 NULL tarnijat.

-- Kontrollin, kas on ebareaalseid hindu
-- Kas on negatiivseid ehk miinusmärgiga ostuhindu?
SELECT COUNT(*) AS negatiivne_ostuhind
FROM products_test
WHERE cost_price < 0;

-- Kas on negatiivseid ehk miinusmärgiga müügihindu?
SELECT COUNT(*) AS negatiivne_müügihind
FROM products_test
WHERE retail_price < 0;

-- Kas on äärmuslikke ostuhindu (> 1000€)?
SELECT 
  product_name, 
  cost_price
FROM products_test
WHERE cost_price > 1000
ORDER BY cost_price DESC;

-- Kas on äärmuslikke müügihindu (> 1000€)?
SELECT
  product_name,
  retail_price
FROM products_test
WHERE retail_price > 1000
ORDER BY retail_price DESC;

-- Leitud: 0 negatiivset hinda, 0 äärmuslikku hinda.

-- Kontrollin kategooriate järjekindlust (nimekuju erinevusi)
SELECT category, COUNT(*) AS arv
FROM products_test
GROUP BY category
ORDER BY category;
-- Leitud: 0 kategooriate formaadiviga


/* PUHASTAMISRAPORT:
1) 12 dublikaatset tootenime
2) 0 NULL väärtust kriitilistes väljades
3) 0 negatiivset või äärmuslikku hinda
4) 0 erinevat kategooriate nimekuju
5) 0 NULL kategooriat
KOKKU on 12 probleemset väärtust
Tooteanalüüsi mõjutab tootenimede dublikaadid. Tuleb puhastada tootenimed.
*/



-- Viin sisse puhastamise testtabelis products_test
-- Ühtlusta kategooriate nimed
UPDATE products_test
SET category = INITCAP(TRIM(category))
WHERE category != INITCAP(TRIM(category));

-- Kontrolli tulemust
SELECT category, COUNT(*) AS arv
FROM products_test
GROUP BY category ORDER BY category;
-- päringud tõestavad veelkord, et mitte ühtegi kategooriate nimevormide erinevust ei esine. Seega kategooriate veerg on puhas.

-- Puhastan products_test tabelis product_name dublikaadid
-- Enne kustutamist kirjutan üles ridade arvu. -- 362 rida
SELECT COUNT(*) AS enne FROM products_test;

-- Kustutan duplikaadid (jätan alles ainult esimese rea iga product_id kohta)

--SELECT *
--FROM products_test
DELETE FROM products_test
WHERE product_id NOT IN (
    SELECT MIN(product_id)
    FROM products_test
    GROUP BY product_name
);

-- Kontrollin tulemust
SELECT COUNT(*) AS ridu_pärast FROM products_test;

SELECT 362-350;
-- products_test tabelis on kokku 350 rida ehk 12 dublikaati on kustutatud.