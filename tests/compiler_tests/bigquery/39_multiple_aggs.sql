WITH t_1_Transactions AS (SELECT * FROM (
  
    SELECT
      "Alice" AS col0,
      "purchase" AS col1,
      100 AS col2
   UNION ALL
  
    SELECT
      "Alice" AS col0,
      "purchase" AS col1,
      50 AS col2
   UNION ALL
  
    SELECT
      "Alice" AS col0,
      "refund" AS col1,
      30 AS col2
   UNION ALL
  
    SELECT
      "Bob" AS col0,
      "purchase" AS col1,
      200 AS col2
   UNION ALL
  
    SELECT
      "Bob" AS col0,
      "purchase" AS col1,
      75 AS col2
   UNION ALL
  
    SELECT
      "Charlie" AS col0,
      "purchase" AS col1,
      150 AS col2
   UNION ALL
  
    SELECT
      "Charlie" AS col0,
      "refund" AS col1,
      50 AS col2
   UNION ALL
  
    SELECT
      "Charlie" AS col0,
      "purchase" AS col1,
      100 AS col2
  
) AS UNUSED_TABLE_NAME  ),
t_0_CustomerStats AS (SELECT
  Transactions.col0 AS col0,
  SUM(Transactions.col2) AS total,
  SUM(1) AS count,
  MAX(Transactions.col2) AS max_txn,
  MIN(Transactions.col2) AS min_txn,
  AVG(Transactions.col2) AS avg_txn
FROM
  t_1_Transactions AS Transactions
GROUP BY col0)
SELECT
  CustomerStats.col0 AS customer,
  CustomerStats.total AS total,
  CustomerStats.count AS count,
  CustomerStats.max_txn AS max_txn
FROM
  t_0_CustomerStats AS CustomerStats ORDER BY customer;