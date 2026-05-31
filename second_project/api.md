# Power BI REST API Integratsioon: Statistikaameti Andmed

## 📌 Projekti eesmärk
Selle projekti eesmärk on demonstreerida Power BI võimekust luua otseühendus välise REST API-ga, laadida sisse masinloetavad JSON-andmed, teostada andmete puhastamine ja lahtipakkimine (parsing) Power Query abil ning luua interaktiivne andmemudel. 

Lahendus asendab staatilised Exceli/CSV failid automatiseeritud andmevooga, mis on kriitilise tähtsusega kaasaegsetes logistika- ja IT-süsteemides (nt TMS/WMS liidestused).

## 🛠️ Kasutatud tehnoloogiad
* **Tarkvara:** Power BI Desktop
* **Andmebaasi/Päringu keel:** Power Query (M)
* **Andmevahetus:** REST API, JSON
* **Allikas:** Eesti Statistikaameti avalik API

## ⚙️ Arhitektuur ja Andmevoog (Dokumentatsioon)

### 1. Andmeallika ühendus (Data Connection)
* **API Lõpp-punkt (Endpoint):** `https://andmed.stat.ee/api/v1/et/stat/KK11`
* **Autentimine:** Anonymous / Avalik (Basic päring)
* **Andmeformaat:** Toores JSON (JavaScript Object Notation)

*(Märkus: Suletud süsteemide, näiteks ettevõttesisese WMS-i ühendamisel, seadistatakse Power BI "Advanced" veebiühenduses HTTP päis `x-api-key` või `Authorization`, kuhu lisatakse turvavõti. Turvakaalutlustel reaalseid võtmeid repositooriumis ei hoita).*

### 2. Andmete töötlemine (Power Query ETL)
Kuna REST API tagastab andmed hierarhilises JSON-formaadis, rakendati Power Query Editoris järgmisi transformatsioone:
1. **Navigeerimine kihtides:** Süsteemi tagastatud `Record` struktuurist liiguti spetsiifilisse `variables` nimekirja (List).
2. **Loendi konverteerimine tabeliks:** `List` tüüpi andmed muudeti struktureeritud tabeliks (`Table.FromList`).
3. **Atribuutide laiendamine (Expand):** Dünaamiliste veergude (nt `variables.valueTexts`) lahtipakkimine uutele ridadele (`Expand to New Rows`), et muuta pakitud massiivid eraldiseisvateks andmepunktideks (Aastad, Maakonnad, Vanuserühmad).
4. **Andmetüüpide määratlemine:** Veergudele määrati korrektsed andmetüübid (Tekst), et tagada mudeli stabiilsus.

### 3. Andmemudel ja Visualiseerimine
* Puhastatud tabel imporditi Power BI andmemudelisse (Data View).
* Aruandluse vaates (Report View) loodi interaktiivne **Slicer (hierarhiline filter)**, mis kasutab lahtipakitud `title`, `variables.code` ja `variables.valueTexts` veerge, võimaldades andmeid filtreerida peamiste kategooriate (Aasta, Maakond, Vanuserühm) lõikes.

## 🚀 Kuidas projekti käivitada
1. Laadi alla repositooriumis olev `.pbix` fail.
2. Ava fail tarkvaras **Power BI Desktop**.
3. Ülemiselt menüüribalt vajuta **Refresh** (Värskenda), et Power BI teeks reaalajas uue päringu Statistikaameti serverisse ja laeks sisse kõige värskemad andmed.
4. Uuri Power Query Editori (Vajuta `Transform Data`), et näha detailseid JSON-i lahtipakkimise samme.
