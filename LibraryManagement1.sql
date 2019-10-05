create table books(
Book_ID NUMBER(10) PRIMARY KEY,
Book_Name VARCHAR2(50) not null,
Author VARCHAR2(50),
Publisher VARCHAR2(50) not null,
Quantity NUMBER(10),
issued_quantity number(10));

create table Librarians(
Lib_ID number(10) not null primary key,
Lib_Name VARCHAR2(50) not null,
Lib_Pass VARCHAR2(10) not null,
email VARCHAR2(255) not null check(email like '%@%.%' and email not like '@%' and email not like '%@%@%@%'),
Address VARCHAR(50) not null,
City varchar2(20) not null,
Ph_no number(10) not null  check(ph_no>=1000000000 and ph_no<=9999999999)
);


create table Mem_Level(
Mem_level varchar(10) not null primary key,
fee number(10) not null,
book_limit number(10) not null
); 


create table members (
mem_id NUMBER(10) not null primary KEY,
Mem_Name VARCHAR(50) not null,
email VARCHAR2(255) not null check(email like '%@%.%' and email not like '@%' and email not like '%@%@%@%'),
Address VARCHAR(50) not null,
City varchar2(20) not null,
Ph_no number(10) not null check(ph_no>=1000000000 and ph_no<=9999999999),
num_books number(10) default 0,
mem_level varchar2(10) not null references Mem_level (mem_level) on delete cascade
);

create table issue(
TransactionID NUMBER(10) NOT NULL PRIMARY KEY,
Book_ID NUMBER(10) Not null References books (Book_ID) on delete CASCADE,
Issuer_id number(10) not null references librarians (Lib_ID) on delete CASCADE,
Issued_Date Date not null,
Issued_to number(10) not null references Members (Mem_ID) on delete CASCADE
);
 
insert into mem_level VALUES ('platinum',150,15);
insert into mem_level VALUES ('gold',100,10);
insert into mem_level VALUES ('silver',50,5);