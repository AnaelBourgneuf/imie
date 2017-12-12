/* 1.Écrivez une instruction SQL permettant d'afficher le nom, le numéro de service et le nom de service de tous les employés. */

SELECT e.last_name, e.department_id, d.department_name
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id;

/

SELECT e.last_name, e.department_id, d.department_name
FROM hr.employees e 
JOIN hr.departments d ON e.department_id = d.department_id;

/

/* 2.Créez une liste de tous les postes du service 80, avec une seule occurrence par poste. Faites apparaître l’emplacement du service dans le résultat. */

SELECT DISTINCT (e.job_id), d.location_id
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND e.department_id = 80;

/

SELECT  DISTINCT (e.job_id), d.location_id
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.department_id = 80;

/

/* Exemple avec les libellés nécessitant 4 tables */

SELECT DISTINCT (e.job_id), d.location_id, j.job_title, l.city
FROM hr.jobs j
INNER JOIN hr.employees e ON j.job_id = e.job_id
INNER JOIN hr.departments d ON e.department_id = d.department_id
INNER JOIN hr.locations l ON d.location_id = l.location_id
 WHERE e.department_id = 80;

/

SELECT DISTINCT e.job_id, d.location_id
FROM hr.employees e 
JOIN hr.departments d ON e.department_id = d.department_id
AND e.department_id = 80;

/

/* 3.Écrivez une instruction permettant d'afficher le nom, le nom du service, l'ID de lieu et la ville de tous les employés qui touchent une commission. */

SELECT e.last_name, d.department_name, d.location_id, l.city
FROM hr.employees e, hr.departments d, hr.locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.commission_pct IS NOT NULL;

/

SELECT e.last_name, d.department_name, d.location_id, l.city
FROM hr.employees e 
INNER JOIN hr.departments d ON e.department_id = d.department_id
INNER JOIN hr.locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

/

/* 4.Affichez le nom et le service de tous les employés dont le nom comporte un 'a'. */

SELECT e.last_name, d.department_name
FROM hr.employees e, hr.departments d
WHERE e.department_id = d.department_id
AND LOWER(e.last_name) LIKE '%a%';

/

SELECT e.last_name, d.department_name
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
WHERE LOWER(e.last_name) LIKE '%a%';

/

/* 5.Écrivez une instruction permettant d'afficher le nom, le poste, le numéro de service et le nom de service de tous les employés travaillant à Toronto. */

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM hr.employees e, hr.departments d, hr.locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.city = 'Toronto';

/

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM hr.employees e 
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

/

/* 6. Affichez le nom et le numéro de chaque employé ainsi que le nom et le numéro de son manager. Nommez les colonnes Employé, Emp#, Manager et Mgr#, respectivement. */

SELECT e.last_name AS "Employé", e.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM hr.employees e, hr.employees m
WHERE e.manager_id = m.employee_id;

/

/* 7.Affichez tous les employés, y compris ceux qui n'ont pas de manager. Triez les résultats par numéro d'employé. */

SELECT e.last_name AS "Employé", e.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM hr.employees e 
LEFT OUTER JOIN hr.employees m ON e.manager_id = m.employee_id
ORDER BY e.employee_id;

/

/* 8.Créez une instruction SQL permettant d'afficher le nom de chaque employé, son numéro de service et le nom de tous les employés qui travaillent dans le même service. Donnez à chaque colonne un intitulé approprié. */

SELECT  DISTINCT(e.department_id), e.last_name AS "Employé", e2.last_name AS "Collègues"
FROM hr.employees e, hr.employees e2
WHERE e.department_id = e2.department_id
AND e.employee_id <> e2.employee_id
ORDER BY e.department_id, e.last_name;

/

SELECT DISTINCT e.department_id, e.last_name AS "Employé", c.last_name AS "Collègues"
FROM hr.employees e 
JOIN hr.employees c ON e.department_id = c.department_id
WHERE e.employee_id <> c.employee_id
ORDER BY e.department_id;

/

/* 9.Affichez la structure de la table JOB_GRADES. Créez une instruction permettant d'afficher le nom, le poste, le service, le salaire et l’échelon de tous les employés. */

SELECT e.last_name, e.job_id, d.department_name, salary, j.grade_level
FROM hr.employees e, hr.departments d, hr.job_grades j
WHERE e.department_id = d.department_id
AND e.salary BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY j.grade_level;

/

SELECT e.last_name, e.job_id, d.department_name, j.grade_level
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY j.grade_level;

/

SELECT e.last_name, job_title, d.department_name, j.grade_level
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
JOIN hr.jobs ON e.job_id = jobs.job_id
ORDER BY j.grade_level;

/

/* 10.Créez une instruction permettant d'afficher le nom et la date d'embauche de tous les employés recrutés après l’employé Davies. */

SELECT e.last_name, e.hire_date
FROM hr.employees e, hr.employees d
WHERE d.last_name = 'Davies'
AND e.hire_date > d.hire_date;

/

SELECT e.last_name, e.hire_date
FROM hr.employees e 
JOIN hr.employees dav ON dav.last_name = 'Davies'
WHERE dav.hire_date < e.hire_date;

/

SELECT e.last_name, e.hire_date
FROM hr.employees e 
JOIN hr.employees dav ON dav.last_name = 'Davies' AND dav.hire_date < e.hire_date;

/* 11.Affichez le nom et la date d'embauche de tous les employés recrutés avant leur manager, ainsi que le nom et la date d'embauche de leur manager. Nommez les colonnes Employé, Emp Embauche, Manager et Mgr Embauche, respectivement. */

SELECT e.last_name AS "Employé", e.hire_date AS "Emp Embauche", m.last_name AS "Manager", m.hire_date AS "Mgr Embauche"
FROM hr.employees e, hr.employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;

/

SELECT e.last_name AS "Employé", e.hire_date AS "Emp Embauche", m.last_name AS "Manager", m.hire_date AS "Mgr Embauche"
FROM hr.employees e 
INNER JOIN hr.employees m
ON e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;