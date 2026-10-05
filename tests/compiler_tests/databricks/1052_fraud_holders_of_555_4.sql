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
  HasPhone.account AS account
FROM
  t_0_HasPhone AS HasPhone
WHERE
  (HasPhone.phone = "555-4") ORDER BY account NULLS LAST;