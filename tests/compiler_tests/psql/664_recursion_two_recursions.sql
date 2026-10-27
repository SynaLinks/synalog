-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        E.b AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_E AS E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (E.a = 1)
     UNION ALL
    
      SELECT
        t_5_E.b AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_7_E, t_3_E AS t_5_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_5_E.a, 0) = COALESCE(t_7_E.b, 0) AND (t_5_E.a IS NULL) = (t_7_E.b IS NULL)) AND
        (t_7_E.a = 1)
     UNION ALL
    
      SELECT
        t_10_E.b AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_14_E, t_3_E AS t_12_E, t_3_E AS t_10_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_10_E.a, 0) = COALESCE(t_12_E.b, 0) AND (t_10_E.a IS NULL) = (t_12_E.b IS NULL)) AND
        (COALESCE(t_12_E.a, 0) = COALESCE(t_14_E.b, 0) AND (t_12_E.a IS NULL) = (t_14_E.b IS NULL)) AND
        (t_14_E.a = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_17_E.b AS x,
  ((t_16_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_R_RecursiveCte AS t_16_R_RecursiveCte, t_3_E AS t_17_E
WHERE
  (t_16_R_RecursiveCte.synalog_step < 5) AND
  (COALESCE(t_17_E.a, 0) = COALESCE(t_16_R_RecursiveCte.x, 0) AND (t_17_E.a IS NULL) = (t_16_R_RecursiveCte.x IS NULL))),
t_0_R AS (SELECT
  R_RecursiveCte.x AS x
FROM
  t_1_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x),
t_19_S_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        3 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        t_20_E.a AS x,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_E AS t_20_E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (t_20_E.b = 3)
     UNION ALL
    
      SELECT
        t_23_E.a AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_25_E, t_3_E AS t_23_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_23_E.b, 0) = COALESCE(t_25_E.a, 0) AND (t_23_E.b IS NULL) = (t_25_E.a IS NULL)) AND
        (t_25_E.b = 3)
     UNION ALL
    
      SELECT
        t_28_E.a AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_32_E, t_3_E AS t_30_E, t_3_E AS t_28_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_28_E.b, 0) = COALESCE(t_30_E.a, 0) AND (t_28_E.b IS NULL) = (t_30_E.a IS NULL)) AND
        (COALESCE(t_30_E.b, 0) = COALESCE(t_32_E.a, 0) AND (t_30_E.b IS NULL) = (t_32_E.a IS NULL)) AND
        (t_32_E.b = 3)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_35_E.a AS x,
  ((t_34_S_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_19_S_RecursiveCte AS t_34_S_RecursiveCte, t_3_E AS t_35_E
WHERE
  (t_34_S_RecursiveCte.synalog_step < 5) AND
  (COALESCE(t_35_E.b, 0) = COALESCE(t_34_S_RecursiveCte.x, 0) AND (t_35_E.b IS NULL) = (t_34_S_RecursiveCte.x IS NULL))),
t_18_S AS (SELECT
  S_RecursiveCte.x AS x
FROM
  t_19_S_RecursiveCte AS S_RecursiveCte
GROUP BY S_RecursiveCte.x)
SELECT
  R.x AS x
FROM
  t_0_R AS R, t_18_S AS S
WHERE
  (R.x > 2) AND
  (COALESCE(S.x, 0) = COALESCE(R.x, 0) AND (S.x IS NULL) = (R.x IS NULL));