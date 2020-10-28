-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/u4oSIF
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- create code for the ERD for SQL assignment

CREATE TABLE "departments" (
    "department_id" -   NOT NULL,
    "department_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_id"
     )
);

CREATE TABLE "dept_emp_junction" (
    "employee_id" int   NOT NULL,
    "department_id" int   NOT NULL
);

CREATE TABLE "dept_manager_junction" (
    "dept_manager_id" int   NOT NULL,
    "employee_id" int   NOT NULL
);

CREATE TABLE "employees" (
    "employee_id" int   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "sex" varchar(8)   NOT NULL,
    "birth_date" Date   NOT NULL,
    "hire_date" Date   NOT NULL,
    "salary_id" int   NOT NULL,
    "title_id" int   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_id"
     )
);

CREATE TABLE "salaries" (
    "salary_id" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" int   NOT NULL,
    "title" VarChar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp_junction" ADD CONSTRAINT "fk_dept_emp_junction_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "dept_emp_junction" ADD CONSTRAINT "fk_dept_emp_junction_department_id" FOREIGN KEY("department_id")
REFERENCES "departments" ("department_id");

ALTER TABLE "dept_manager_junction" ADD CONSTRAINT "fk_dept_manager_junction_dept_manager_id" FOREIGN KEY("dept_manager_id")
REFERENCES "departments" ("department_id");

ALTER TABLE "dept_manager_junction" ADD CONSTRAINT "fk_dept_manager_junction_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employees" ("employee_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_salary_id" FOREIGN KEY("salary_id")
REFERENCES "salaries" ("salary_id");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

