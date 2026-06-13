-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_1_Orders AS (SELECT * FROM (
  
    SELECT
      1 AS order_id,
      101 AS customer_id,
      E'P1' AS product_id
   UNION ALL
  
    SELECT
      2 AS order_id,
      102 AS customer_id,
      E'P2' AS product_id
   UNION ALL
  
    SELECT
      3 AS order_id,
      101 AS customer_id,
      E'P3' AS product_id
  
) AS UNUSED_TABLE_NAME  ),
t_2_Customers AS (SELECT * FROM (
  
    SELECT
      101 AS customer_id,
      E'Alice' AS name
   UNION ALL
  
    SELECT
      102 AS customer_id,
      E'Bob' AS name
  
) AS UNUSED_TABLE_NAME  ),
t_3_Products AS (SELECT * FROM (
  
    SELECT
      E'P1' AS product_id,
      100 AS price
   UNION ALL
  
    SELECT
      E'P2' AS product_id,
      200 AS price
   UNION ALL
  
    SELECT
      E'P3' AS product_id,
      150 AS price
  
) AS UNUSED_TABLE_NAME  ),
t_0_OrderDetails AS (SELECT
  Orders.order_id AS order_id,
  Customers.name AS customer_name,
  Orders.product_id AS product_id,
  Products.price AS price
FROM
  t_1_Orders AS Orders, t_2_Customers AS Customers, t_3_Products AS Products
WHERE
  (Customers.customer_id = Orders.customer_id) AND
  (Products.product_id = Orders.product_id) ORDER BY order_id)
SELECT
  OrderDetails.order_id AS order_id,
  OrderDetails.customer_name AS customer_name,
  OrderDetails.price AS price
FROM
  t_0_OrderDetails AS OrderDetails ORDER BY order_id;