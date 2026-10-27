-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x
     UNION ALL
    
      SELECT
        Edge.b AS x
      FROM
        t_2_Edge AS Edge
      WHERE
        (1 = 0) AND
        (Edge.a = 1)
     UNION ALL
    
      SELECT
        t_4_Edge.b AS x
      FROM
        t_2_Edge AS t_6_Edge, t_2_Edge AS t_4_Edge
      WHERE
        (1 = 0) AND
        (COALESCE(t_4_Edge.a, 0) = COALESCE(t_6_Edge.b, 0) AND (t_4_Edge.a IS NULL) = (t_6_Edge.b IS NULL)) AND
        (t_6_Edge.a = 1)
     UNION ALL
    
      SELECT
        t_9_Edge.b AS x
      FROM
        t_2_Edge AS t_13_Edge, t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge
      WHERE
        (1 = 0) AND
        (COALESCE(t_9_Edge.a, 0) = COALESCE(t_11_Edge.b, 0) AND (t_9_Edge.a IS NULL) = (t_11_Edge.b IS NULL)) AND
        (COALESCE(t_11_Edge.a, 0) = COALESCE(t_13_Edge.b, 0) AND (t_11_Edge.a IS NULL) = (t_13_Edge.b IS NULL)) AND
        (t_13_Edge.a = 1)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_16_Edge.b AS x
FROM
  t_0_Reach_RecursiveCte AS t_15_Reach_RecursiveCte, t_2_Edge AS t_16_Edge
WHERE
  (COALESCE(t_16_Edge.a, 0) = COALESCE(t_15_Reach_RecursiveCte.x, 0) AND (t_16_Edge.a IS NULL) = (t_15_Reach_RecursiveCte.x IS NULL)))
SELECT
  Reach_RecursiveCte.x AS x
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x ORDER BY x;