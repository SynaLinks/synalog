-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH t_5_R_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_4_R_r0 AS (SELECT
  R_MultBodyAggAux_recursive_head_f1.x AS x
FROM
  t_5_R_MultBodyAggAux_recursive_head_f1 AS R_MultBodyAggAux_recursive_head_f1
GROUP BY R_MultBodyAggAux_recursive_head_f1.x),
t_9_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_2_R_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      t_3_E.a AS x
    FROM
      t_4_R_r0 AS R_r0, t_9_E AS t_3_E
    WHERE
      (COALESCE(t_3_E.b, 0) = COALESCE(R_r0.x, 0) AND (t_3_E.b IS NULL) = (R_r0.x IS NULL))
   UNION ALL
  
    SELECT
      t_11_E.b AS x
    FROM
      t_4_R_r0 AS t_10_R_r0, t_9_E AS t_11_E
    WHERE
      (COALESCE(t_11_E.a, 0) = COALESCE(t_10_R_r0.x, 0) AND (t_11_E.a IS NULL) = (t_10_R_r0.x IS NULL))
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_r1 AS (SELECT
  R_MultBodyAggAux_recursive_head_f2.x AS x
FROM
  t_2_R_MultBodyAggAux_recursive_head_f2 AS R_MultBodyAggAux_recursive_head_f2
GROUP BY R_MultBodyAggAux_recursive_head_f2.x),
t_0_R_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      E.a AS x
    FROM
      t_1_R_r1 AS R_r1, t_9_E AS E
    WHERE
      (COALESCE(E.b, 0) = COALESCE(R_r1.x, 0) AND (E.b IS NULL) = (R_r1.x IS NULL))
   UNION ALL
  
    SELECT
      t_18_E.b AS x
    FROM
      t_1_R_r1 AS t_17_R_r1, t_9_E AS t_18_E
    WHERE
      (COALESCE(t_18_E.a, 0) = COALESCE(t_17_R_r1.x, 0) AND (t_18_E.a IS NULL) = (t_17_R_r1.x IS NULL))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R_MultBodyAggAux_recursive_head_f3.x AS x
FROM
  t_0_R_MultBodyAggAux_recursive_head_f3 AS R_MultBodyAggAux_recursive_head_f3
GROUP BY R_MultBodyAggAux_recursive_head_f3.x ORDER BY x;