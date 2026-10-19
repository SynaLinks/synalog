-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_0_W_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        'a' AS w,
        0 AS logica_step
     UNION ALL
    
      SELECT
        (('a') || ('a')) AS w,
        ((0) + (1)) AS logica_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (LENGTH('a') < 3) AND
        (0 < 5) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        (((('a') || ('a'))) || ('a')) AS w,
        ((((0) + (1))) + (1)) AS logica_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (LENGTH((('a') || ('a'))) < 3) AND
        (((0) + (1)) < 5) AND
        (LENGTH('a') < 3) AND
        (0 < 5) AND
        (1 = 0)
     UNION ALL
    
      SELECT
        (((((('a') || ('a'))) || ('a'))) || ('a')) AS w,
        ((((((0) + (1))) + (1))) + (1)) AS logica_step
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (LENGTH((((('a') || ('a'))) || ('a'))) < 3) AND
        (((((0) + (1))) + (1)) < 5) AND
        (LENGTH((('a') || ('a'))) < 3) AND
        (((0) + (1)) < 5) AND
        (LENGTH('a') < 3) AND
        (0 < 5) AND
        (1 = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((t_9_W_RecursiveCte.w) || ('a')) AS w,
  ((t_9_W_RecursiveCte.logica_step) + (1)) AS logica_step
FROM
  t_0_W_RecursiveCte AS t_9_W_RecursiveCte
WHERE
  (LENGTH(t_9_W_RecursiveCte.w) < 3) AND
  (t_9_W_RecursiveCte.logica_step < 5))
SELECT
  W_RecursiveCte.w AS w
FROM
  t_0_W_RecursiveCte AS W_RecursiveCte
GROUP BY W_RecursiveCte.w ORDER BY w;