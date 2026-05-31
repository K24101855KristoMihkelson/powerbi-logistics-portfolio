# Logistics Data Pipeline: SQL Server to Power BI

## 📌 Projekti eesmärk
Selle projekti eesmärk on demonstreerida "end-to-end" andmeahela loomist logistika- ja transpordisektori jaoks. Projekt hõlmab relatsioonilise SQL-andmebaasi nullist ülesehitamist, testandmete genereerimist ning otseühenduse loomist Power BI-ga, et visualiseerida reaalajas reaalajas saadetiste staatuseid ja autojuhtide koormust.

## 🗂️ Repositooriumi sisu
* `logistics_database.sql` - T-SQL skript andmebaasi tabelite loomiseks (DDL) ja testandmete sisestamiseks (DML).
* `Logistics_Dashboard.pbix` - Power BI aruanne koos valmis andmemudeli ja interaktiivsete visuaalidega.
* *(Siia lisa screenshot oma valmis Power BI töölauast)*

## 🛠️ Kasutatud tehnoloogiad ja arhitektuur
* **Andmebaas:** Microsoft SQL Server (SSMS)
* **Andmeanalüüs ja UI:** Power BI Desktop
* **Andmemudeli arhitektuur:** Täheskeem (Star Schema)
* **Päringukeeled:** SQL (T-SQL), DAX

## ⚙️ Projekti etapid ja tehniline teostus

### 1. Relatsioonilise andmebaasi loomine (SQL)
Loodi kolmest tabelist koosnev logistikasüsteemi vundament, mis kasutab korrektseid andmetüüpe ja automaatselt genereeritavaid identifikaatoreid (`IDENTITY(1,1)`).
* **Dimensioonitabelid:** `kliendid` ja `autojuhid` (Primary Keys).
* **Faktitabel:** `saadetised` (Foreign Keys seotud dimensioonidega).

### 2. Otseühendus ja andmemodelleerimine (Power BI)
* Loodi otseühendus (Import Mode) lokaalse SQL Serveri ja Power BI vahel, välistades vajaduse staatiliste Exceli/CSV failide järele.
* Ehitati välja **Star Schema** andmemudel, ühendades faktitabeli dimensioonitabelitega (1-to-many relationships). See võimaldab andmeid dünaamiliselt ristfiltreerida (näiteks filtreerida saadetiste kogukaalu konkreetse autojuhi nime järgi).

### 3. DAX Arvutused ja KPI-d (Key Performance Indicators)
Ettevõtte äriprotsesside monitoorimiseks loodi dünaamilised mõõdikud. 

**Kriitiliste saadetiste (Hilinenud) reaalajas lugemine:**
```dax
Hilinenud Saadetised = CALCULATE(COUNTROWS('saadetised'), 'saadetised'[staatus] = "Hilinenud")
```
**Funktsioon analüüsib faktitabelit ja eraldab automaatselt ainult need tellimused, mis vajavad logistikajuhi kohest tähelepanu.**

### 4. Visualiseerimine ja Äriaruandlus
#### Loodud interaktiivne töölaud (dashboard) sisaldab:
##### Tulpdiagramm (Clustered Column Chart): Analüüsib töötajate produktiivsust, summeerides laiali veetud kilogrammid autojuhtide lõikes.
##### Sõõrikdiagramm (Donut Chart): Annab visuaalse ülevaate logistika tervisest, jagades kogu laadungi staatuste (Tarnitud, Töötlemisel, Hilinenud jne) vahel.
##### KPI Kaardid (Card): Toovad esile kõige kriitilisemad numbrid (näiteks hilinenud pakkide koguarv) kiireks otsustamiseks.
***
See dokumentatsioon on tugev ja tehniliselt väga täpne. Kui sa laed GitHubi üles oma `.sql` faili, `.pbix` faili ja lisad selle `README.md` teksti koos pildiga oma lõplikust *dashboardist*, on sul portfoolios suurepärane näide praktilisest süsteemiarhitektuurist.
***
