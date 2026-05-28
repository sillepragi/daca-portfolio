-- Nädal: 4      Meeskond: Turundusanalüüsi osakond     Roll: Müügi koondandmed (Sales Aggregation)

-- Ülesanne on koostada müügistatistika raport: kuu- ja kategooriapõhised koondnumbrid, kuised trendid. 

-- 1. Milline on 2024. aasta müük kuude kaupa?
SELECT
  DATE_TRUNC('month', sale_date) AS kuu,
  COUNT(sale_id) AS tellimuste_arv,
  SUM(total_price) AS kogukäive,
  ROUND(AVG(total_price), 2) AS keskmine_tellimus
FROM sales
WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY kogukäive DESC;   


-- 1. Milline on 2024. aasta müük kuude ja tootekategooriate kaupa
SELECT
  DATE_TRUNC('month', s.sale_date) AS kuu,
  p.category AS toote_kategooria,
  COUNT(s.sale_id) AS tellimuste_arv,
  ROUND(AVG(s.total_price), 2) AS keskmine_tellimus,
  SUM(s.total_price) AS kogukäive
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
WHERE DATE_TRUNC('month', sale_date) BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY DATE_TRUNC('month', sale_date), category
ORDER BY toote_kategooria, tellimuste_arv DESC;

-- Tulemus: 2024. aastal on aastane kogukäive tõusnud ligikaudu 100%. Kogukäive ja tellimuste arv on 2024. aastal kõige kõrgem detsembrikuus (550 tellimust) ja suvekuudel (aug, juuli, juuni). Kuna naiste rõivad (kleidid, pluusid jne) müük on kõige kõrgem detsembris, juunis ja augustis, siis saab järeldada, et suvine kollektsioon klapib hästi sihtrühmaga ning järgmistel aastatel tuleks suveks varuda just kergemaid ja jätkusuutlikke materjale, mida kliendid eelistavad. Suvekuude trend viitab sellele, et suunatud turunduskampaaniad on efektiivsed. Detsembrikuu tipp on ilmselt seotud pühade-eelse ostlemise ja kingituste tegemisega. Detsembri tipp näitab, et jõulukampaaniad on edukad.  Samuti peaks kaaluma sotsiaalmeedia eelarve suurendamist just nendel perioodidel, et maksimeerida oste.


-- 2. Milline on müük kategooriate kaupa?

SELECT
  p.category AS toote_kategooria,
  COUNT(DISTINCT p.product_id) AS toodete_arv,
  ROUND(AVG(s.unit_price), 2) AS keskmine_hind,
  SUM(s.quantity) AS müüdud_kogus,
  SUM(s.total_price) AS kogumüük
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
HAVING SUM(s.total_price) > 100000
ORDER BY müüdud_kogus DESC;

-- Leian ka kategooriate protsentuaalsed osakaalud ettevõtte kogukäibest:
SELECT 
    p.category AS kategooria,
    SUM(s.total_price) AS kategooria_tulu,
    ROUND(
        (SUM(s.total_price) / SUM(SUM(s.total_price)) OVER()) * 100, 
        2
    ) AS protsent_kogukäibest
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY protsent_kogukäibest DESC;

-- Tulemus: Peamise tuluallika toob sisse jalanõude, meesteriiete ja naisteriiete kategooriad. Jalanõude kategooria osakaal kogu ettevõtte käibest on 27%, meesteriiete osakaal on 26% ja naisteriiete osakaal on 24%. 


-- 3. Milline on 2024. aasta kuust-kuusse muutus?

WITH kuu_myyk AS (
    SELECT
      DATE_TRUNC('month', sale_date) AS kuu,
      SUM(total_price) AS käive
    FROM sales
    WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31'
    GROUP BY DATE_TRUNC('month', sale_date)
    )
SELECT
  kuu,
  käive,
  LAG(käive) OVER (ORDER BY kuu) AS eelmine_kuu,
  käive - LAG(käive) OVER (ORDER BY kuu) AS muutus
FROM kuu_myyk
ORDER BY muutus DESC;

/* 
Tulemus:
Kuigi 2024. aasta üldine areng on stabiilne, täheldasin teisel poolaastal (augustis, septembris ja novembris) mõõdukat kuu-põhist käibelangust, ehk neil kuudel käive langes eelmise kuuga võrreldes, mis on tõenäoliselt tingitud suvise kõrghooaja lõppemisest. Mistõttu peaks rõhku panema suvelõpu ja sügise alguse turunduskampaaniatele, näiteks nagu "koolimineku soodustused" vms. Samuti soovitan analüüsida, kas novembri langust saaks tulevikus leevendada varasema jõulukampaania alustamisega.
Kuu trendi vaadates on näha, et detsembrikuu jõulukampaania on väga efektiivne, kuna detsembrikuu käive tõusis 54%, võrreldes novembrikuu käibega. Samuti suur käibe tõus tähendab ka vajadust vaadata enne detsembrikuud üle lao seisud, et vältida toodete ootamatut lõppemist.
Käibelangus neil kolmel kuul võib olla tingitud ka laoseisu ja varude probleemist. Ehk kui näiteks populaarseid tooteid ei tarnita õigeaegselt juurde, siis langeb nii tehingute arv kui ka käive võrreldes eelmise kuuga. Seega tuleb kontrollida laoseisu ja reaalset olukorda (palju on reaalselt tooteid laos olemas), et saaks vajadusel laoseisu täiendada.
*/


-- 4. Milline on 2024. aasta kuust-kuusse kasvu protsent?

WITH kuu_müük AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS kuu,
        SUM(total_price) AS käive
    FROM sales
    WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31'
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    kuu,
    käive,
    LAG(käive) OVER (ORDER BY kuu) AS eelmine_kuu,
    ROUND(((käive - LAG(käive) OVER (ORDER BY kuu)) / LAG(käive) OVER (ORDER BY kuu)) * 100, 1) AS kasvu_protsent
FROM kuu_müük
ORDER BY kasvu_protsent DESC;

-- Tulemus: On näha, et kõige kõrgem kuu-põhine kasvuprotsent on 2024. aasta detsembrikuu (u 54%) ja kõige madalam on kasvuprotsent septembrikuus (u -25%).


/*

Müügi koondandmed — 
* Aastane käibe kasv (2024. aastal): 100%, mis kinnitab ettevõtte kiiret laienemist ja ärimudeli toimimist.

* Keskmine tellimusväärtus (2024. a): 
kõrgeim oktooberis 326€
madalaim märtsis 266€

* Kuu-põhine käibe kasv (2024. a):
kõrgeim detsembrikuus 54%
madalaim septembris -25%

* TOP kategooriate osakaal käibest:		     toote keskmine hind:
jalanõud 27%						                                216€
meesteriided 26%		                                  			190€
naisteriided 24%				                                   	200€

*/