WITH t_2_HasPhone AS (SELECT * FROM VALUES
  ("a1", "555-1"),
  ("a2", "555-1"),
  ("a2", "555-2"),
  ("a3", "555-2"),
  ("a4", "555-3"),
  ("a5", "555-4"),
  ("a6", "555-4"),
  ("a7", "555-9")
AS UNUSED_TABLE_NAME(account, phone)),
t_0_Shares AS (SELECT
  HasPhone.account AS a,
  t_1_HasPhone.account AS b
FROM
  t_2_HasPhone AS HasPhone, t_2_HasPhone AS t_1_HasPhone
WHERE
  (HasPhone.account != t_1_HasPhone.account) AND
  (t_1_HasPhone.phone = HasPhone.phone)
GROUP BY 1, 2)
SELECT
  Shares.b AS b
FROM
  t_0_Shares AS Shares
WHERE
  (Shares.a = "a2")
GROUP BY 1 ORDER BY b NULLS LAST;