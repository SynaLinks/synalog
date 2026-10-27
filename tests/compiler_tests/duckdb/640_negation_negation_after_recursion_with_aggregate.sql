-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_1_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        2 AS x,
        ((0) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (0 < 5) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        2 AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (1 = 2)
     UNION ALL
    
      SELECT
        2 AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (1 = 2)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  2 AS x,
  ((t_15_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_R_RecursiveCte AS t_15_R_RecursiveCte
WHERE
  (t_15_R_RecursiveCte.synalog_step < 5) AND
  (t_15_R_RecursiveCte.x = 1)),
t_0_R AS (SELECT
  R_RecursiveCte.x AS x
FROM
  t_1_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x)
SELECT
  SUM(1) AS n
FROM
  (select unnest([1, 2, 3, 4]) as unnested_pod) as x_2
WHERE
  ((SELECT
    MIN((CASE WHEN x_5.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_0_R AS R, (select unnest([0]) as unnested_pod) as x_5
  WHERE
    (R.x IS NOT DISTINCT FROM x_2.unnested_pod)) IS NULL);