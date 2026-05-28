# Nädal 3: SQL *JOIN*s -- UrbanStyle'i andmete ühendamine

## Mida ma tegin
- Õppisin ühendama erinevaid andmetabeleid (nt `customers`, `sales`, `products`), et leida seoseid, mis on peidus killustatud andmetes.
- Kasutasin erinevaid *JOIN*-tüüpe vastavalt ülesandele: *INNER JOIN* sobivate paaride leidmiseks ja *LEFT JOIN*, et tuvastada nö "vaimkliendid" ehk registreerunud kasutajad, kes pole kunagi ostnud.
- Ühendades korraga kolm või enam tabelit, et analüüsida tootekategooriate populaarsust erinevates linnades.
- Rakendasin tabelite aliaseid (nt s, c, p), et muuta keerukad päringud loetavamaks.
- Osalesin meeskonnatöös, kus ma analüüsisin müügikanalite efektiivsust ja koostasin sellekohase koondraporti.
- Vormistasin oma nädala töö *GitHub*i portfoolios.

## Peamised õppetunnid
- Sain selgeks vahe *Primary Key* (unikaalne tunnus tabelis) ja *Foreign Key* (viide teise tabeli unikaalsele tunnusele) vahel, mis on tabelite ühendamise alus.
- Mõistsin, kuidas erinevad *JOIN*-id filtreerivad tulemusi – *INNER JOIN* annab vaid kattuvuse, *LEFT JOIN* aga säilitab kogu vasakpoolse tabeli info.
- Mõistsin, kui oluline on tõlkida numbrid äriliseks oluliseks infoks – näiteks "kadunud klientide" leidmine võimaldab turundusel suunata neile täpselt sihilikke kampaaniaid (näiteks tervituskampaania koos sooduskupongiga).

## Failid
- **[week3_sales+customers+products_joins.sql](individual/week3_sales+customers+products_joins.sql)** – Müügikanalite efektiivsuse *JOIN*-analüüsi SQL päringud koos selgitavate kommentaaridega
- **[week_3_results_screenshot_nr_1.png](individual/week_3_results_screenshot_nr_1.png)** – kõige efektiivsema kanali tulemuse kuvatõmmis
- **[week_3_results_screenshot_nr_2.png](individual/week_3_results_screenshot_nr_2.png)** – kaupluste võrdluse tulemuse kuvatõmmis
- **[week_3_results_screenshot_nr_3.png](individual/week_3_results_screenshot_nr_3.png)** – müügi- ja kliendiandmete tabelite ühendamise tulemuse kuvatõmmis

## Meeskonna töö
- **[week3_team_summary.md](team/week3_team_summary.md)** – meeskonna koondväljund