## Nädal 7: Python Pandas — RFM kliendisegmenteerimine

### Minu roll 
Minu fookus oli RFM-analüüsi tulemuste visualiseerimisel ja andmeloo jutustamisel. Kasutasin Plotly teeki, et muuta tehnilised arvutused (R, F, M skoorid) arusaadavateks ärilisteks vaadeteks. Keskendusin sellele, et tehnilised RFM-skoorid ei jääks lihtsalt numbriteks, vaid saaksid konkreetse ärilise tähenduse. Minu ülesanne oli tagada, et graafikud vastaksid küsimusele "Ja mis siis?", aidates visuaalselt tuvastada kõige väärtuslikumad kliendid ja need, kes on ohus kaduda.

### Peamised leiud
- **VIP-klientide suur mõju:** Analüüs kinnitas, et väike grupp *VIP Champions* (skoor 13–15) genereerib ebaproportsionaalselt suure osa UrbanStyle’i kogukäibest, olles kriitiline sihtrühm lojaalsuse hoidmisel.
- **Kõrge väärtusega passiivsed kliendid:** Tuvastasime olulise *At-Risk* segmendi, kuhu kuuluvad varem kõrge sageduse ja kulutusega kliendid, kes pole aga viimastel kuudel ostnud. Selle avastuse tulemusena saab hakata suunatud "*win-back*" kampaaniaid korraldama.

### AI kasutamine
Kasutasin tehisintellekti abi mitmete funktsioonide ja meetodite selgitamisel. Näiteks `pd.qcut()` funktsiooni süntaksi ja `rank(method='first')` meetodi selgitamiseks, et lahendada korduvate väärtustega seotud vead sageduse skoorimisel. AI aitas süvitsi mõista ka seda, miks Recency skoorimine on vastupidine — väiksem päevade arv viimasest ostust peab andma kõrgema skoori (5), et peegeldada kliendi värskust. Samuti lisasin AI abiga graafikutele selgitavad annotatsioonid.

## Failid
- **[week7_rfm_visualization.ipynb](individual/week7_rfm_visualization.ipynb)** – grupitöö alaülesande roll D kood
- **[fig_1_screenshot.png](individual/fig_1_screenshot.png)** – kuvatõmmis alaülesande roll D diagrammist nr 1 
- **[fig_2_screenshot.png](individual/fig_2_screenshot.png)** – kuvatõmmis alaülesande roll D diagrammist nr 2 
- **[fig_3_screenshot.png](individual/fig_3_screenshot.png)** – kuvatõmmis alaülesande roll D diagrammist nr 3 

## Meeskonna töö
- **[week7_rfm_complete.ipynb](team/week7_rfm_complete.ipynb)** – meeskonna terviklik *notebook*