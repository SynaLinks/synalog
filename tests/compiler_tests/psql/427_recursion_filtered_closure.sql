-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_14_Reach_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_13_Reach_r0 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_14_Reach_MultBodyAggAux_recursive_head_f1 AS Reach_MultBodyAggAux_recursive_head_f1
GROUP BY Reach_MultBodyAggAux_recursive_head_f1.x),
t_16_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b,
      true AS ok
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b,
      false AS ok
  
) AS UNUSED_TABLE_NAME  ),
t_11_Reach_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_12_E.b AS x
    FROM
      t_13_Reach_r0 AS Reach_r0, t_16_E AS t_12_E
    WHERE
      (t_12_E.a = Reach_r0.x) AND
      (t_12_E.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_10_Reach_r1 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_11_Reach_MultBodyAggAux_recursive_head_f2 AS Reach_MultBodyAggAux_recursive_head_f2
GROUP BY Reach_MultBodyAggAux_recursive_head_f2.x),
t_8_Reach_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_9_E.b AS x
    FROM
      t_10_Reach_r1 AS Reach_r1, t_16_E AS t_9_E
    WHERE
      (t_9_E.a = Reach_r1.x) AND
      (t_9_E.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_7_Reach_r2 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_8_Reach_MultBodyAggAux_recursive_head_f3 AS Reach_MultBodyAggAux_recursive_head_f3
GROUP BY Reach_MultBodyAggAux_recursive_head_f3.x),
t_5_Reach_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_6_E.b AS x
    FROM
      t_7_Reach_r2 AS Reach_r2, t_16_E AS t_6_E
    WHERE
      (t_6_E.a = Reach_r2.x) AND
      (t_6_E.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Reach_r3 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_5_Reach_MultBodyAggAux_recursive_head_f4 AS Reach_MultBodyAggAux_recursive_head_f4
GROUP BY Reach_MultBodyAggAux_recursive_head_f4.x),
t_2_Reach_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_3_E.b AS x
    FROM
      t_4_Reach_r3 AS Reach_r3, t_16_E AS t_3_E
    WHERE
      (t_3_E.a = Reach_r3.x) AND
      (t_3_E.ok = true)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_r4 AS (SELECT
  Reach_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_2_Reach_MultBodyAggAux_recursive_head_f5 AS Reach_MultBodyAggAux_recursive_head_f5
GROUP BY Reach_MultBodyAggAux_recursive_head_f5.x),
t_0_Reach_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      t_1_Reach_r4 AS Reach_r4, t_16_E AS E
    WHERE
      (E.a = Reach_r4.x) AND
      (E.ok = true)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Reach_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_0_Reach_MultBodyAggAux_recursive_head_f6 AS Reach_MultBodyAggAux_recursive_head_f6
GROUP BY Reach_MultBodyAggAux_recursive_head_f6.x ORDER BY x;