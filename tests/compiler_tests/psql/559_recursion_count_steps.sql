-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_14_S_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
  
) AS UNUSED_TABLE_NAME  ),
t_13_S_r0 AS (SELECT
  S_MultBodyAggAux_recursive_head_f1.x AS x,
  MIN(S_MultBodyAggAux_recursive_head_f1.s) AS s
FROM
  t_14_S_MultBodyAggAux_recursive_head_f1 AS S_MultBodyAggAux_recursive_head_f1
GROUP BY S_MultBodyAggAux_recursive_head_f1.x),
t_16_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_11_S_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      t_12_E.b AS x,
      ((S_r0.s) + (1)) AS s
    FROM
      t_13_S_r0 AS S_r0, t_16_E AS t_12_E
    WHERE
      (COALESCE(t_12_E.a, 0) = COALESCE(S_r0.x, 0) AND (t_12_E.a IS NULL) = (S_r0.x IS NULL))
  
) AS UNUSED_TABLE_NAME  ),
t_10_S_r1 AS (SELECT
  S_MultBodyAggAux_recursive_head_f2.x AS x,
  MIN(S_MultBodyAggAux_recursive_head_f2.s) AS s
FROM
  t_11_S_MultBodyAggAux_recursive_head_f2 AS S_MultBodyAggAux_recursive_head_f2
GROUP BY S_MultBodyAggAux_recursive_head_f2.x),
t_8_S_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      t_9_E.b AS x,
      ((S_r1.s) + (1)) AS s
    FROM
      t_10_S_r1 AS S_r1, t_16_E AS t_9_E
    WHERE
      (COALESCE(t_9_E.a, 0) = COALESCE(S_r1.x, 0) AND (t_9_E.a IS NULL) = (S_r1.x IS NULL))
  
) AS UNUSED_TABLE_NAME  ),
t_7_S_r2 AS (SELECT
  S_MultBodyAggAux_recursive_head_f3.x AS x,
  MIN(S_MultBodyAggAux_recursive_head_f3.s) AS s
FROM
  t_8_S_MultBodyAggAux_recursive_head_f3 AS S_MultBodyAggAux_recursive_head_f3
GROUP BY S_MultBodyAggAux_recursive_head_f3.x),
t_5_S_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      t_6_E.b AS x,
      ((S_r2.s) + (1)) AS s
    FROM
      t_7_S_r2 AS S_r2, t_16_E AS t_6_E
    WHERE
      (COALESCE(t_6_E.a, 0) = COALESCE(S_r2.x, 0) AND (t_6_E.a IS NULL) = (S_r2.x IS NULL))
  
) AS UNUSED_TABLE_NAME  ),
t_4_S_r3 AS (SELECT
  S_MultBodyAggAux_recursive_head_f4.x AS x,
  MIN(S_MultBodyAggAux_recursive_head_f4.s) AS s
FROM
  t_5_S_MultBodyAggAux_recursive_head_f4 AS S_MultBodyAggAux_recursive_head_f4
GROUP BY S_MultBodyAggAux_recursive_head_f4.x),
t_2_S_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      t_3_E.b AS x,
      ((S_r3.s) + (1)) AS s
    FROM
      t_4_S_r3 AS S_r3, t_16_E AS t_3_E
    WHERE
      (COALESCE(t_3_E.a, 0) = COALESCE(S_r3.x, 0) AND (t_3_E.a IS NULL) = (S_r3.x IS NULL))
  
) AS UNUSED_TABLE_NAME  ),
t_1_S_r4 AS (SELECT
  S_MultBodyAggAux_recursive_head_f5.x AS x,
  MIN(S_MultBodyAggAux_recursive_head_f5.s) AS s
FROM
  t_2_S_MultBodyAggAux_recursive_head_f5 AS S_MultBodyAggAux_recursive_head_f5
GROUP BY S_MultBodyAggAux_recursive_head_f5.x),
t_0_S_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      0 AS s
   UNION ALL
  
    SELECT
      E.b AS x,
      ((S_r4.s) + (1)) AS s
    FROM
      t_1_S_r4 AS S_r4, t_16_E AS E
    WHERE
      (COALESCE(E.a, 0) = COALESCE(S_r4.x, 0) AND (E.a IS NULL) = (S_r4.x IS NULL))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S_MultBodyAggAux_recursive_head_f6.x AS x,
  MIN(S_MultBodyAggAux_recursive_head_f6.s) AS s
FROM
  t_0_S_MultBodyAggAux_recursive_head_f6 AS S_MultBodyAggAux_recursive_head_f6
GROUP BY S_MultBodyAggAux_recursive_head_f6.x ORDER BY x;