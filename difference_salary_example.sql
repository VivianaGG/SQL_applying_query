select(select MAX(e.salary)
from db_employee e
join 
db_dept d ON e.department_id = d.id
where department = 'marketing'
group by d.department) -

(select MAX(e.salary)
from db_employee e
join 
db_dept d ON e.department_id = d.id
where department = 'engineering'
group by d.department) as difference
;