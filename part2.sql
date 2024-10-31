
create table regions(
region_id int primary key,
region_name varchar(25)
);

create table countries(
country_id char(2) primary key,
country_name varchar(40),
region_id int
constraint region_id_fk foreign key(region_id) references regions(region_id)
);

create table locations(
location_id int primary key,
street_address varchar(25),
postal_code varchar(12),
city varchar(30),
state_province varchar(12),
country_id char(2),
constraint country_id_fk foreign key(country_id) references countries(country_id)
);

create table departements(
departement_id int primary key,
departement_name varchar(30),
manager_id int ,
location_id int,
constraint location_id_fk foreign key(location_id) references locations(location_id)
);

create table jobs(
job_id varchar(10) primary key,
job_title varchar(25),
min_salary decimal,
max_salary decimal
);

create table employees(
employee_id int primary key,
first_name varchar(20),
last_name varchar(25),
email varchar(25),
phone_number varchar(20),
hire_date date,
job_id varchar(10),
salary decimal,
commission_pct decimal,
manager_id int,
departement_id int,
foreign key(departement_id) references departements (departement_id),
foreign key(job_id) references jobs(job_id)
);

create table job_history(
employee_id int ,
start_date date ,
end_date date,
job_id varchar(10),
departement_id int,
primary key(employee_id,start_date),
foreign key(employee_id) references employees(employee_id),
foreign key(job_id) references jobs(job_id),
foreign key(departement_id) references departements(departement_id)
);