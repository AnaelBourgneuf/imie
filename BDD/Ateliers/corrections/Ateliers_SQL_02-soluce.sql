/* 1.Créez une requète qui se contente d'afficher la date du jour. */

-- Oracle
SELECT SYSDATE "Date" FROM dual;

-- MySQL
SELECT CURRENT_DATE "Date" FROM dual;

/

/* 2.Affichez pour chaque employé le numéro, le nom, le salaire et le salaire augmenté de 15%. Nommez la nouvelle colonne 'Nouveau Salaire'. */

SELECT employee_id, last_name, salary, salary * 1.15 AS "Nouveau Salaire" 
FROM employees;

/

/* 3.Modifiez la requète précédente pour ajouter une colonne permettant de soustraire l'ancien salaire du nouveau. Nommez la nouvelle colonne 'Augmentation'. */

SELECT employee_id, last_name, salary, salary * 1.15 as "Nouveau Salaire", salary * 0.15 as "Augmentation"
FROM employees;

/

/* 4.Affichez le nom de chaque employé et calculez le nombre de mois écoulés entre la date du jour et la date d'embauche. Nommez la colonne 'Mois Travaillés'. Classez le résultat en fonction du nombre de mois d'ancienneté. Arrondissez le nombre de mois à l'entier le plus proche. */

-- Oracle
SELECT last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),0) AS "Mois travaillés"
FROM employees
ORDER BY "Mois travaillés";
 
-- MySQL
SELECT last_name, ROUND(TIMESTAMPDIFF(MONTH, hire_date, CURRENT_DATE),0) AS "Mois travaillés"
FROM employees
ORDER BY "Mois travaillés";

/

/* 5.Ecrivez une requète affichant dans une seule colonne l'information suivante :
    <Nom de l'employé> gagne <Salaire> par mois mais souhaiterait <salaire multiplié par 3>. 
    Nommez la colonne 'Salaire de rêve'. */

-- Oracle    
SELECT last_name || ' gagne ' || ROUND(salary,2) ||  ' $ par mois, mais souhaiterait ' || ROUND(salary * 3) || ' $.' AS "Salaire de rève"
FROM employees;

-- MySQL
SELECT CONCAT(last_name ,' gagne ', ROUND(salary,2),' $ par mois, mais souhaiterait ', ROUND(salary * 3) ,' $.') AS "Salaire de rêve"
FROM employees;


/

/* 6.Créez une requète permettant d'afficher le nom et le salaire de tous les employés. Le salaire devra comporter 15 caractères et les caractères de remplissage seront insérés à gauche sous forme de signes '$'. Nommez la colonne Salaire. */

SELECT last_name, LPAD(salary,15,'$') AS salaire
FROM employees;

/

/* 7.Affichez le nom et la date d'embauche de chaque employé ainsi que la date de révision du salaire, qui correspond au premier lundi aprés 6 mois d'activité. Nommez la colonne 'Révision'. Les dates devront apparaitre au format 'Mardi, le 30 Septembre 2003'. */

-- Oracle
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 1), 'fmDay", le "DD fmMonth YYYY') AS "Révision"
FROM employees;

-- MySQL
SELECT last_name, hire_date, date_format(DATE_ADD(hire_date, INTERVAL 6 MONTH),'%W, %d %M %Y') AS "Révision"
FROM employees;

/

/* 8.Affichez le nom de l'employé, sa date d'embauche ainsi que le jour de début d'activité. Nommez la colonne 'Jour'. Classez les résultats dans l'ordre des jours de la semaine à partir du lundi. */

-- Oracle
SELECT last_name, hire_date, TO_CHAR(hire_date, 'Day') AS "Jour"
FROM employees
ORDER BY TO_CHAR(hire_date, 'd');

-- MySQL
SELECT last_name, hire_date, date_format(hire_date, '%W') AS "Jour"
FROM employees
ORDER BY weekday(hire_date);

/

/* 9.Créez une instruction SQL permettant d'afficher le nom et le montant de la commission de chaque employé. Pour les employés ne touchant aucune commission, affichez "Pas de Commission". Nommez la colonne COMM. */

-- Oracle
SELECT last_name, NVL(TO_CHAR(salary * commission_pct), 'pas de commission') AS "COMM"
FROM employees;

-- MySQL
SELECT last_name, IFNULL(salary * commission_pct, 'pas de commission') AS "COMM"
FROM employees;

/

/* 10.Créez une instruction permettant d'afficher le nom des employés et leur salaire annuel sous forme d'astérisques. Chaque astérisque représente mille dollars. Triez les données dans l'ordre décroissant des salaires. Nommez la colonne "Employés et Salaires". */

-- Oracle
SELECT salary, last_name || RPAD( ' ', TRUNC(salary * 12 / 10000 + 1, 0), '*') AS "Employés et Salaires", TRUNC(salary * 12 / 10000, 0) AS "NB Asterisques" -- le + 1 pour l'espace 
FROM employees
ORDER BY salary DESC;

-- MySQL
SELECT CONCAT(salary,last_name, RPAD( ' ', TRUNCATE(salary * 12 / 10000 + 1, 0), '*')) AS "Employés et Salaires", TRUNCATE(salary * 12 / 10000, 0) AS "NB Asterisques" 
FROM employees
ORDER BY salary DESC;

/