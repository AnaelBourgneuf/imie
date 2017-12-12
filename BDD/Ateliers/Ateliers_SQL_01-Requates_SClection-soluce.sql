/* 1.Créer une requête destinée à afficher le nom, le salaire des employés gagnant plus de 12 000. */

SELECT last_name AS "Nom", salary Salaire
FROM  employees
WHERE salary > 12000;

/

/* 2.Créer une requête destinée à afficher le nom et le numéro de service de l’employé dont le numéro est 176. */

SELECT last_name, department_id
FROM  employees
WHERE employee_id = 176;

/

/* 3.Modifier la requête créée à l’étape 1 pour afficher les nom et le salaire de tous les employés dont le salaire n’est pas compris entre 5 000 et 12 000. */

SELECT last_name, salary
FROM  employees
WHERE salary NOT BETWEEN 5000 AND 12000;

/

/* 4.Affichez le nom, l’ID de poste et la date d’entrée des employés embauchés entre le 20 février et le 1er mai 1998. Classez le résultat par date d’embauche croissante. */

SELECT last_name, job_id, hire_date
FROM  employees
WHERE hire_date BETWEEN '1998-02-20' AND '98-05-1'
ORDER BY hire_date ASC;

/

/* 5.Affichez le nom et le numéro de service de tous les employés des services 20 et 50, classés par ordre alphabétique des noms. */

SELECT last_name, department_id
FROM  employees
WHERE department_id = 20
OR department_id = 50
ORDER BY last_name;

/

SELECT last_name, department_id
FROM  employees
WHERE department_id IN (20,50)
ORDER BY last_name;

/

/* 6. Faites une copie de la requête crée à l’étape 3. Modifiez la pour répertorier le nom et le salaire des employés qui gagnent entre 5 000 et 12 000 et qui appartiennent au service 20 ou 50. */

SELECT last_name AS "Employé", salary AS "Salaire"
FROM  employees
WHERE (department_id = 20 OR department_id = 50) 
/* WHERE department_id IN (20,50) */
AND salary BETWEEN 5000 AND 12000;

/

/* 7.Affichez le nom et la date d’embauche de chaque employé entré en 1994. */

SELECT last_name, hire_date
FROM  employees
WHERE hire_date LIKE '1994%';

/* WHERE hire_date BETWEEN '01/01/94' AND '31/12/94';
 /* WHERE TO_CHAR(hire_date,'YY') = '94'; */
 /* WHERE TO_CHAR(hire_date,'YYYY') = '1994'; */
 /* WHERE TO_CHAR(hire_date,'YEAR') = 'NINETEEN NINETY-FOUR'; */
 /* WHERE hire_date LIKE '%94' */
 /* WHERE hire_date LIKE '%/%/94'; */

/

/* 8.Affichez le nom et l’ID de poste de tous les employés qui n’ont pas de manager. */

SELECT last_name, job_id
FROM  employees
WHERE manager_id IS NULL;

/

/* 9.Affichez le nom, le salaire et la commission de tous les employés qui perçoivent des commissions. Triez les données dans l’ordre décroissant des salaires et des commissions. */

SELECT last_name, salary, CONCAT(commission_pct, ',00%') AS commission_pct
FROM  employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

/

/* 10.Affichez le nom de tous les employés dont la troisième lettre du nom est un 'a'. */

SELECT last_name
FROM  employees
/* WHERE LOWER(last_name) LIKE '__a%'; */ 
WHERE UPPER(SUBSTR(last_name,3,1)) = 'A';

/

/* 11.Affichez le nom de tous les employés dont le nom comporte un 'a' et un 'e'. */

SELECT last_name
FROM  employees
WHERE LOWER(last_name) LIKE '%a%'
AND LOWER(last_name) LIKE '%e%'; 
   
/* WHERE LOWER(last_name) LIKE '%a%e%' 
OR LOWER(last_name) LIKE '%e%a%'; */
       
SELECT last_name
FROM  employees
WHERE (INSTR(LOWER(last_name),'a') <> 0) 
AND (INSTR(LOWER(last_name),'e') <> 0);

/

/* 12.Affichez le nom, le poste et le salaire de tous les représentants ou magasiniers dont le salaire est différent de 2 500, 3 500 ou 7 000. */

SELECT last_name, job_id, salary
FROM  employees
WHERE (job_id LIKE '%CLERK' OR job_id LIKE '%REP')
AND salary NOT IN (2500, 3500, 7000);
       
/
