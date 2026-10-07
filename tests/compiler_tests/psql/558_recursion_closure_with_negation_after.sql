-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_15_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_14_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_15_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.x),
t_17_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_12_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_13_E.b AS x
    FROM
      t_14_R_r0 AS R_r0, t_17_E AS t_13_E
    WHERE
      (t_13_E.a = R_r0.x)
  
) AS UNUSED_TABLE_NAME  ),
t_11_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_12_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.x),
t_9_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_10_E.b AS x
    FROM
      t_11_R_r1 AS R_r1, t_17_E AS t_10_E
    WHERE
      (t_10_E.a = R_r1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_8_R_r2 AS (SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_9_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY R_MultBodyAggAux_recursive_head_f3.x),
t_6_R_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_7_E.b AS x
    FROM
      t_8_R_r2 AS R_r2, t_17_E AS t_7_E
    WHERE
      (t_7_E.a = R_r2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_5_R_r3 AS (SELECT
  R_MultBodyAggAux_recursive_head_f4.x AS x
FROM
  t_6_R_MultBodyAggAux_recursive_head_f4 AS R_MultBodyAggAux_recursive_head_f4
GROUP BY R_MultBodyAggAux_recursive_head_f4.x),
t_3_R_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_4_E.b AS x
    FROM
      t_5_R_r3 AS R_r3, t_17_E AS t_4_E
    WHERE
      (t_4_E.a = R_r3.x)
  
) AS UNUSED_TABLE_NAME  ),
t_2_R_r4 AS (SELECT
  R_MultBodyAggAux_recursive_head_f5.x AS x
FROM
  t_3_R_MultBodyAggAux_recursive_head_f5 AS R_MultBodyAggAux_recursive_head_f5
GROUP BY R_MultBodyAggAux_recursive_head_f5.x),
t_1_R_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.b AS x
    FROM
      t_2_R_r4 AS R_r4, t_17_E AS E
    WHERE
      (E.a = R_r4.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R AS (SELECT
  R_MultBodyAggAux_recursive_head_f6.x AS x
FROM
  t_1_R_MultBodyAggAux_recursive_head_f6 AS R_MultBodyAggAux_recursive_head_f6
GROUP BY R_MultBodyAggAux_recursive_head_f6.x)
SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 5]::numeric[]) as x_3
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_R AS R, UNNEST(ARRAY[0]::numeric[]) as x_6
  WHERE
    (R.x = x_3)) AS numeric) IS NULL);