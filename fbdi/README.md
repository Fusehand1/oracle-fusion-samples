# File-Based Data Import (FBDI) checklist

A repeatable approach for Financials and SCM conversions.

1. **Get the right template.** Download the FBDI spreadsheet for your release from the
   Oracle Help Center (*File-Based Data Import for Oracle Fusion Cloud*).
2. **Map and sign off.** Keep a mapping workbook: source field, target column, transformation rule.
3. **Pre-validate in SQL.** Check mandatory fields, lookups, dates and duplicates before
   generating the CSV.
4. **Generate the ZIP** from the spreadsheet macro (or your own script) and upload it to UCM.
5. **Run the import jobs** in order: *Load Interface File for Import*, then the object's import process.
6. **Read the error output**, fix the source data and reload only the failed records.
7. **Reconcile** counts and amounts between source, interface tables and base tables.
