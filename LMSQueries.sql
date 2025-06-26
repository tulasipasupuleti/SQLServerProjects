create database library_db;

use library_db;

-- Create table "Branch"
create table branch
(
             branch_id varchar(10) PRIMARY KEY,
			 manager_id varchar(10),
			 branch_address varchar(30),
			 contact_no varchar(15)
);

--Create table "Employee"
create table employees
(
                emp_id varchar(10) PRIMARY KEY,
				emp_name varchar(30),
				position varchar(30),
				salary decimal(10,2),
				branch_id varchar(10),
				FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

--Create table "Members"
create table members
(
             member_id varchar(10) PRIMARY KEY,
			 member_name varchar(30),
			 member_address varchar(30),
			 reg_date date
);

--Create table "Books"
create table books
(
             isbn varchar(50) PRIMARY KEY,
			 book_title varchar(80),
			 category varchar(30),
			 rental_price decimal(10,2),
			 status varchar(10),
			 author varchar(30),
			 publisher varchar(30)
);

--Create table "IssueStatus"
create table issued_status
(
             issued_id varchar(10) PRIMARY KEY,
			 issued_member_id varchar(10),
			 issued_book_name varchar(80),
			 issued_date date,
			 issued_book_isbn varchar(50),
			 issued_emp_id varchar(10),
			 FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
			 FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
			 FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn)
);

--Create table "ReturnStatus"
create table return_status
(
             return_id varchar(10) PRIMARY KEY,
			 issued_id varchar(30),
			 return_book_name varchar(80),
			 return_date date,
			 return_book_isbn varchar(50),
			 FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);