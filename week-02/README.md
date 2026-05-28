# Nädal 2: *SQL Cleaning* -- UrbanStyle'i andmete puhastamine

## Mida ma tegin
- Õppisin, kuidas luua testkoopiaid tabelitest, kuidas leida ja eemaldada dublikaate, kasutades `GROUP BY` ja HAVING filtreid ning `ROW_NUMBER()` aknafunktsiooni.
- Samuti õppisin, kuidas asendada puuduvad väärtused (NULL) asendustekstiga, kasutades `COALESCE` funktsiooni ja `UPDATE` käsku.
- Valideerisin andmeid `CASE WHEN` funktsiooniga.
- Parandasin erinevate vormingutega väärtused, rakendades `TRIM` ja `INITCAP` funktsioone.
- Dokumenteerisin kõik tegevused ja muudatused.
- Osalesin meeskonnatöös, kus ma puhastasin tooteandmete tabelit.
- Vormistasin oma nädala töö *GitHub*i portfoolios.

## Peamised õppetunnid
- Võtsin kasutusele protsessi *Test*, *Verify*, *Log*, *Commit*, mis tagab, et ma ei muudaks kunagi algandmeid ilma neid kontrollimata ja logimata. Enne põhiandmete muutmist, tuleb kõik läbi teha test_koopias.
- SQL päringu täitmise järjekord on järgmine: `FROM` -> `WHERE` -> `GROUP BY` -> `HAVING` -> `SELECT` -> `ORDER BY` -> `LIMIT`.

## Failid
- **[week2_products_cleaning.sql](individual/week2_products_cleaning.sql)** – Tooteandmete puhastamise SQL päringud koos selgitavate kommentaaridega
- **[week2_products_report.md](individual/week2_products_report.md)** – puhastamisraport

## Meeskonna töö
- **[week2_team_cleaning_report.md](team/week2_team_cleaning_report.md)** – meeskonna koondraport