SET FOREIGN_KEY_CHECKS = 0;

DROP DATABASE IF EXISTS bike_store;

SET FOREIGN_KEY_CHECKS = 1;
CREATE DATABASE bike_store;
USE bike_store;
CREATE TABLE brands (
    brand_id    INT          NOT NULL,
    brand_name  VARCHAR(50)  NOT NULL,
    PRIMARY KEY (brand_id)
);
CREATE TABLE categories (
    category_id    INT          NOT NULL,
    category_name  VARCHAR(50)  NOT NULL,
    PRIMARY KEY (category_id)
);
CREATE TABLE customers (
    customer_id  INT           NOT NULL,
    first_name   VARCHAR(50)   NOT NULL,
    last_name    VARCHAR(50)   NOT NULL,
    phone        VARCHAR(20)   NULL,
    email        VARCHAR(100)  NOT NULL,
    street       VARCHAR(100)  NULL,
    city         VARCHAR(50)   NULL,
    state        VARCHAR(10)   NULL,
    zip_code     VARCHAR(20)   NULL,
    PRIMARY KEY (customer_id)
);
CREATE TABLE stores (
    store_id    INT           NOT NULL,
    store_name  VARCHAR(100)  NOT NULL,
    phone       VARCHAR(20)   NULL,
    email       VARCHAR(100)  NULL,
    street      VARCHAR(100)  NULL,
    city        VARCHAR(50)   NULL,
    state       VARCHAR(10)   NULL,
    zip_code    VARCHAR(20)   NULL,
    PRIMARY KEY (store_id)
);
CREATE TABLE staffs (
    staff_id    INT           NOT NULL,
    first_name  VARCHAR(50)   NOT NULL,
    last_name   VARCHAR(50)   NOT NULL,
    email       VARCHAR(100)  NOT NULL,
    phone       VARCHAR(20)   NULL,
    active      TINYINT(1)    NOT NULL,
    store_id    INT           NOT NULL,
    manager_id  INT           NULL,
    PRIMARY KEY (staff_id),
    CONSTRAINT fk_staffs_store
        FOREIGN KEY (store_id)
        REFERENCES stores(store_id),
    CONSTRAINT fk_staffs_manager
        FOREIGN KEY (manager_id)
        REFERENCES staffs(staff_id)
);
CREATE TABLE products (
    product_id    INT            NOT NULL,
    product_name  VARCHAR(200)   NOT NULL,
    brand_id      INT            NOT NULL,
    category_id   INT            NOT NULL,
    model_year    YEAR           NOT NULL,
    list_price    DECIMAL(10,2)  NOT NULL,
    PRIMARY KEY (product_id),
    CONSTRAINT fk_products_brand
        FOREIGN KEY (brand_id)
        REFERENCES brands(brand_id),
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);
CREATE TABLE orders (
    order_id       INT          NOT NULL,
    customer_id    INT          NOT NULL,
    order_status   VARCHAR(20)  NOT NULL,
    order_date     DATE         NOT NULL,
    required_date  DATE         NOT NULL,
    shipped_date   VARCHAR(20)  NULL,
    store_id       INT          NOT NULL,
    staff_id       INT          NOT NULL,
    PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_store
        FOREIGN KEY (store_id)
        REFERENCES stores(store_id),
    CONSTRAINT fk_orders_staff
        FOREIGN KEY (staff_id)
        REFERENCES staffs(staff_id)
);
CREATE TABLE order_items (
    order_id     INT            NOT NULL,
    item_id      INT            NOT NULL,
    product_id   INT            NOT NULL,
    quantity     INT            NOT NULL,
    list_price   DECIMAL(10,2)  NOT NULL,
    discount     DECIMAL(10,2)  NOT NULL DEFAULT 0,
    total_price  DECIMAL(10,2)  NULL,
    PRIMARY KEY  (order_id, item_id),
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
CREATE TABLE stocks (
    store_id    INT  NOT NULL,
    product_id  INT  NOT NULL,
    quantity    INT  NULL,
    PRIMARY KEY (store_id, product_id),
    CONSTRAINT fk_stocks_store
        FOREIGN KEY (store_id)
        REFERENCES stores(store_id),
    CONSTRAINT fk_stocks_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
SHOW TABLES;
USE bike_store;
SELECT
    o.order_id          AS 'Order ID',
    o.order_date        AS 'Order Date',
    o.order_status      AS 'Status',
    c.first_name        AS 'Customer First Name',
    c.last_name         AS 'Customer Last Name',
    p.product_name      AS 'Product Name',
    oi.quantity         AS 'Quantity',
    oi.list_price       AS 'Unit Price',
    oi.discount         AS 'Discount',
    oi.total_price      AS 'Total Price'
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY
    o.order_id,
    oi.item_id
LIMIT 20;
USE bike_store;

SELECT 'orders'      AS table_name, COUNT(*) AS rows FROM orders      UNION ALL
SELECT 'order_items',               COUNT(*)          FROM order_items UNION ALL
SELECT 'products',                  COUNT(*)          FROM products    UNION ALL
SELECT 'customers',                 COUNT(*)          FROM customers;
