# Disainiotsused: UrbanStyle Investor Dashboard (Nädal 5)

Käesolev dokument selgitab UrbanStyle.ltd investor-dashboardi prototüübi loomisel tehtud disainiotsuseid. Dashboardi eesmärk on vastata tegevjuht neljale põhiküsimusele.

## 1. Paigutus ja hierarhia (F-muster)
Dashboard on üles ehitatud järgides inimaju loomupärast lugemismustrit (F-muster), kus olulisim info asub vasakul üleval.

*   **Ülemine rida (KPI kaardid):** Kuvatud on neli peamist mõõdikut (Kogutulu, Klientide arv, AOV, Kasv %). Need on peamised numbrid, mis annavad kohese ülevaate ettevõtte olukorrast.
*   **Keskne ala:** Müügitrendi joondiagramm hõlmab suurima pinna, kuna see vastab tegevjuhi kõige kriitilisemale küsimusele: "Kas me kasvame või sureme?".
*   **Alumine ala:** Toetavad graafikud (tooted ja asukohad) on paigutatud kõrvuti, et pakkuda detailsemat sissevaadet ilma peafookust segamata.

## 2. Diagrammitüüpide valik
Iga diagramm on valitud lähtuvalt andmete tüübist ja ärilisest eesmärgist:

*   **Joondiagramm (Müügitrend):** Valitud trendi näitamiseks ajas. Joon ühendab punktid, võimaldades silmal hetkega tuvastada kasvu ja hooajalisust (nt detsembri tippu).
*   **Horisontaalne tulpdiagramm (Müügikanalid):** Tulpdiagramm on parim valik müügikanalite omavaheliseks võrdlemiseks, kuna inimsilm suudab tulpade pikkusi eristada ja võrrelda palju täpsemalt kui näiteks sektordiagrammi nurki või pindalasid.
*   **Sektordiagramm (Asukohad):** Kasutatud osakaalu näitamiseks tervikust. Kuna kategooriaid on vähe, on see vaade selge ja intuitiivne.

## 3. Värvipsühholoogia ja järjepidevus
Kasutasin UrbanStyle'i ametlikku stiiliraamatut, et luua professionaalne ja usaldusväärne kuvand:

*   **Navy (#1A1A2E):** Tallinna esinduskaupluse ja positiivse kasvu märkimiseks. See peegeldab brändi jätkusuutlikkuse fookust.
*   **Teal (#009B8D):** Kanalite tähistamiseks.
*   **Halltoonid:** Vähemoluliste või väiksemate asukohtade (Pärnu) jaoks, et vähendada visuaalset müra ja hoida fookust olulisel.

## 4. Teksti joondus ja *"Data-Ink Ratio"*
Järgisin Edward Tufte'i põhimõtet, kus iga piksel peab edastama informatsiooni:

*   **Pealkirjade joondus:** Kõik pealkirjad on joondatud vasakule. See ühtib Z-lugemismustriga ja loob puhta vertikaalse joone.
*   **Müra vähendamine:** Eemaldatud on liigsed ruudustikujooned (*gridlines*) ja 3D-efektid, mis moonutaksid andmete tajumist.

## 5. Interaktiivsus (*cross-filtering*)
Dashboard toetab rist-filtreerimist. Klikkides näiteks Tallinna sektoril, filtreeruvad kõik teised graafikud reaalajas näitama ainult Tallinna andmeid.

## 6. Kokkuvõte
Dashboard on valmis, interaktiivne ja optimeeritud kiireteks äriotsusteks.