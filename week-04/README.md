# Nädal 4: SQL Aggregation — numbritest äriotsusteni

## Mida ma tegin
- Õppisin kasutama `GROUP BY` lauset, et sorteerida tuhandeid UrbanStyle'i müügiridu loogilisteks üksusteks kuude, linnade ja tootekategooriate kaupa.
- KPI-de arvutamine: Rakendasid peamisi agregaatfunktsioone (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`), et leida ettevõtte olulisemad näitajad nagu kogukäive, keskmine tellimusväärtus (AOV) ja unikaalsete klientide arv.
- Kasutasin `HAVING` filtrit, et leida lahknevusi andmetes, näiteks tooteid, kus süsteemi ja füüsilise laoseisu vahe oli ebaloomulikult suur.
- Võtsin kasutusele CTE-d (*Common Table Expressions*), mis muutsid keerulised mitmeastmelised päringud (nt müügitrendid asukohtade kaupa) loetavaks ja kergesti hallatavaks.
- Õppisin kasutama aknafunktsioone (`OVER`, `ROW_NUMBER`, `LAG`), et luua pingeridu (TOP 3 toodet kategoorias) ja arvutada kuist kasvu, võrreldes eelmise perioodiga.
- Osalesin meeskonnatöös, kus ma analüüsisin müügi koondandmeid ja koostasin müügistatistika raporti.
- Vormistasin oma nädala töö GitHubi portfoolios.

## Peamised õppetunnid
- Mõistsin, et andmebaas filtreerib ridu (`WHERE`) enne grupeerimist, kuid gruppe (`HAVING`) alles pärast koondandmete arvutamist.
- Sain teada, kuidas agregaatfunktsioonid käituvad puuduvate andmetega (nt `AVG` ignoreerib NULL-e) ning kuidas `COALESCE` abil tagada arvutuste usaldusväärsus.
- Õppisin vahet tegema `GROUP BY` loogikal (mis koondab detailid üheks reaks) ja aknafunktsioonidel (mis lisavad koondväärtuse igale reale, säilitades detailse vaate).

## AI kasutamine
Kasutasin *NotebookLM*-i kui isiklikku õppekaaslast, et mõista süvitsi SQL-i aknafunktsioonide ja CTE-de keerulist loogikat. AI aitas mul debug’ida päringuid ning kontrollida, et `OVER()` ja `PARTITION BY` funktsioonid arvutaksid linnade käibeosakaale korrektselt.

## Failid
- **[week4_sales_aggregation.sql](individual/week4_sales_aggregation.sql)** – Müügi koondandmete SQL päringud koos selgitavate kommentaaridega

## Meeskonna töö
- **[week4_team_aggregation_report.md](team/week4_team_aggregation_report.md)** – meeskonna koondraport