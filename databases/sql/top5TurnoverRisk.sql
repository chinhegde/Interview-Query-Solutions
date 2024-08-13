-- https://www.interviewquery.com/questions/top-5-turnover-risk

select e.id as employee_id
from employees e 
join (
    select employee_id
    from projects
    where end_dt is not null
    group by employee_id
    having count(project_id) >= 3
) as t
on t.employee_id = e.id 
order by salary asc
limit 5