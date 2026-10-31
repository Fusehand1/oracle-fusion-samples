# OIC: error handling and reprocessing pattern

A pattern for integrations that fail safely and can be resubmitted without duplicates.

## Flow

1. **Receive** the payload (REST trigger, scheduled file pickup or event).
2. **Log** a tracking record with a business key, for example the invoice or person number.
3. **Validate** mandatory fields and lookups. Send invalid records to an error table
   instead of failing the whole run.
4. **Call the target** (Fusion REST, SOAP or an FBDI/HDL file load).
5. **Record the outcome** against the tracking record: success, business error or technical error.
6. **Notify** on failures with the business key, error message and a link to the instance.

## Reprocessing

- Make each call **idempotent**: check whether the record already exists before creating it.
- Keep failed payloads so they can be **resubmitted** after the data is fixed.
- Use a **global fault handler** for anything unexpected, so nothing fails silently.

## Tracking fields

Business key, integration name, instance ID, status, error message, retry count, timestamps.
