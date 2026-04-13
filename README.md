# restaurant-order-management-db
26WN-CS630-154W - Database Systems final project 

## Overview
This project implements a restaurant order management system using a relational database design.

## Files:
- schema.sql
- sample_data.sql
- reset.sql
   
## Tables Description
- CUSTOMER: stores customer information
- RESTAURANT: stores restaurant details
- MENU_ITEM: stores menu items
- ORDERS: stores order data
- ORDER_ITEM: stores items in each order
  
## Design Notes
The ORDER_ITEM table is used to handle the many-to-many relationship between orders and menu items.
