-- Nädal: 3      Meeskond: Turundusanalüüsi osakond     Roll: Müügikanalite efektiivsuse analüüs

-- Ülesanne on leida millised müügikanalid toovad enim müüke ja millised kliendid kasutavad milliseid kanaleid? Koostada tuleb müügikanalite analüüs.

-- 1. Vaatan, millised müügikanalid on olemas sales tabelis
SELECT DISTINCT channel 
FROM sales 
ORDER BY channel;
-- Olemas on kaks erinevat kanalit: online ja pood

-- 2. Milline kanal toob enim müüke?
SELECT
  s.channel AS müügikanal,
  COUNT(DISTINCT s.customer_id) AS kliente,
  COUNT(s.sale_id) AS oste,
  SUM(s.total_price) AS kogumüük
FROM sales s
GROUP BY s.channel
ORDER BY kogumüük DESC;
-- Enim müüke toob pood

-- 3. Millistest linnadest kliendid milliseid kanaleid kasutavad?
SELECT
  s.channel AS müügikanal,
  c.city AS linn,
  COUNT(DISTINCT c.customer_id) AS kliente,
  SUM(s.total_price) AS kogumüük
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY s.channel, c.city
ORDER BY müügikanal, kogumüük DESC;
-- Kõige enam kasutavad online kanalit Tallinnast, Tartust, Pärnust ja Narvast pärit inimesed. Kõige rohkem käivad poes Tallinnast, Tartust, Pärnust ja Narvast pärit inimesed.

-- Loen kokku klientide arvu (kes on ostnud) e-poes ja poes ehk milline kanal toob kõige rohkem kliente?
SELECT
  c.channel AS müügikanal,
  COUNT(DISTINCT c.customer_id) AS ostnud_klientide_arv
FROM customers s
INNER JOIN sales c ON c.customer_id = s.customer_id
GROUP BY c.channel
ORDER BY ostnud_klientide_arv DESC;
-- poest ostnud klientide arv on 2278 ja e-poest ostnud klientide arv on 1706.

-- 4. Millised tooted müüvad millises kanalis?
SELECT
  s.channel AS müügikanal,
  p.category AS tootekategooria,
  COUNT(DISTINCT c.customer_id) AS kliente,
  COUNT(s.sale_id) AS oste,
  SUM(s.total_price) AS kogumüük,
  ROUND(AVG(s.total_price), 2) AS keskmine_ost
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY s.channel, p.category
ORDER BY müügikanal, kogumüük DESC;
-- Online kanalis ostetakse kõige rohkem jalanõusid, meeste- ja naisteriideid. Poodides kohapeal ostetakse kõige rohkem meesteriideid, jalanõusid ja naisteriideid.

-- 5. Leian kõige efektiivsema kanali (müük per klient)
SELECT
  s.channel AS müügikanal,
  COUNT(DISTINCT s.customer_id) AS kliente,
  SUM(s.total_price) AS kogumüük,
  ROUND(SUM(s.total_price) / COUNT(DISTINCT s.customer_id), 2) AS müük_per_klient
FROM sales s
GROUP BY s.channel
ORDER BY müük_per_klient DESC;
-- Kõige efektiivsem kanal on pood, kus müük kliendi kohta on 835,13 eurot (onlines on müük kliendi kohta 590,12 eurot).

-- 6. Võrdlen kaupluseid - leian iga kaupluse müügikanalite jaotuse
SELECT
  s.store_location AS kauplus,
  s.channel AS müügikanal,
  COUNT(s.sale_id) AS oste,
  SUM(s.total_price) AS kogumüük,
  ROUND(SUM(s.total_price) / COUNT(s.sale_id), 2) AS keskmine_ost
FROM sales s
GROUP BY s.store_location, s.channel
ORDER BY kauplus, kogumüük DESC;

-- Tuletan meelde, palju oli ettevõtte kogukäive
SELECT SUM(total_price) AS kogukäive
FROM sales;
-- Ettevõtte kogukäive on 2 909 188,98 eurot

/* 

Kolm füüsililst kauplust toob umbes 60% (kogumüük 1 902 430,30 eurot) ja e-pood umbes 40% (kogumüük 1 006 747,68 eurot) kogukäibest.
Pärnu kauplus peaks rohkem online-müügile panustama, kuna Pärnu poe keskmine ost on madalaim. Turunduseelarvet peaks rohkem suunama online-müügile.


MÜÜGIKANALITE ANALÜÜSITULEMUS:

1) Enim müüke toovad füüsilised poed (e-poe kogumüük on 1 006 747,68 eurot ja poodide kogumüük on 1 902 430,30 eurot). Kolme kaupluse kogumüük moodustab umbes 60% ja e-poe kogumüük umbes 40% kogukäibest. 
2) Poest ostnud klientide arv on 2278 ja e-poest ostnud klientide arv on 1706 ehk pood toob ettevõttele enim kliente.
3) Kõige efektiivsem kanal on pood, kus müük kliendi kohta on 835,13 eurot (onlines on müük kliendi kohta 590,12 eurot). See viitab sellele, et e-pood ei täida veel oma täit potentsiaali.
4) Kõige enam kasutavad online kanalit Tallinnast, Tartust, Pärnust ja Narvast pärit inimesed. Kõige rohkem käivad poes samuti Tallinnast, Tartust, Pärnust ja Narvast pärit inimesed. Kuigi Narvas poodi hetkel ei ole, on sealt pärit üsna suur hulk kliente.

*/