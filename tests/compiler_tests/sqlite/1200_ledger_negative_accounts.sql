WITH t_1_Entry AS (SELECT * FROM (
  
    SELECT
      1 AS txn,
      'cash' AS account,
      -500 AS amount
   UNION ALL
  
    SELECT
      1 AS txn,
      'rent' AS account,
      500 AS amount
   UNION ALL
  
    SELECT
      2 AS txn,
      'cash' AS account,
      1200 AS amount
   UNION ALL
  
    SELECT
      2 AS txn,
      'sales' AS account,
      -1200 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'cash' AS account,
      -80 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'food' AS account,
      50 AS amount
   UNION ALL
  
    SELECT
      3 AS txn,
      'travel' AS account,
      30 AS amount
   UNION ALL
  
    SELECT
      4 AS txn,
      'bank' AS account,
      1000 AS amount
   UNION ALL
  
    SELECT
      4 AS txn,
      'cash' AS account,
      -1000 AS amount
   UNION ALL
  
    SELECT
      5 AS txn,
      'food' AS account,
      20 AS amount
   UNION ALL
  
    SELECT
      5 AS txn,
      'cash' AS account,
      -15 AS amount
  
) AS UNUSED_TABLE_NAME  ),
t_0_B AS (SELECT
  Entry.account AS account,
  SUM(Entry.amount) AS balance
FROM
  t_1_Entry AS Entry
GROUP BY Entry.account)
SELECT
  B.account AS account
FROM
  t_0_B AS B
WHERE
  (B.balance < 0) ORDER BY account;