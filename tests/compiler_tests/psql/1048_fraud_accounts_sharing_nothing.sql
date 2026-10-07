-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_HasPhone AS (SELECT * FROM (
  
    SELECT
      'a1' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-1' AS phone
   UNION ALL
  
    SELECT
      'a2' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a3' AS account,
      '555-2' AS phone
   UNION ALL
  
    SELECT
      'a4' AS account,
      '555-3' AS phone
   UNION ALL
  
    SELECT
      'a5' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a6' AS account,
      '555-4' AS phone
   UNION ALL
  
    SELECT
      'a7' AS account,
      '555-9' AS phone
  
) AS UNUSED_TABLE_NAME  ),
t_1_Account AS (SELECT
  HasPhone.account AS account
FROM
  t_2_HasPhone AS HasPhone
GROUP BY HasPhone.account),
t_3_Shares AS (SELECT
  t_4_HasPhone.account AS a,
  t_5_HasPhone.account AS b
FROM
  t_2_HasPhone AS t_4_HasPhone, t_2_HasPhone AS t_5_HasPhone
WHERE
  (t_4_HasPhone.account != t_5_HasPhone.account) AND
  (t_5_HasPhone.phone = t_4_HasPhone.phone)
GROUP BY t_4_HasPhone.account, t_5_HasPhone.account)
SELECT
  t_0_Account.account AS account
FROM
  t_1_Account AS t_0_Account
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_Shares AS Shares, UNNEST(ARRAY[0]) as x_6
  WHERE
    (Shares.a = t_0_Account.account)) AS numeric) IS NULL) ORDER BY account;