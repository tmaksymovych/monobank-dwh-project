# Data Warehouse Modeling (Monobank)

This project is a 3-layer data warehouse for the Monobank business case, built in BigQuery.

## 1. Business Case
The objective is to model transactions for Monobank to analyze customer spending, cashback, and demographics.

## 2. Layers & Architecture
The DWH uses a standard 3-layer architecture:
* **`raw_hordiienko`**: Ingests 5 raw data sources as-is (e.g., `raw.customers`).
* **`stage_hordiienko`**: Cleans and standardizes the data, casting all values to their proper types (e.g., `stage.customers`).
* **`mart_hordiienko`**: The final dimensional model (star schema) for analysis.

## 3. Dimensional Model (Star Schema)
The mart layer consists of 1 fact table and 3 dimension tables.

* **Fact Table:** `fct_transactions`
* **Dimensions:** `dim_customer`, `dim_date`, `dim_category`

## 4. Data Lineage
(Here, you will drag and drop the `data-lineage.png` image you created)
![Data Lineage](images/data-lineage.png)

## 5. How to Run
The SQL scripts in the `/sql/` folder must be run in numerical order:
1.  `01_create_raw.sql`
2.  `02_create_stage.sql`
3.  `03_create_mart.sql`
4.  `04_insert_raw_data.sql`
5.  `05_load_stage.sql`
6.  `06_load_mart.sql`
