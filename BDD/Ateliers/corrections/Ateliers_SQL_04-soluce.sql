/* 1.Affichez le salaire Maximum, le salaire Minimum, la somme des salaires et le salaire moyen de tous les employs. Nommez les colonnes Maxi, Mini, Somme et Moyenne respectivement. Arrondissez les rsultats au nombre entier le plus proche. */

SELECT ROUND(MAX(salary), 0) AS "Maxi", 
	     ROUND(MIN(salary), 0) AS "Mini",
	     ROUND(SUM(salary), 0) AS "Somme", 
	     ROUND(AVG(salary), 0) AS "Moyenne"
FROM employees;

/

/* 2.Modifiez l'instruction prcdente pour afficher le salaire MAXimum, le salaire MINimum, la somme des salaires et le salaire moyen de chaque poste. */

SELECT job_id, 
	     ROUND(MAX(salary), 0) AS "MAXimum", 
	     ROUND(MIN(salary), 0) AS "MINimum",
	     ROUND(SUM(salary), 0) AS "Total", 
	     ROUND(AVG(salary), 0) AS "Moyenne"
FROM employees
GROUP BY job_id;

/

/* 3.Ecrivez une instruction pour afficher le nombre d'employs qui occupent le mme poste. */

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;

/

/* 4.Dterminez le nombre de managers, sans en afficher la liste. Nommez la colonne Nb Managers. Indice: utiliser la colonne MANAGER_ID. */

SELECT COUNT(distinct manager_id) AS "Nb Managers"
FROM employees;

/
/* 5.      Ecrivez une instruction qui affiche la diffrence entre le salaire MAXimum et le salaire MINimum. Nommez la colonne 'Diffrence'. */

SELECT MAX(salary) - MIN(salary) AS "Diffrence"
FROM employees;

/

/* 6.Affichez le numro du manager et le salaire du subordonn le moins bien pay de chaque manager. Excluez tout employ dont le manager n'est pas connu. Excluez tout groupe dans lequel le salaire MINimum est infrieur ou gal  6 000. Triez le rsultat dans l'ordre dcroissant des salaires. */

SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC;

/

/* 7. Ecrivez une instruction qui affiche le nom, le lieu, le nombre d'employs et le salaire moyen de chaque service. Nommez les colonnes 'Nom', 'Lieu', 'NB personnes' et 'Salaire moyen' respectivement. Arrondissez le salaire moyen  deux chiffres aprs la virgule. */

SELECT d.department_name AS "Nom", l.city AS "Lieu", COUNT(e.employee_id) AS "NB Personnes", TO_CHAR(ROUND(AVG(salary),2),'999999.00') AS "Salaire moyen"
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY d.department_name, l.city;

/

SELECT d.department_name AS "Nom", l.city AS "Lieu", COUNT(e.employee_id) AS "NB Personnes", TO_CHAR(ROUND(AVG(salary),2),'999999.00') AS "Salaire moyen"
FROM departments d, employees e, locations l
WHERE d.department_id = e.department_id
AND d.location_id = l.location_id
GROUP BY d.department_name, l.city;

/

/* 8.Crez une instruction qui affiche le nombre total d'employs puis qui recense, parmi ces employs, ceux qui ont t embauchs en 1995, 1996, 1997 et 1998. Nommez les colonnes de faon approprie. */

SELECT *
FROM (SELECT COUNT(*) AS "NB TOTAL de salaris" FROM employees) total,
      (SELECT COUNT(*) AS "1995" FROM employees WHERE hire_date LIKE '%1995%') an95,
      (SELECT COUNT(*) AS "1996" FROM employees WHERE hire_date LIKE '%1996%') an96,
      (SELECT COUNT(*) AS "1997" FROM employees WHERE hire_date LIKE '%1997%') an97,
      (SELECT COUNT(*) AS "1998" FROM employees WHERE hire_date LIKE '%1998%') an98;

/

SELECT
       (SELECT COUNT(*) FROM employees) total,
       (SELECT COUNT(*) AS "1995" FROM employees WHERE hire_date LIKE '%1995%') an95,
      (SELECT COUNT(*) AS "1996" FROM employees WHERE hire_date LIKE '%1996%') an96,
      (SELECT COUNT(*) AS "1997" FROM employees WHERE hire_date LIKE '%1997%') an97,
      (SELECT COUNT(*) AS "1998" FROM employees WHERE hire_date LIKE '%1998%') an98
FROM DUAL;


   
/* 9.Crez une instruction qui affiche chaque poste, le salaire par poste dans chacun des services 20, 50, 80 et 90, ainsi que le salaire total par poste. Nommez les colonnes de faon approprie. */
  


SELECT e.job_id,  
sum(IF(e.DEPARTMENT_ID = 20, e.salary, 0)) AS 'Dept 20' ,  
sum(IF(e.DEPARTMENT_ID = 50, e.salary, 0)) AS 'Dept 50' ,  
sum(IF(e.DEPARTMENT_ID = 80, e.salary, 0)) AS 'Dept 80' ,  
sum(IF(e.DEPARTMENT_ID = 90, e.salary, 0)) AS 'Dept 90' , 
sum(e.salary) AS 'Total' 
FROM employees e 
group by e.job_id 



/

-- Avec des jointures (pour l'exemple)
SELECT e.job_id,  sum(e20.salary) ,  sum(e50.salary),  sum(e80.salary),  sum(e90.salary) , sum(e.salary)
FROM employees e 
left join employees e20  ON e.employee_id = e20.employee_id AND e20.department_id = 20
left join employees e50  ON e.employee_id = e50.employee_id AND e50.department_id = 50
left join employees e80  ON e.employee_id = e80.employee_id AND e80.department_id = 80
left join employees e90  ON e.employee_id = e90.employee_id AND e90.department_id = 90
/*where e.DEPARTMENT_ID IN(20, 50, 80, 90)*/
group by e.job_id 



/
