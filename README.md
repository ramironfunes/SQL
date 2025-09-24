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


📑 Scripts Index
File	Purpose
seed/init.sql	Demo database with valid + invalid records
checks/integrity/integrity_constraints_and_updates.sql	Enforce constraints and updates to preserve data integrity
checks/duplicates/check_duplicates_orders.sql	Detect duplicate orders in the dataset
checks/reconciliation/reconciliation_customers_orders.sql	Reconcile customer and order records
procedures/db_backup_script.sql	Backup and restore database scripts
procedures/stored_procedures_audit.sql	Stored procedures for automated audits
procedures/triggers_audit.sql	Triggers to enforce business rules on insert/update
reports/sample_report.md	Example of outputs/evidence from executed checks

![SQL](https://img.shields.io/badge/SQL-Server%2FMySQL%2FPostgres-blue)
![Status](https://img.shields.io/badge/status-active-success)
![License](https://img.shields.io/badge/license-MIT-green)
