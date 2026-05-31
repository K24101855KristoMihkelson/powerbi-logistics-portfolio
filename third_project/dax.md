# Power BI Data Pipeline & DAX Analytics

## 📌 Projekti eesmärk
Projekti eesmärgiks on demonstreerida kaasaegse andmevoo (Data Pipeline) ülesehitamist, ühendades Power BI otse välise süsteemi REST API-ga. Lahendus automatiseerib andmete pärimise, puhastamise ja visualiseerimise, asendades manuaalsed Exceli protsessid, mis on kriitilise tähtsusega efektiivsetes IT- ja logistikasüsteemides.

## 🛠️ Kasutatud tehnoloogiad ja oskused
* **Platvorm:** Power BI Desktop
* **Andmeallikas:** REST API (Avalik, JSON-formaat)
* **ETL Protsess:** Power Query (M-keel)
* **Andmeanalüüs:** DAX (Data Analysis Expressions)

## ⚙️ Projekti etapid ja lahenduse arhitektuur

### 1. API Integratsioon
* Loodi reaalajas otseühendus Statistikaameti API lõpp-punktiga (`https://andmed.stat.ee/api/v1/et/stat/KK11`).
* Kasutati automatiseeritud päringut (Basic Authentication), välistades vajaduse andmeid manuaalselt failidest laadida.

### 2. JSON Andmete puhastamine (Power Query)
API tagastas andmed mitmetasandilises masinloetavas JSON-struktuuris. Analüüsikõlbliku andmemudeli loomiseks teostati järgmised sammud:
* `Record` ja `List` andmestruktuuride navigeerimine.
* Pakitud andmemassiivide konverteerimine tabeliks (`To Table`).
* Hierarhiliste kategooriate (Aastad, Maakonnad, Vanuserühmad) lahtipakkimine eraldiseisvateks ridadeks ja veergudeks, kasutades `Expand to New Rows` funktsiooni.

### 3. DAX Arvutused ja Andmemudel
Sissetõmmatud andmestruktuuri peale ehitati dünaamilised mõõdikud (Measures), mis reageerivad automaatselt kasutaja valitud filtritele (Filtri kontekst). 

**Projekti käigus loodud peamised DAX valemid:**

**Ridade koguarvu tuvastamine:**
```dax
Kirjete Arv = COUNTROWS('RV069U')
```
**Unikaalsete kategooriate lugemine (SQL-i COUNT(DISTINCT) analoog):**
```dax
Unikaalsed Väärtused = DISTINCTCOUNT('RV069U'[variables.valueTexts])
```
**Spetsiifiliste tingimustega filtreerimine (SQL-i WHERE analoog):**
```dax
Ainult Mehed = CALCULATE(COUNTROWS('RV069U'), 'RV069U'[variables.valueTexts] = "Mehed")
```
### 4. Kasutajaliides (UI)

#### Andmemudelisse lisati interaktiivne hierarhiline filter (Slicer), 
#### mis võimaldab andmeid ja DAX-mõõdikute tulemusi detailselt filtreerida (Aasta, Maakond, jne) ilma baasandmeid muutmata.
#### Märkus: Tulevastes uuendustes on planeeritud lisada visuaalsed diagrammid (tulp- ja sektordiagrammid) 
#### ning reaalsed numbrilised aegread, et demonstreerida spetsiifilisi IT- või logistikatrende.

***

**Mida siin muudeti:**
* Lisasin kohe juurde terve sektsiooni **DAX arvutuste kohta**, pannes sisse need täpsed valemid, mis me koos läbi tegime. See annab koodile palju suurema väärtuse.
* Kirjutasin `README` lõppu väikese märkuse, et visuaalid (screenshotid ja graafikud) on plaanis lisada tulevikus. See näitab, et projekt on elus ja arenev, mis on GitHubis väga tavapärane ja hinnatud praktika.

