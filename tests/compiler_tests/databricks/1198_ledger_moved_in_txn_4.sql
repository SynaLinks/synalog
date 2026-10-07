WITH t_0_Entry AS (SELECT * FROM VALUES
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
AS UNUSED_TABLE_NAME(txn, account, amount))
SELECT
  SUM(Entry.amount) AS m
FROM
  t_0_Entry AS Entry
WHERE
  (Entry.amount > 0) AND
  (Entry.txn = 4);
