Create Database if not exists CarRental;

use CarRental;

Set FOREIGN_KEY_CHECKS=0;

create table if not exists Dealership
(Dname Varchar(30) not null,
Location varchar(30) not null,
Dnumber varchar(30) not null,
Employees int not null,
Manager varchar(30) not null,
Profits decimal(11,2) not null,
NumOfCars int not null,
Primary key (Dname));

create table if not exists Owners
(Oname Varchar(30) not null,
SSN char(9) not null,
Phone_Number char(10) not null,
Address varchar(99) not null,
Dealership_Name varchar(20) not null,
ID_Number char(2) not null,
primary key(SSN));

create table if not exists Employee
(Fname varchar(30) not null,
Lname varchar(30) not null,
E_SSN char(9) not null,
E_ID char(2) not null,
M_SSN char(9),
Salary int not null,
Days_Working varchar(15) not null,
Num_Of_Cars_Sold int not null,
primary key(E_ID,E_SSN));

create table if not exists Manager
(Fname varchar(30) not null,
Lname varchar(30) not null,
M_SSN char(9),
M_ID char(2) not null,
Start_Date Date not null,
Salary int not null,
Days_Working varchar(15) not null,
Num_Of_Cars_Sold int not null,
primary key(M_ID));

Set FOREIGN_KEY_CHECKS=0;
create table if not exists Schedules
(ID char(2) not null,
Days_Working varchar(9) not null,
Hours varchar(7) not null,
foreign key(ID) references Employee(E_ID));

create table if not exists Customer
(Fname varchar(30) not null,
Lname varchar(30) not null,
C_SSN char(9) not null,
C_Number char(6) not null,
Appointment_Time TIME,
Num_of_Car_Bought int,
Credit_Score int not null,
primary key(C_SSN));

create table if not exists Car
(Car_Name varchar(30) not null,
Model varchar(30) not null,
Car_Type varchar(30) not null,
Car_Year year not null,
Car_Owner varchar(30),
Location varchar(30),
Reg_Number char(11),
Price int,
Discount int,
Primary key(Reg_Number));

create table if not exists Payment_Plan
(Loan_Number varchar(4) not null,
Cash_Paid int not null,
Loan_Balance int,
primary key(Loan_Number)); 

create table if not exists Sold
(Car varchar(30) not null,
Car_Type varchar(30) not null,
Previous_Owner char(9),
Customer_SSN varchar(30) not null,
E_ID char(2) not null,
Loan_Number varchar(5) not null,
License_Plate_Number varchar(30) not null,
primary key(License_Plate_Number),
foreign key(E_ID) references Employee(E_ID),
foreign key(Car) references Car(Reg_Number),
foreign key(Customer_SSN) references Customer(C_SSN),
foreign key(Previous_Owner) references Owners(SSN),
foreign key(Loan_Number) references Payment_Plan(Loan_Number));

create table if not exists Registration
(Car_Model 	varchar(30) not null,
Car_Type varchar(30) not null,
Car_Year int not null,
Location varchar(30) not null,
Car_Owner varchar(30) not null,
C_SSN char(9) not null,
E_ID char(9) not null,
License_Plate_Number char(7) not null,
primary key (License_Plate_Number),
foreign key(C_SSN) references Customer(C_SSN),
foreign key(E_ID) references Employee(E_ID),
foreign key(License_Plate_Number) references Sold(License_PLate_Number));

create table if not exists Appointment
(Customer_Name varchar(30) not null,
Customer_SSN char(9) not null,
Customer_Phone_Number char(10) not null,
primary key(Customer_SSN));

create table if not exists Service
(C_SSN char(9) not null,
E_ID char(2) not null,
Car_Viewing varchar(30) not null,
TestDrive char(1) not null,
Repairs varchar(30) not null,
foreign key(C_SSN) references Customer(C_SSN),
foreign key(E_ID) references Employee(E_ID));

SET FOREIGN_KEY_CHECKS=1;