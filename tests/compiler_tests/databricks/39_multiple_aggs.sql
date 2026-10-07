WITH t_1_Transactions AS (SELECT * FROM VALUES
  ("Alice", "purchase", 100),
  ("Alice", "purchase", 50),
  ("Alice", "refund", 30),
  ("Bob", "purchase", 200),
  ("Bob", "purchase", 75),
  ("Charlie", "purchase", 150),
  ("Charlie", "refund", 50),
  ("Charlie", "purchase", 100)
AS UNUSED_TABLE_NAME(col0, col1, col2)),
t_0_CustomerStats AS (SELECT
  Transactions.col0 AS col0,
  SUM(Transactions.col2) AS total,
  SUM(1) AS count,
  MAX(Transactions.col2) AS max_txn,
  MIN(Transactions.col2) AS min_txn,
  AVG(Transactions.col2) AS avg_txn
FROM
  t_1_Transactions AS Transactions
GROUP BY 1)
SELECT
  CustomerStats.col0 AS customer,
  CustomerStats.total AS total,
  CustomerStats.count AS count,
  CustomerStats.max_txn AS max_txn
FROM
  t_0_CustomerStats AS CustomerStats ORDER BY customer NULLS LAST;