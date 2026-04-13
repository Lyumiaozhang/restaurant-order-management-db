-- schema.sql
-- Restaurant Order Management System

CREATE TABLE CUSTOMER (
    customer_id  NUMBER PRIMARY KEY,
    full_name    VARCHAR2(100) NOT NULL,
    email        VARCHAR2(150) NOT NULL,
    phone        VARCHAR2(20)
);

CREATE TABLE RESTAURANT (
    restaurant_id   NUMBER PRIMARY KEY,
    restaurant_name VARCHAR2(150) NOT NULL,
    location        VARCHAR2(255) NOT NULL
);

CREATE TABLE MENU_ITEM (
    menu_item_id  NUMBER PRIMARY KEY,
    restaurant_id NUMBER NOT NULL,
    item_name     VARCHAR2(150) NOT NULL,
    price         NUMBER(10,2) NOT NULL,
    is_available  VARCHAR2(3) DEFAULT 'YES',
    CONSTRAINT fk_menuitem_restaurant FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id)
);

CREATE TABLE ORDERS (
    order_id      NUMBER PRIMARY KEY,
    customer_id   NUMBER NOT NULL,
    restaurant_id NUMBER NOT NULL,
    order_date    DATE DEFAULT SYSDATE,
    order_status  VARCHAR2(20) DEFAULT 'PENDING',
    total_amount  NUMBER(10,2) DEFAULT 0,
    CONSTRAINT fk_orders_customer   FOREIGN KEY (customer_id)   REFERENCES CUSTOMER(customer_id),
    CONSTRAINT fk_orders_restaurant FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id)
);

CREATE TABLE ORDER_ITEM (
    order_item_id NUMBER PRIMARY KEY,
    order_id      NUMBER NOT NULL,
    menu_item_id  NUMBER NOT NULL,
    quantity      NUMBER NOT NULL,
    unit_price    NUMBER(10,2) NOT NULL,
    CONSTRAINT fk_orderitem_order    FOREIGN KEY (order_id)     REFERENCES ORDERS(order_id),
    CONSTRAINT fk_orderitem_menuitem FOREIGN KEY (menu_item_id) REFERENCES MENU_ITEM(menu_item_id)
);
