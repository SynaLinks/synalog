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
t_1_Account AS (SELECT
  HasPhone.account AS account
FROM
  t_2_HasPhone AS HasPhone
GROUP BY 1),
t_3_Shares AS (SELECT
  t_4_HasPhone.account AS a,
  t_5_HasPhone.account AS b
FROM
  t_2_HasPhone AS t_4_HasPhone, t_2_HasPhone AS t_5_HasPhone
WHERE
  (t_4_HasPhone.account != t_5_HasPhone.account) AND
  (t_5_HasPhone.phone = t_4_HasPhone.phone)
GROUP BY 1, 2)
SELECT
  t_0_Account.account AS account
FROM
  t_1_Account AS t_0_Account
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Shares AS Shares
  WHERE
    (Shares.a = t_0_Account.account)) IS NULL) ORDER BY account NULLS LAST;