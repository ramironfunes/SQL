# Logistics Data Quality SQL Kit 🗄️

This project contains **SQL scripts and stored procedures** designed to audit and ensure **data quality** in logistics and ERP systems.  
It simulates real-world checks I performed in projects with **WMS, Softland, and NAVIS integrations**.

---

## 📑 Project Overview
Data consistency is critical in logistics operations. This repository provides a toolkit to detect and prevent:
- 🔗 Orphan records (orders without customers, containers without bookings)
- 🔎 Duplicate transactions
- 📊 Stock reconciliation mismatches between operational and ERP systems
- ⏱️ Scheduled checks via stored procedures

---

## 📂 Folder Structure
- **/seed/** → SQL scripts to create a small demo database with both valid and invalid records.  
- **/checks/** → Queries grouped by type:
  - `integrity` → orphan keys, missing references
  - `duplicates` → duplicate orders, bookings
  - `reconciliation` → stock balance validation  
- **/procedures/** → Stored procedures for periodic data validation  
- **/reports/** → Example outputs (CSV/Markdown)  

---

## 🚀 Quick Start
1. Create the demo DB:
   ```sql
   source seed/init.sql;
