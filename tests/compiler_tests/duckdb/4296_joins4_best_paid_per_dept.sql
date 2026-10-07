-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_4_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS n,
      null AS boss,
      10 AS d,
      5000 AS pay
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS n,
      1 AS boss,
      10 AS d,
      4000 AS pay
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS n,
      1 AS boss,
      20 AS d,
      4200 AS pay
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS n,
      2 AS boss,
      10 AS d,
      3000 AS pay
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS n,
      3 AS boss,
      20 AS d,
      3100 AS pay
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS n,
      3 AS boss,
      null AS d,
      2900 AS pay
   UNION ALL
  
    SELECT
      7 AS id,
      'gus' AS n,
      null AS boss,
      30 AS d,
      6000 AS pay
   UNION ALL
  
    SELECT
      8 AS id,
      'hal' AS n,
      7 AS boss,
      30 AS d,
      2500 AS pay
  
) AS UNUSED_TABLE_NAME  ),
t_2_M AS (SELECT
  t_3_E.d AS d,
  MAX(t_3_E.pay) AS m
FROM
  t_4_E AS t_3_E
GROUP BY t_3_E.d),
t_5_D AS (SELECT * FROM (
  
    SELECT
      10 AS d,
      'sales' AS dn,
      'paris' AS city
   UNION ALL
  
    SELECT
      20 AS d,
      'tech' AS dn,
      'oslo' AS city
   UNION ALL
  
    SELECT
      30 AS d,
      'ops' AS dn,
      'paris' AS city
   UNION ALL
  
    SELECT
      40 AS d,
      'legal' AS dn,
      'rome' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_1_D.dn AS dn,
  E.n AS n
FROM
  t_2_M AS t_0_M, t_4_E AS E, t_5_D AS t_1_D
WHERE
  (E.d = t_0_M.d) AND
  (E.pay = t_0_M.m) AND
  (t_1_D.d = t_0_M.d) ORDER BY dn;