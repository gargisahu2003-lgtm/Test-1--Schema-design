drop database if exists shopping_management;
create database shopping_management;
use shopping_management;
create table customers(
    Customer_id int primary key auto_increment,
    Customer_name varchar(100) not null,
    Email varchar(100) unique not null,
    Phone char(10) not null unique,
    Age int check (age>0),
    Gender enum ('Male','Female','Other'),
    Country varchar(50) default 'India',
    City varchar(50) not null,
    Pincode char(6) default '201301',
    Registration_date date default (current_date),
	Registration_time time default (current_time),
    created_at_datetime timestamp default (current_timestamp),
    Address varchar(250) ,
    Customer_status enum ('Active', 'Inactive', 'Blocked') default 'Active',
    Customer_Notes tinytext);
Insert into customers (Customer_name, Email, Phone, Age, Gender, City, Address, Customer_status, Customer_Notes)
Values
('Ananya', 'ananya.gupta@example.com', '8796875645',21, 'Female','Noida', 'A-51 sector2 Noida', 'Active','Nice product');
select * from customers;

create table orders(
    Order_id int primary key auto_increment,
    Customer_id int,
    Order_date date default (current_date),
    Order_amount decimal(10,2) not null,
    Order_status enum('pending', 'processing', 'shipped', 'delivered', 'cancelled') default 'pending',
    Payment_method enum('cash', 'card', 'UPI','net banking'),
    Payment_status enum('pending', 'paid', 'failed') default 'pending',
    Shipping_address varchar(250) not null,
    Delivery_pincode char(6),
    Quantity int not null check(quantity>0),
    Discount_amount decimal (10,2) default 0.00,
    Delivery_date date default null,
    Created_at timestamp default (current_timestamp),
    Tracking_number varchar(30) unique,
    Delivery_status enum('not dispatched','intransit','delivered','returned') default 'not dispatched',
    Order_notes tinytext);
    show tables;
    show create table customers;
  
    ALTER TABLE orders
    ADD FOREIGN KEY (Customer_id)
    REFERENCES customers(Customer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    show create table orders;
    
    