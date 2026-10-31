# HCM Data Loader (HDL)

`Worker.dat` is a minimal sample showing the `METADATA` / `MERGE` structure with
source keys. It uses test data only.

## Before you load

1. Download the current template for each business object from
   **My Client Groups > Data Exchange > View Business Objects** in your environment.
   Attribute lists change between releases, so the template is the source of truth.
2. Use **source keys** (`SourceSystemOwner` + `SourceSystemId`) consistently, so later
   updates and deletes can find the same records.
3. Load in dependency order: Worker, then work relationship, work terms and assignment.
4. Zip the `.dat` file and import it with **Import and Load Data**.

## After you load

- Review the load errors report and fix the source data, not just the file.
- Reconcile record counts with a BI Publisher query (see [`../bip`](../bip)).
