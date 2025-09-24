# Logistics Data Quality SQL Kit 🗄️

![SQL](https://img.shields.io/badge/SQL-Server%2FMySQL%2FPostgres-blue)
![Status](https://img.shields.io/badge/status-active-success)
![License](https://img.shields.io/badge/license-MIT-green)

This project contains **SQL scripts and stored procedures** designed to audit and ensure **data quality** in logistics and ERP systems.  
It simulates real-world checks I performed in projects with **WMS, Softland, and NAVIS integrations**.

---

## 📘 Project Overview

Data consistency is critical in logistics operations. This repository provides a toolkit to detect and prevent:

- 🔗 **Orphan records** (orders without customers, containers without bookings)  
- 🔎 **Duplicate transactions**  
- 📊 **Stock reconciliation mismatches** between operational and ERP systems  
- ⏱️ **Scheduled checks** via stored procedures  

---

## 📂 Folder Structure

```bash
data-quality-sql/
├─ seed/
│   └─ init.sql
├─ checks/
│   ├─ integrity/
│   │   └─ integrity_constraints_and_updates.sql
│   ├─ duplicates/
│   │   └─ check_duplicates_orders.sql
│   └─ reconciliation/
│       └─ reconciliation_customers_orders.sql
├─ procedures/
│   ├─ db_backup_script.sql
│   ├─ stored_procedures_audit.sql
│   └─ triggers_audit.sql
└─ reports/
    └─ sample_report.md
