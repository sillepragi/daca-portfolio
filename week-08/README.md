## Nädal 8: Automatiseeritud *ETL Pipeline*

Nädala 8 eesmärk oli liikuda staatiliselt analüüsilt dünaamilise ja automatiseeritud süsteemi. Lõime ühiselt koos meeskonnaga UrbanStyle OÜ-le täieliku *pipeline*, mis asendab seni neli tundi nädalas võtnud manuaalse töö sekunditega mõõdetava automatiseeritud protsessiga.

### Minu roll – Andmete pärimine (*EXTRACT*)
Minu ülesandeks meeskonnas oli luua moodul `data_fetcher.py`, mis vastutab andmete hankimise eest otse Supabase REST API-st. 

**Peamised tegevused ja vastutus:**
*   **API-ühenduse loomine:** Seadistasin turvalise ühenduse Supabase SDK abil, tagades, et tundlikud API-võtmed on isoleeritud `.env` faili ja ei leki GitHubi.
*   **Dünaamiline filtreerimine:** Arendasin funktsioonid `fetch_sales` ja `fetch_customers`, mis võimaldavad pärida andmeid vastavalt soovitud kuupäevavahemikule (argumentidega `--start-date` ja `--end-date`).

### Meeskonna tulemuste kokkuvõte
Meeskonnatöö tulemusena sündis terviklik `pipeline.py`, mis ühendab kõik ETL etapid:

1.  **EXTRACT:** Minu moodul pärib värsked müügi- ja kliendiandmed.
2.  **TRANSFORM:** Andmed puhastatakse duplikaatidest (nt eemaldati üle 5000 korduva rea) ja arvutatakse kriitilised KPI-d.
3.  **LOAD:** Tulemused eksporditakse automaatselt ajatempliga CSV-failidesse ja luuakse interaktiivsed *Plotly* graafikud (HTML).

Süsteem on "tootmisvalmis" (*production-grade*), sisaldades detailset logimist (`pipeline.log`) ja andmekvaliteedi kontrolle igas etapis.

### AI kasutamine
**Kuidas AI aitas sel nädalal?**
Kasutasin tehisintellekti abi *Plotly* visualiseerimise koordinaatide debugimiseks (eriti `domain` parameetri seadistamisel) ning pandas agregeerimisfunktsioonide süntaksi kontrollimiseks.