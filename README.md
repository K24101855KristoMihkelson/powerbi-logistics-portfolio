## 📊 Logistics IT & Data Automation Portfolio

Welcome to my GitHub repository. This space is dedicated to my practical projects focusing on IT systems, data automation, and logistics infrastructure.

### 👨‍💻 About Me
I am Kristo Mihkelson, a second-year Logistics IT Systems Junior Specialist student at Tallinna Tööstushariduskeskus (TTHK). I specialize in bridging the gap between physical logistics operations and digital IT infrastructure. Currently, I am actively seeking a full-time Logistics IT or System Administration internship in Tallinn for the summer of 2026.

---

## 📦 Project: Automated Logistics Data Pipeline & Dashboard

### 🎯 Business Problem
Manual data entry and Excel-based tracking in warehouse management systems (WMS) often lead to human errors and outdated information. Logistics managers need real-time visibility into physical inventory versus active orders to calculate true available stock efficiently.

### 💡 Technical Solution
I built a fully automated ETL (Extract, Transform, Load) pipeline and a dynamic monitoring dashboard using Power BI to eliminate manual data handling.

* **Automated Data Import:** Configured a local Folder Connection to automatically ingest, append, and combine new daily order CSV files without manual intervention.
* **Data Modeling:** Designed a Star Schema architecture with a central fact table (Orders) and dimension tables (Customers, Inventory) using strict `1:*` relationships.
* **Custom DAX Metrics:** Wrote logic formulas to calculate real-time available inventory (`Total Stock - Ordered Quantity`) based on active filter contexts.
* **Interactive Dashboard:** Created visual KPIs and regional slicers for instant supply and demand analysis.

### 🛠️ Technologies Used
* **Power BI Desktop:** Data Modeling, DAX, Power Query
* **Data Sources:** CSV / Excel (simulating WMS data exports)
* **Architecture:** Star Schema, ETL Automation, Relational Databases

### 🚀 How to View This Project
1. Download the `.pbix` file from this repository.
2. Download the sample `.csv` data files into a local folder.
3. Update the folder path in Power Query to match your local directory to test the automated `Refresh` capability.
