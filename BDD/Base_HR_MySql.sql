DROP TABLE IF EXISTS JOB_GRADES;
DROP TABLE IF EXISTS JOB_HISTORY;
DROP TABLE IF EXISTS LOCATIONS;
DROP TABLE IF EXISTS DEPARTMENTS;
DROP TABLE IF EXISTS COUNTRIES;
DROP TABLE IF EXISTS REGIONS;
DROP TABLE IF EXISTS EMPLOYEES;
DROP TABLE IF EXISTS JOBS;


  CREATE TABLE REGIONS 
   (	REGION_ID INTEGER,
		REGION_NAME VARCHAR(25)
   );
   
  CREATE TABLE  COUNTRIES  
   (	 COUNTRY_ID  CHAR(2), 
	 COUNTRY_NAME  VARCHAR(40), 
	 REGION_ID  INTEGER, 
	 CONSTRAINT  COUNTRY_C_ID_PK  PRIMARY KEY ( COUNTRY_ID )  
   );
 
  
  CREATE TABLE  LOCATIONS  
   (	 LOCATION_ID  INTEGER, 
	 STREET_ADDRESS  VARCHAR(40), 
	 POSTAL_CODE  VARCHAR(12), 
	 CITY  VARCHAR(30), 
	 STATE_PROVINCE  VARCHAR(25), 
	 COUNTRY_ID  CHAR(2)
   ) ;
 
  

  CREATE TABLE  DEPARTMENTS  
   (	 DEPARTMENT_ID  INTEGER, 
	 DEPARTMENT_NAME  VARCHAR(30), 
	 MANAGER_ID  INTEGER, 
	 LOCATION_ID  INTEGER
   ) ;

 
  CREATE TABLE  JOBS  
   (	 JOB_ID  VARCHAR(10), 
	 JOB_TITLE  VARCHAR(35), 
	 MIN_SALARY  INTEGER, 
	 MAX_SALARY  INTEGER
   ) ;

  CREATE TABLE  EMPLOYEES  
   (	 EMPLOYEE_ID  INTEGER, 
	 FIRST_NAME  VARCHAR(20), 
	 LAST_NAME  VARCHAR(25), 
	 EMAIL  VARCHAR(25), 
	 PHONE_INTEGER  VARCHAR(20), 
	 HIRE_DATE  DATE, 
	 JOB_ID  VARCHAR(10), 
	 SALARY  NUMERIC, 
	 COMMISSION_PCT INTEGER, 
	 MANAGER_ID  INTEGER, 
	 DEPARTMENT_ID  INTEGER
   ) ;
 
  
  CREATE TABLE  JOB_HISTORY  
   (	 EMPLOYEE_ID  INTEGER, 
	 START_DATE  DATE, 
	 END_DATE  DATE, 
	 JOB_ID  VARCHAR(10), 
	 DEPARTMENT_ID  INTEGER
   ) ;

   CREATE TABLE  JOB_GRADES 
   (     GRADE_LEVEL  VARCHAR(3),
     LOWEST_SAL   NUMERIC,
     HIGHEST_SAL  NUMERIC);
	
  


INSERT INTO REGIONS ( REGION_ID, REGION_NAME ) VALUES ( 
1, 'Europe'); 
INSERT INTO REGIONS ( REGION_ID, REGION_NAME ) VALUES ( 
2, 'Americas'); 
INSERT INTO REGIONS ( REGION_ID, REGION_NAME ) VALUES ( 
3, 'Asia'); 
INSERT INTO REGIONS ( REGION_ID, REGION_NAME ) VALUES ( 
4, 'Middle East and Africa'); 
INSERT INTO REGIONS ( REGION_ID, REGION_NAME ) VALUES ( 
5, 'Australian'); 
commit;

INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'AU', 'Australia', 5); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'BR', 'Brasilia', 2); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'CA', 'Canada', 2); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'CH', 'Swiss', 1); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'CN', 'China', 3); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'DE', 'Germany', 1); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'NL', 'Netherlands', 1); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'IN', 'India', 3); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'IT', 'Italia', 1); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'JP', 'Japan', 3); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'MX', 'Mexico', 2); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'SG', 'Singapore', 3); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'UK', 'United Kingdom', 1); 
INSERT INTO COUNTRIES ( COUNTRY_ID, COUNTRY_NAME, REGION_ID ) VALUES ( 
'US', 'United States of America', 2); 
commit;

INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1000, '1297 Via Cola di Rie', '00989', 'Roma', NULL, 'IT'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1100, '93091 Calle della Testa', '10934', 'Venice', NULL, 'IT'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1300, '9450 Kamiya-cho', '6823', 'Hiroshima', NULL, 'JP'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2000, '40-5-12 Laogianggen', '190518', 'Beijing', NULL, 'CN'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2300, '198 Clementi North', '540198', 'Singapore', NULL, 'SG'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2400, '8204 Arthur St', NULL, 'London', NULL, 'UK'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2600, '9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2800, 'Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL'); 
INSERT INTO LOCATIONS ( LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE,
COUNTRY_ID ) VALUES ( 
3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal,', 'MX'); 
commit;
 
INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,
LOCATION_ID ) VALUES ( 
10, 'Administration', 200, 1700); 
INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,
LOCATION_ID ) VALUES ( 
20, 'Marketing', 201, 1800); 
INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,
LOCATION_ID ) VALUES ( 
50, 'Shipping', 124, 1500); 
INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,
LOCATION_ID ) VALUES ( 
60, 'IT', 103, 1400); 
INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,
LOCATION_ID ) VALUES ( 
80, 'Sales', 149, 2500); 
INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,
LOCATION_ID ) VALUES ( 
90, 'Executive', 100, 1700); 
INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,
LOCATION_ID ) VALUES ( 
110, 'Accounting', 205, 1700); 
INSERT INTO DEPARTMENTS ( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,
LOCATION_ID ) VALUES ( 
190, 'Contracting', NULL, 1700); 
commit;

INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('AD_PRES','President',20000,40000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('AD_VP','Administration Vice President',15000,30000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('FI_MGR','Finance Manager',8200,16000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('FI_ACCOUNT','Accountant',4200,9000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('SA_MAN','Sales Manager',10000,20000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('SA_REP','Sales Representative',6000,12000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('PU_MAN','Purchasing Manager',8000,15000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('PU_CLERK','Purchasing Clerk',2500,5500);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('ST_MAN','Stock Manager',5500,8500);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('ST_CLERK','Stock Clerk',2000,5000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('SH_CLERK','Shipping Clerk',2500,5500);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('IT_PROG','Programmer',4000,10000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('MK_REP','Marketing Representative',4000,9000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('HR_REP','Human Resources Representative',4000,9000);
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) VALUES ('PR_REP','Public Relations Representative',4500,10500);

INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
100, 'Steven', 'King', 'SKING', '515.123.4567',  '1987/06/17'
, 'AD_PRES', 24000, NULL, NULL, 90); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568',  '1989/09/21'
, 'AD_VP', 17000, NULL, 100, 90); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569',  '1993/01/13'
, 'AD_VP', 17000, NULL, 100, 90); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567',  '1990/01/03'
, 'IT_PROG', 9000, NULL, 102, 60); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568',  '1991/05/21'
, 'IT_PROG', 6000, NULL, 103, 60); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567',  '1999/02/07'
, 'IT_PROG', 4200, NULL, 103, 60); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
114, 'Jordan', 'Mitoch', 'JMITOCH', '550.125.5564',  '1998/03/24'
, 'ST_CLERK', 2550, NULL, 124, 50); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
122, 'Dylan', 'Mijoro', 'DMIJORO', '350.133.5234',  '1999/01/01'
, 'ST_CLERK', 2500, NULL, 124, 50); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234',  '1999/11/16'
, 'ST_MAN', 5800, NULL, 100, 50); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009',  '1995/10/17'
, 'ST_CLERK', 3500, NULL, 124, 50); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994',  '1997/01/29'
, 'ST_CLERK', 3100, NULL, 124, 50); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
143, 'Randall', 'Matos', 'RMATOS', '650.121.2874',  '1998/03/15'
, 'ST_CLERK', 2600, NULL, 124, 50); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004',  '1998/07/09'
, 'ST_CLERK', 2500, NULL, 124, 50); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018',  '2000/01/29'
, 'SA_MAN', 10500, 20, 100, 80); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267',  '1996/05/11'
, 'SA_REP', 11000, 30, 149, 80); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265',  '1998/03/24'
, 'SA_REP', 8600, 20, 149, 80); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263',  '1999/05/24'
, 'SA_REP', 7000, 15, 149, NULL); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444',  '1987/09/17'
, 'AD_ASST', 4400, NULL, 101, 10); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555',  '1996/02/17'
, 'MK_MAN', 13000, NULL, 100, 20); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
202, 'Pat', 'Fay', 'PFAY', '603.123.6666',  '1997/08/17'
, 'MK_REP', 6000, NULL, 201, 20); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080',  '1994/06/07'
, 'AC_MGR', 12000, NULL, 101, 110); 
INSERT INTO EMPLOYEES ( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_INTEGER, HIRE_DATE, JOB_ID,
SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID ) VALUES ( 
206, 'William', 'Gietz', 'WGIETZ', '515.123.8181',  '1994/06/07'
, 'AC_ACCOUNT', 8300, NULL, 205, 110); 
commit;

INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
102,  '1993/01/13',  '1998/07/24'
, 'IT_PROG', 60); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
101,  '1989/09/21',  '1993/10/27'
, 'AC_ACCOUNT', 110); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
101,  '1993/10/28',  '1997/03/15'
, 'AC_MGR', 110); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
201,  '1996/02/17',  '1999/12/19'
, 'MK_REP', 20); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
114,  '1998/03/24',  '1999/12/31'
, 'ST_CLERK', 50); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
122,  '1999/01/01',  '1999/12/31'
, 'ST_CLERK', 50); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
200,  '1987/09/17',  '1993/06/17'
, 'AD_ASST', 90); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
176,  '1998/03/24',  '1998/12/31'
, 'SA_REP', 80); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
176,  '1999/01/01',  '1999/12/31'
, 'SA_MAN', 80); 
INSERT INTO JOB_HISTORY ( EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID,
DEPARTMENT_ID ) VALUES ( 
200,  '1994/07/01',  '1998/12/31'
, 'AC_ACCOUNT', 90); 
commit;

INSERT INTO JOB_GRADES ( GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL ) VALUES ( 
'A', 1000, 2999); 
INSERT INTO JOB_GRADES ( GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL ) VALUES ( 
'B', 3000, 5999); 
INSERT INTO JOB_GRADES ( GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL ) VALUES ( 
'C', 6000, 9999); 
INSERT INTO JOB_GRADES ( GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL ) VALUES ( 
'D', 10000, 14999); 
INSERT INTO JOB_GRADES ( GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL ) VALUES ( 
'E', 15000, 24999); 
INSERT INTO JOB_GRADES ( GRADE_LEVEL, LOWEST_SAL, HIGHEST_SAL ) VALUES ( 
'F', 25000, 40000); 
commit;

  
  ALTER TABLE  LOCATIONS  ADD CONSTRAINT  LOC_ID_PK  PRIMARY KEY ( LOCATION_ID )  ;
  ALTER TABLE  JOBS  ADD CONSTRAINT  JOB_ID_PK  PRIMARY KEY ( JOB_ID )  ;
  ALTER TABLE  JOB_GRADES  ADD CONSTRAINT  GRADE_LEVEL_PK  PRIMARY KEY ( GRADE_LEVEL )  ;
  ALTER TABLE  REGIONS  ADD CONSTRAINT  REG_ID_PK  PRIMARY KEY ( REGION_ID )  ;
  ALTER TABLE  EMPLOYEES  ADD CONSTRAINT  EMP_EMAIL_UK  UNIQUE ( EMAIL )  ;
  ALTER TABLE  EMPLOYEES  ADD CONSTRAINT  EMP_EMP_ID_PK  PRIMARY KEY ( EMPLOYEE_ID )  ;
  ALTER TABLE  EMPLOYEES  ADD CONSTRAINT  EMP_SALARY_MIN  CHECK (salary > 0)  ;
  ALTER TABLE  DEPARTMENTS  ADD CONSTRAINT  DEPT_ID_PK  PRIMARY KEY ( DEPARTMENT_ID )  ;
  ALTER TABLE  JOB_HISTORY  ADD CONSTRAINT  JHIST_DATE_INTERVAL  CHECK (end_date > start_date)  ;
  /*ALTER TABLE  JOB_HISTORY  ADD CONSTRAINT  JHIST_EMP_ID_ST_DATE_PK  PRIMARY KEY ( EMPLOYEE_ID ,  START_DATE )  ;*/
  ALTER TABLE  COUNTRIES  ADD CONSTRAINT  COUNTR_REG_FK  FOREIGN KEY ( REGION_ID )
	  REFERENCES  REGIONS  ( REGION_ID )  ;
  ALTER TABLE  DEPARTMENTS  ADD CONSTRAINT  DEPT_LOC_FK  FOREIGN KEY ( LOCATION_ID )
	  REFERENCES  LOCATIONS  ( LOCATION_ID )  ;
  ALTER TABLE  DEPARTMENTS  ADD CONSTRAINT  DEPT_MGR_FK  FOREIGN KEY ( MANAGER_ID )
	  REFERENCES  EMPLOYEES  ( EMPLOYEE_ID )  ;
  ALTER TABLE  EMPLOYEES  ADD CONSTRAINT  EMP_DEPT_FK  FOREIGN KEY ( DEPARTMENT_ID )
	  REFERENCES  DEPARTMENTS  ( DEPARTMENT_ID )  ;
  ALTER TABLE  EMPLOYEES  ADD CONSTRAINT  EMP_JOB_FK  FOREIGN KEY ( JOB_ID )
	  REFERENCES  JOBS  ( JOB_ID )  ;
  ALTER TABLE  EMPLOYEES  ADD CONSTRAINT  EMP_MANAGER_FK  FOREIGN KEY ( MANAGER_ID )
	  REFERENCES  EMPLOYEES  ( EMPLOYEE_ID )  ;
  ALTER TABLE  JOB_HISTORY  ADD CONSTRAINT  JHIST_DEPT_FK  FOREIGN KEY ( DEPARTMENT_ID )
	  REFERENCES  DEPARTMENTS  ( DEPARTMENT_ID )  ;
  ALTER TABLE  JOB_HISTORY  ADD CONSTRAINT  JHIST_EMP_FK  FOREIGN KEY ( EMPLOYEE_ID )
	  REFERENCES  EMPLOYEES  ( EMPLOYEE_ID )  ;
  ALTER TABLE  JOB_HISTORY  ADD CONSTRAINT  JHIST_JOB_FK  FOREIGN KEY ( JOB_ID )
	  REFERENCES  JOBS  ( JOB_ID )  ;
  ALTER TABLE  LOCATIONS  ADD CONSTRAINT  LOC_C_ID_FK  FOREIGN KEY ( COUNTRY_ID )
	  REFERENCES  COUNTRIES  ( COUNTRY_ID )  ;
  CREATE INDEX  LOC_STATE_PROVINCE_IX  ON  LOCATIONS  ( STATE_PROVINCE );
  CREATE INDEX  EMP_DEPARTMENT_IX  ON  EMPLOYEES  ( DEPARTMENT_ID );
  CREATE INDEX  EMP_NAME_IX  ON  EMPLOYEES  ( LAST_NAME ,  FIRST_NAME );
  CREATE INDEX  EMP_MANAGER_IX  ON  EMPLOYEES  ( MANAGER_ID );
  CREATE INDEX  DEPT_LOCATION_IX  ON  DEPARTMENTS  ( LOCATION_ID );
  CREATE INDEX  JHIST_DEPARTMENT_IX  ON  JOB_HISTORY  ( DEPARTMENT_ID );
  CREATE INDEX  JHIST_JOB_IX  ON  JOB_HISTORY  ( JOB_ID );
  CREATE INDEX  JHIST_EMPLOYEE_IX  ON  JOB_HISTORY  ( EMPLOYEE_ID );
  CREATE INDEX  LOC_COUNTRY_IX  ON  LOCATIONS  ( COUNTRY_ID );
  CREATE INDEX  EMP_JOB_IX  ON  EMPLOYEES  ( JOB_ID );
  CREATE INDEX  LOC_CITY_IX  ON  LOCATIONS  ( CITY );
