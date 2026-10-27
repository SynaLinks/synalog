-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      3 AS y
   UNION ALL
  
    SELECT
      3 AS x,
      4 AS y
   UNION ALL
  
    SELECT
      4 AS x,
      5 AS y
   UNION ALL
  
    SELECT
      5 AS x,
      6 AS y
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS y,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        Edge.y AS y,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS Edge
      WHERE
        (0 < 20) AND
        (1 = 0) AND
        (Edge.x = 1)
     UNION ALL
    
      SELECT
        t_4_Edge.y AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_6_Edge, t_2_Edge AS t_4_Edge
      WHERE
        (((0) + (1)) < 20) AND
        (0 < 20) AND
        (1 = 0) AND
        (COALESCE(t_4_Edge.x, 0) = COALESCE(t_6_Edge.y, 0) AND (t_4_Edge.x IS NULL) = (t_6_Edge.y IS NULL)) AND
        (t_6_Edge.x = 1)
     UNION ALL
    
      SELECT
        t_9_Edge.y AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_13_Edge, t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge
      WHERE
        (((((0) + (1))) + (1)) < 20) AND
        (((0) + (1)) < 20) AND
        (0 < 20) AND
        (1 = 0) AND
        (COALESCE(t_9_Edge.x, 0) = COALESCE(t_11_Edge.y, 0) AND (t_9_Edge.x IS NULL) = (t_11_Edge.y IS NULL)) AND
        (COALESCE(t_11_Edge.x, 0) = COALESCE(t_13_Edge.y, 0) AND (t_11_Edge.x IS NULL) = (t_13_Edge.y IS NULL)) AND
        (t_13_Edge.x = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_Edge.y AS y,
  ((t_15_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, t_2_Edge AS t_16_Edge
WHERE
  (t_15_Reach_RecursiveCte.synalog_step < 20) AND
  (COALESCE(t_16_Edge.x, 0) = COALESCE(t_15_Reach_RecursiveCte.y, 0) AND (t_16_Edge.x IS NULL) = (t_15_Reach_RecursiveCte.y IS NULL)))
SELECT
  Reach_RecursiveCte.y AS y
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.y ORDER BY y;