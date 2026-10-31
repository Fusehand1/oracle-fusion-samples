-- Active primary employee assignments with job and department
-- Parameter: :p_as_of_date (optional; defaults to today)
SELECT papf.person_number,
       ppnf.full_name,
       paam.assignment_number,
       pjf.name                     job_name,
       haou.name                    department_name,
       paam.assignment_status_type
FROM   per_all_people_f               papf,
       per_person_names_f             ppnf,
       per_all_assignments_m          paam,
       per_jobs_f_vl                  pjf,
       hr_all_organization_units_f_vl haou
WHERE  ppnf.person_id               = papf.person_id
AND    ppnf.name_type               = 'GLOBAL'
AND    paam.person_id               = papf.person_id
AND    paam.assignment_type         = 'E'
AND    paam.primary_flag            = 'Y'
AND    paam.effective_latest_change = 'Y'
AND    paam.assignment_status_type  = 'ACTIVE'
AND    pjf.job_id (+)               = paam.job_id
AND    haou.organization_id (+)     = paam.organization_id
AND    NVL(:p_as_of_date, TRUNC(SYSDATE)) BETWEEN papf.effective_start_date AND papf.effective_end_date
AND    NVL(:p_as_of_date, TRUNC(SYSDATE)) BETWEEN ppnf.effective_start_date AND ppnf.effective_end_date
AND    NVL(:p_as_of_date, TRUNC(SYSDATE)) BETWEEN paam.effective_start_date AND paam.effective_end_date
AND    NVL(:p_as_of_date, TRUNC(SYSDATE)) BETWEEN pjf.effective_start_date (+) AND pjf.effective_end_date (+)
AND    NVL(:p_as_of_date, TRUNC(SYSDATE)) BETWEEN haou.effective_start_date (+) AND haou.effective_end_date (+)
ORDER  BY papf.person_number
