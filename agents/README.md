# Oracle AI Agent Studio: use-case designs

Design notes for agents built in Oracle AI Agent Studio for Fusion Applications.
Check feature availability in your release's documentation before building.

## Example: supplier invoice document to AP invoice

**Goal:** turn a supplier's invoice document into a draft Payables invoice for review.

| Step | What the agent does |
|---|---|
| 1. Read | Extracts supplier, invoice number, date, currency, lines and totals from the document |
| 2. Match | Finds the supplier and, where relevant, the purchase order |
| 3. Check | Flags duplicates, missing fields and totals that don't add up |
| 4. Draft | Creates the invoice for a person to review, never posting it automatically |
| 5. Explain | Summarises what it found and why anything was flagged |

**Guardrails**
- Acts only with the permissions of the user running it.
- A person approves every invoice before it is validated.
- Every extracted value can be traced back to the source document.

**Test scenarios:** clean invoice, duplicate invoice number, unknown supplier,
PO-matched invoice with a quantity difference, scanned or low-quality document.

## Other use cases

- Requisition to purchase order automation
- HR policy and self-service assistant for employees
- Extending Oracle-delivered agents
