## 📊 Automated Logistics Data Pipeline & Dashboard

### 🎯 Project Overview
This project focuses on eliminating manual data entry and reducing human error in warehouse management systems (WMS). It replaces static Excel-based tracking with a fully automated, real-time analytical dashboard using Power BI.

### 💡 Technical Architecture
* **Automated Data Import (ETL):** Configured a local Folder Connection to automatically ingest, append, and combine new daily order CSV files without any manual intervention.
* **Data Modeling:** Designed a Star Schema architecture connecting a central fact table (Orders) with dimension tables (Customers, Inventory) using strict `1:*` relationships.
* **Custom DAX Metrics:** Developed custom formulas to dynamically calculate real-time available inventory (`Total Stock - Ordered Quantity`) reacting to active filter contexts.

### 🛠️ Technologies & Skills Demonstrated
* **Power BI Desktop:** Data Modeling, DAX, Power Query.
* **Data Processing:** CSV data extraction, cleaning, and transformation.
* **System Architecture:** Relational database principles, Primary/Foreign keys, and ETL automation.

### 🚀 How to Run This Project
1. Clone this repository or download the `.pbix` file.
2. Download the sample `.csv` data files into a local folder on your machine.
3. Open the Power BI file, go to Power Query, and update the folder path to match your local directory.
4. Hit `Refresh` to test the automated data pipeline.

