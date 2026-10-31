# BI Publisher queries

SQL data model queries for Oracle Fusion HCM, written in Oracle join syntax.

| File | Returns | Parameters |
|---|---|---|
| `hcm_active_assignments.sql` | Active primary employee assignments with job and department | `:p_as_of_date` (optional, defaults to today) |
| `hcm_new_hires_by_period.sql` | Employees hired in a date range | `:p_from_date`, `:p_to_date` |

## Notes

- `per_all_assignments_m` holds several rows per assignment. The filter
  `effective_latest_change = 'Y'` keeps one row per effective date.
- Date-effective tables (`_f`, `_m`) are always filtered on the as-of date.
- Data security: run these through a BI data model under a role with the right
  data access, so users only see the people they are allowed to see.
