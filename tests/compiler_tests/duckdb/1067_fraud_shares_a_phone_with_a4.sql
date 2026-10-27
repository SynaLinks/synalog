-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
t_0_Shares AS (SELECT
  HasPhone.account AS a,
  t_1_HasPhone.account AS b
FROM
  t_2_HasPhone AS HasPhone, t_2_HasPhone AS t_1_HasPhone
WHERE
  (HasPhone.account IS DISTINCT FROM t_1_HasPhone.account) AND
  (t_1_HasPhone.phone IS NOT DISTINCT FROM HasPhone.phone)
GROUP BY HasPhone.account, t_1_HasPhone.account)
SELECT
  Shares.b AS b
FROM
  t_0_Shares AS Shares
WHERE
  (Shares.a = 'a4')
GROUP BY Shares.b ORDER BY b;