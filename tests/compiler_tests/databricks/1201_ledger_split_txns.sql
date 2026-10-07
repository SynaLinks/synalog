WITH t_1_Entry AS (SELECT * FROM VALUES
  (1, "cash", -500),
  (1, "rent", 500),
  (2, "cash", 1200),
  (2, "sales", -1200),
  (3, "cash", -80),
  (3, "food", 50),
  (3, "travel", 30),
  (4, "bank", 1000),
  (4, "cash", -1000),
  (5, "food", 20),
  (5, "cash", -15)
AS UNUSED_TABLE_NAME(txn, account, amount)),
t_0_L AS (SELECT
  Entry.txn AS txn,
  SUM(1) AS n
FROM
  t_1_Entry AS Entry
GROUP BY 1)
SELECT
  L.txn AS txn
FROM
  t_0_L AS L
WHERE
  (L.n > 2);
