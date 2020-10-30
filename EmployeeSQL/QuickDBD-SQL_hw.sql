-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/u4oSIF
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- create code for the ERD for SQL assignment

--the following code creates the tables and foreign keys for this assignment

CREATE TABLE "departments" (
    "department_id" varchar   NOT NULL,
    "department_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "dept_emp_junction" (
    "employee_id" int   NOT NULL,
    "department_id" varchar   NOT NULL
);

CREATE TABLE "dept_manager_junction" (
    "department_id" varchar   NOT NULL,
    "employee_id" int   NOT NULL
);

CREATE TABLE "employees" (
    "employee_id" int   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(8)   NOT NULL,
    "birth_date" Date   NOT NULL,
    "hire_date" Date   NOT NULL,
    "title_id" varchar   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_id"
     )
);

CREATE TABLE "salaries" (
    "employee_id" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" VarChar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp_junction" ADD CONSTRAINT "fk_dept_emp_junction_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "dept_emp_junction" ADD CONSTRAINT "fk_dept_emp_junction_department_id" FOREIGN KEY("department_id")
REFERENCES "departments" ("department_id");

ALTER TABLE "dept_manager_junction" ADD CONSTRAINT "fk_dept_manager_junction_department_id" FOREIGN KEY("department_id")
REFERENCES "departments" ("department_id");

ALTER TABLE "dept_manager_junction" ADD CONSTRAINT "fk_dept_manager_junction_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

--tables and foreign keys are now created

--query to select employee information, including salaries, using a join
select employees.employee_id, first_name, last_name, sex, salary
from employees, salaries where 
employees.employee_id = salaries.employee_id;

select first_name, last_name, hire_date from employees where (select date_part('year', hire_date) = 1986);


