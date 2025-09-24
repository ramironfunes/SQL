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

| File                                                        | Purpose                                            |
| ----------------------------------------------------------- | -------------------------------------------------- |
| `seed/init.sql`                                             | Demo database with valid + invalid records         |
| `checks/integrity/integrity_constraints_and_updates.sql`    | Constraints and updates to preserve data integrity |
| `checks/duplicates/check_duplicates_orders.sql`             | Detect duplicate rows/orders in a dataset          |
| `checks/reconciliation/reconciliation_customers_orders.sql` | Reconcile records between customers and orders     |
| `procedures/db_backup_script.sql`                           | Scripts for database backup/restore                |
| `procedures/stored_procedures_audit.sql`                    | Stored procedures for recurring validations        |
| `procedures/triggers_audit.sql`                             | Triggers to enforce business rules                 |
| `reports/sample_report.md`                                  | Example output/evidence of executed checks         |

🚀 Quick Start

Create the demo DB:

source seed/init.sql;


Run integrity checks:

source checks/integrity/integrity_constraints_and_updates.sql;


Run duplicate detection:

source checks/duplicates/check_duplicates_orders.sql;


Run reconciliation queries:

source checks/reconciliation/reconciliation_customers_orders.sql;



🛠️ Tech Stack

SQL Server

MySQL

PostgreSQL (queries are portable with small adjustments)

📈 Use Cases

Validating data integrity after migrations

Running quality checks in ETL/BI pipelines

Detecting duplicates and orphan records in production databases

Automating checks via stored procedures and triggers
