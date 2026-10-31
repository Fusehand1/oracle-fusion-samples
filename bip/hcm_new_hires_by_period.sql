-- Employees hired between two dates
-- Parameters: :p_from_date, :p_to_date
SELECT papf.person_number,
       ppnf.full_name,
       ppos.date_start              hire_date,
       paam.assignment_number
FROM   per_periods_of_service  ppos,
       per_all_people_f        papf,
       per_person_names_f      ppnf,
       per_all_assignments_m   paam
WHERE  ppos.period_type             = 'E'
AND    ppos.date_start BETWEEN :p_from_date AND :p_to_date
AND    papf.person_id               = ppos.person_id
AND    ppos.date_start BETWEEN papf.effective_start_date AND papf.effective_end_date
AND    ppnf.person_id               = papf.person_id
AND    ppnf.name_type               = 'GLOBAL'
AND    ppos.date_start BETWEEN ppnf.effective_start_date AND ppnf.effective_end_date
AND    paam.period_of_service_id    = ppos.period_of_service_id
AND    paam.assignment_type         = 'E'
AND    paam.primary_flag            = 'Y'
AND    paam.effective_latest_change = 'Y'
AND    ppos.date_start BETWEEN paam.effective_start_date AND paam.effective_end_date
ORDER  BY ppos.date_start, papf.person_number
