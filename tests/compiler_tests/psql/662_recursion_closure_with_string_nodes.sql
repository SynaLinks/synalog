-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
   UNION ALL
  
    SELECT
      'x' AS a,
      'y' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        'a' AS n,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        E.b AS n,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_E AS E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (E.a = 'a')
     UNION ALL
    
      SELECT
        t_4_E.b AS n,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_6_E, t_2_E AS t_4_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_4_E.a, '') = COALESCE(t_6_E.b, '') AND (t_4_E.a IS NULL) = (t_6_E.b IS NULL)) AND
        (t_6_E.a = 'a')
     UNION ALL
    
      SELECT
        t_9_E.b AS n,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_E AS t_13_E, t_2_E AS t_11_E, t_2_E AS t_9_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_9_E.a, '') = COALESCE(t_11_E.b, '') AND (t_9_E.a IS NULL) = (t_11_E.b IS NULL)) AND
        (COALESCE(t_11_E.a, '') = COALESCE(t_13_E.b, '') AND (t_11_E.a IS NULL) = (t_13_E.b IS NULL)) AND
        (t_13_E.a = 'a')
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_E.b AS n,
  ((t_15_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_15_R_RecursiveCte, t_2_E AS t_16_E
WHERE
  (t_15_R_RecursiveCte.synalog_step < 5) AND
  (COALESCE(t_16_E.a, '') = COALESCE(t_15_R_RecursiveCte.n, '') AND (t_16_E.a IS NULL) = (t_15_R_RecursiveCte.n IS NULL)))
SELECT
  R_RecursiveCte.n AS n
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.n ORDER BY n;