

--start
(1)
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%A%' OR LAST_NAME LIKE '%A';
SELECT * FROM EMPLOYEES WHERE LAST_NAME LIKE '%e_';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '_l%';
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '_l%' AND FIRST_NAME LIKE  '___n%';
(2)
create user P230573_Lab03 identified by abc123;
grant All PRIVILEGES to P230573_Lab03;
(3)
create table Employees(

 Employee_id INT,
 Full_Name VARCHAR(100) ,
 Salary INT,
 Department_id INT,
 Start_Date DATE,
 End_Date DATE,
 Married VARCHAR(3),
 Phone_No VARCHAR(11)
);
(4)
create table Departments(
   Department_id INT,
   Department_name VARCHAR(20),
   Department_code VARCHAR(10),
   Date_Founded DATE
);
(5)
ALTER TABLE DEPARTMENTS ADD CONSTRAINT UNIQUE_DEP_NAME  UNIQUE (DEPARTMENT_NAME),ADD CONSTRAINT CHECK_DATE_FOUNDED CHECK (DATE_FOUNDED > TO_DATE('2000-01-01', 'YYYY-MM-DD'));
(6)
alter table departments ADD CONSTRAINT PRIM_KEY PRIMARY KEY(department_ID);
(7)
ALTER TABLE EMPLOYEES ADD CONSTRAINT FOREIGN_KEY FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID);
(8)
insert INTO DEPARTMENTS(DEPARTMENT_ID,DEPARTMENT_NAME,DEPARTMENT_CODE,DATE_FOUNDED)
VALUES(105,'Support',930,TO_DATE('2001-01-20', 'YYYY-MM-DD'));

INSERT INTO EMPLOYEES (EMPLOYEE_ID,DEPARTMENT_ID,FULL_NAME,SALARY,START_DATE,END_DATE,
MARRIED,PHONE_NO) VALUES (5,105,'saleeem',78000,TO_DATE('2000-3-1','YYYY-MM-DD'),
null,'yes','654654');
(9)
ALTER TABLE DEPARTMENTS ADD SPECIALITY VARCHAR(30) DEFAULT 'None';
(10)
CREATE table jobs(
    job_ID int,
    jbo_title varchar(40),
    min_salary int,
    max_salary int
);
(11)
ALTER TABLE JOBS  MODIFY JOB_ID INT NOT NULL, ADD CONSTRAINT JOB_ID_PRI PRIMARY KEY (JOB_ID);
(12)
ALTER TABLE EMPLOYEES MODIFY EMPLOYEE_ID NOT NULL;
ALTER TABLE EMPLOYEES ADD CONSTRAINT Pk_EMP_ID PRIMARY KEY(EMPLOYEE_ID);

ALTER TABLE JOBS ADD EMPLOYEE_ID INT;
ALTER TABLE JOBS ADD CONSTRAINT FOREIGN_KEY_IN_JOBS 
FOREIGN KEY(EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID);

(13)
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY,EMPLOYEE_ID) VALUES (3,'MANAGER',500,500000,2);
(14)
ALTER TABLE DEPARTMENTS DROP COLUMN SPECIALITY;
(15)
TRUNCATE TABLE JOBS;
(16)
INSERT INTO JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY,EMPLOYEE_ID) VALUES (4,'Finance Manager',8200,160000,5);
(17) 
update EMPLOYEES set full_name = upper(FULL_NAME);    
-- update the fullname to the capital

ALTER TABLE EMPLOYEES  ADD CONSTRAINT CHECK_FULL_NAME CHECK 
(FULL_NAME = UPPER(FULL_NAME));

(18)
ALter table employees modify phone_no unique not null;
(19)
insert into employees (EMPLOYEE_ID,full_name,salary,department_id,start_date,end_date,married,phone_NO)values(6,'ABDULLAH',90000,105,TO_DATE('2020-11-18', 'YYYY-MM-DD'),NULL,'NO',3000000);
(20)
UPDATE EMPLOYEES SET SALARY = SALARY*3 WHERE SALARY < 1000; 
(21)
ALTER TABLE EMPLOYEES RENAME COLUMN PHONE_NO TO PHONE_NUMBER;
ALTER TABLE JOBS DROP CONSTRAINT FOREIGN_KEY_IN_JOBS;
RENAME JOBS TO  job_details;

ALTER TABLE JOB_DETAILS ADD CONSTRAINT FOREIGN_KEY_IN_JOBS_ID FOREIGN KEY (EMPLOYEE_ID) REFERENCES 
EMPLOYEES (EMPLOYEE_ID);

(22)
ALTER TABLE EMPLOYEES ADD CONSTRAINT COMPOSITE_PRIM_KEY PRIMARY KEY(EMPLOYEE_ID,JOB_ID);
--THIS ERROR MEANS THAT JOB_ID DOES NOT EXIST IN THE EMPLOYEES TABLE

(23)

ALTER TABLE JOB_DETAILS ADD STARTING_YEAR INT;
UPDATE JOB_DETAILS SET STARTING_YEAR = 1889 WHERE JOB_ID = 3;

DELETE FROM JOB_DETAILS WHERE STARTING_YEAR < 1900;

(24)
DROP TABLE JOB_DETAILS;
(25)
CREATE INDEX indx_employee_id ON EMPLOYEES(EMPLOYEE_ID);
CREATE INDEX indx_department_id ON EMPLOYEES(DEPARTMENT_ID);

(26)

create table suppliers(
 
 Supplier_ID INT NOT NULL PRIMARY KEY,
 SUPPLIER_NAME VARCHAR(25) NOT NULL UNIQUE,
 CONTACT_NAME VARCHAR(25),
 PHONE_NUMBER INT NOT NULL,
 EMAIL INT UNIQUE
);
alter table suppliers modify email varchar(20);
(27)
create table PRODUCTS(
 
 PRODUCT_ID INT NOT NULL,
 Product_Name VARCHAR(25) NOT NULL UNIQUE,
 Supplier_ID INT,
 Category_ID INT,
  CONSTRAINT FOREIGN_KEY_Supplier_ID FOREIGN KEY (Supplier_ID) REFERENCES suppliers(Supplier_ID),
  CONSTRAINT PRIMARY_KEY_PID PRIMARY KEY (PRODUCT_ID)
);
(28)
INSERT INTO SUPPLIERS (SUPPLIER_ID,SUPPLIER_NAME,CONTACT_NAME,PHONE_NUMBER,EMAIL) VALUES
(5,'COMPANY1','mubeen',32014451,'fakegmail');

INSERT INTO PRODUCTS (PRODUCT_ID,PRODUCT_NAME,SUPPLIER_ID,CATEGORY_ID) VALUES
(5,'ELECTRONICS',3,4);