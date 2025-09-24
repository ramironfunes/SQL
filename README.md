# Data Quality SQL Toolkit 🗄️

![SQL](https://img.shields.io/badge/SQL-Server%2FMySQL%2FPostgres-blue)
![Status](https://img.shields.io/badge/status-active-success)
![License](https://img.shields.io/badge/license-MIT-green)

This repository contains **SQL scripts, stored procedures, and triggers** designed to perform **data quality checks** in different database environments.  
It includes integrity validations, duplicate detection, reconciliation queries, and automation scripts.

---

## 📘 Project Overview

Ensuring data quality is critical in any information system. This toolkit provides practical scripts to:

- 🔗 **Detect orphan records** (missing references, invalid foreign keys)  
- 🔎 **Find duplicate transactions or rows**  
- 📊 **Perform reconciliation queries** between related tables  
- ⚙️ **Automate validations** with stored procedures and triggers  

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
