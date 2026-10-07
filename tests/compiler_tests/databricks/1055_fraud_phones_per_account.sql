WITH t_0_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone))
SELECT
  HasPhone.account AS account,
  SUM(1) AS n
FROM
  t_0_HasPhone AS HasPhone
GROUP BY 1 ORDER BY account NULLS LAST;