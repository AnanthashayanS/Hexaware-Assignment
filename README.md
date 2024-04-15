# Hexaware-Assignment
This project involves the development of a Courier Management System, executed as a part of the curriculum at Hexavarsity. The core of the project is structured around building a robust database system using SQL.
# RELATIONSHIPS-BETWEEN-TABLES
Users and Courier
One-to-Many Relationship: One user can send multiple couriers (CustomerID in Courier references UserID in Users).
A user can send zero or more couriers, but each courier record references one and only one user.
Employee and Courier
One-to-Many Relationship: One employee can be associated with multiple courier records (EmployeeID in Courier references EmployeeID in Employee).
An employee can handle zero or more couriers, but each courier is handled by one and only one employee.
CourierServices and Courier
One-to-Many Relationship: One service type can be used for multiple couriers (ServiceID in Courier references ServiceID in CourierServices).
A courier service type can be applied to zero or more courier records, but each courier uses one service type.
Courier and Payment
One-to-One Relationship: Typically, this would be a one-to-one relationship where each courier has one corresponding payment record (CourierID in Payment references CourierID in Courier).
Only one payment per courier is allowed, So it remains one-to-one.
Location and Payment
One-to-Many Relationship: One location can be associated with multiple payments (LocationID in Payment references LocationID in Location).
A location can have zero or more payments associated with it, but each payment is made at one specific location.
