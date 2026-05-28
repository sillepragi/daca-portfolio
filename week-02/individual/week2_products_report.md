# UrbanStyle puhastamisraport: Nädal 2

## Tooteandmete puhastamisraport

Teostasin põhjaliku kontrolli testtabelis `products_test` ja tuvastasin järgmise olukorra:

| Kontrollpunkt | Tulemus | Seisund |
| :--- | :---: | :--- |
| **1. Dublikaatsed tootenimed** | **12** | 🟢 **Puhastatud** |
| 2. NULL väärtused kriitilistes väljades | 0 | 🟢 Korras |
| 3. Negatiivsed või äärmuslikud hinnad | 0 | 🟢 Korras |
| 4. Kategooriate nimevormingu erinevused | 0 | 🟢 Korras |
| 5. NULL väärtusega kategooriad | 0 | 🟢 Korras |
| **KOKKU PROBLEEME** | **12** | |

**Järeldus:** Tooteanalüüsi mõjutavad peamiselt tootenimede duplikaadid.

## Teostatud puhastustegevused

### Duplikaatide eemaldamine
Kustutasin 12 dublikaatset rida, jättes alles vaid iga tootenime esimese esinemise (`product_id` alusel). Tulemuseks on products_test tabelis 350 rida ilma dublikaatideta. Kasutasin selleks `DELETE` päringut:

```sql

DELETE FROM products_test
WHERE product_id NOT IN (
    SELECT MIN(product_id)
    FROM products_test
    GROUP BY product_name
);
