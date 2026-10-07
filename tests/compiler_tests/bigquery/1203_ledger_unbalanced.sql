WITH t_1_Entry AS (SELECT * FROM (
  
    SELECT
      1 AS txn,
      "cash" AS account,
      -500 AS amount
   UNION ALL
  
    SELECT
      1 AS txn,
      "rent" AS account,
      500 AS amount
   UNION ALL
  
    SELECT
      2 AS txn,
      "cash" AS account,
      1200 AS amount
   UNION ALL
  
    SELECT
      2 AS txn,
      "sales" AS account,
      -1200 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      "cash" AS account,
      -80 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      "food" AS account,
      50 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      "travel" AS account,
      30 AS amount
   UNION ALL
  
    SELECT
      4 AS txn,
      "bank" AS account,
      1000 AS amount
   UNION ALL
  
    SELECT
      4 AS txn,
      "cash" AS account,
      -1000 AS amount
   UNION ALL
  
    SELECT
      5 AS txn,
      "food" AS account,
      20 AS amount
   UNION ALL
  
    SELECT
      5 AS txn,
      "cash" AS account,
      -15 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_Sum AS (SELECT
  Entry.txn AS txn,
  SUM(Entry.amount) AS s
FROM
  t_1_Entry AS Entry
GROUP BY txn)
SELECT
  Sum.txn AS txn,
  Sum.s AS s
FROM
  t_0_Sum AS Sum
WHERE
  (Sum.s != 0);