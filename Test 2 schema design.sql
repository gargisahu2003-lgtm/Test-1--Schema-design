drop database if exists company_training;
create database company_training;
use company_training;

create table departments (
    department_id int primary key not null,
    dept_name varchar(100) not null,
    city varchar(60),
    location varchar(100)
);

create table employees (
    employee_id int primary key not null,
    employee_name varchar(100) not null,
    email varchar(120),
    department_id int not null,
    salary decimal(10,2),
    status varchar(20)
);


alter table departments
rename column dept_name to department_name;
alter table employees
modify column salary decimal(12,2) not null;
alter table employees
alter column status set default 'active';
alter table employees
add constraint unique(email);
rename table employees to staff;
alter table staff
add constraint fk_staff_department
foreign key (department_id)
references departments(department_id);
alter table staff
drop unique_employees_email;
alter table staff
drop foreign key department;
alter table staff
drop primary key;
alter table staff
add primary key (employee_id);
alter table departments
drop column location;
create database new_database_name;
rename table old_database_name. table_name to new_database_name. table_name;
drop database old_database_name;

drop database ddl_commands;
drop table ddl_commands.my_table;




