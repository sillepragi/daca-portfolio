# Nädal 6: *Investor Dashboard*: Andmelugu

## Mida ma tegin
Selle nädala eesmärk oli muuta 5. nädalal koostatud tehniline *dashboard* professionaalseks andmelooks, mis on suunatud UrbanStyle'i investoritele ja juhtkonnale. Projekti raames teostasin järgmised tegevused:

* **Strateegiline viimistlus:** Rakendasid *dashboard*-ile "Ja mis siis?" testi, tagades, et iga graafik vastaks konkreetsele äriküsimusele ja toetaks strateegilisi otsuseid.
* **Konteksti lisamine:** Lisasin joondiagrammidele annotatsioonid (nt suveperioodi mõju selgitamiseks) ning viitejooned kvartali eesmärkide visualiseerimiseks.
* **Juhtide kokkuvõte *(Executive Summary)*:** Koostasin *dashboard*-i ülaosasse kokkuvõtte, mis annab investorile 30 sekundiga ülevaate ettevõtte kasvust (+4% *YoY*) ja peamistest riskikohtadest.
* **Visuaalse hierarhia (F-muster):** Paigutasin kõige kriitilisemad KPI kaardid ja juhtide kokkuvõtte ekraani vasakusse ülanurka, arvestades inimeste loomulikku silmaliikumise mustrit info tarbimisel.

## Peamised õppetunnid
* **Lugu vs numbrid:** Mõistsin, et andmeanalüütiku väärtus ei seisne pelgalt numbrite raporteerimises, vaid võimes muuta need strateegilisteks andmelugudeks.
* **Visuaalne hierarhia:** Mõistsin F-mustri olulisust disainis – kõige kriitilisem info (KPI kaardid ja kokkuvõte) peab asuma vasakul üleval, et haarata tähelepanu koheselt.
* ***Data-Ink Ratio:*** Edward Tufte põhimõtteid järgides eemaldasin liigse "müra" (ruudustikujooned, 3D-efektid), et fookus jääks andmetele.
* **Interaktiivsus:** Õppisin kasutama *cross-filtering* funktsionaalsust, mis võimaldab sidusrühmadel andmetesse "kaevuda" ja leida vastuseid ilma analüütiku sekkumiseta.

## AI kasutamine
Selle nädala projektis oli NotebookLM ja teised AI tööriistad minu strateegilised abivahendid:
* **Kriitiline kontroll:** Rakendasin RAG (*Retrieval-Augmented Generation*) põhimõtet, kontrollides kõik AI pakutud järeldused üle UrbanStyle'i tegelike andmete ja õppematerjalide põhjal, et vältida vigu.
* **Andmeloo struktureerimine:** Kasutasin AI-d *"Setup-Conflict-Data-Resolution-Action"* raamistiku lihvimiseks, et minu esitlus oleks investoritele võimalikult veenev.

## Failid
- **[week6_executive_summary.md](individual/week6_executive_summary.md)** – Pärnu kaupluse lühikokkuvõte
- **[week6_Pärnu_narrative.md](individual/week6_Pärnu_narrative.md)** – Pärnu kaupluse andmelugu
- **[week6_Pärnu_dashboard_screenshot.png](individual/week6_Pärnu_dashboard_screenshot.png)** – Pärnu kaupluse *dashboard*-i kuvatõmmis
- **[week6_Pärnu_dashboard.pbix](individual/week6_Pärnu_dashboard.pbix)** – Pärnu kaupluse *dashboard*'i *Power BI* fail
- **[week6_Pärnu_dashboard.sql](individual/week6_Pärnu_dashboard.sql)** – Pärnu kaupluse SQL päringud koos selgitavate kommentaaridega

## Meeskonna töö
- **[week6_team_combined_view.md](team/week6_team_combined_view.md)** – meeskonna grupitöö koondvaade