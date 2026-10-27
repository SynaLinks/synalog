-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      'a' AS x,
      'b' AS y
   UNION ALL
  
    SELECT
      'b' AS x,
      'c' AS y
   UNION ALL
  
    SELECT
      'c' AS x,
      'd' AS y
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Edge.x AS x,
        Edge.y AS y,
        0 AS synalog_step
      FROM
        t_2_Edge AS Edge
     UNION ALL
    
      SELECT
        t_5_Edge.x AS x,
        t_3_Edge.y AS y,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_5_Edge, t_2_Edge AS t_3_Edge
      WHERE
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_3_Edge.x, '') = COALESCE(t_5_Edge.y, '') AND (t_3_Edge.x IS NULL) = (t_5_Edge.y IS NULL))
     UNION ALL
    
      SELECT
        t_11_Edge.x AS x,
        t_7_Edge.y AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge, t_2_Edge AS t_7_Edge
      WHERE
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_7_Edge.x, '') = COALESCE(t_9_Edge.y, '') AND (t_7_Edge.x IS NULL) = (t_9_Edge.y IS NULL)) AND
        (COALESCE(t_9_Edge.x, '') = COALESCE(t_11_Edge.y, '') AND (t_9_Edge.x IS NULL) = (t_11_Edge.y IS NULL))
     UNION ALL
    
      SELECT
        t_19_Edge.x AS x,
        t_13_Edge.y AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_19_Edge, t_2_Edge AS t_17_Edge, t_2_Edge AS t_15_Edge, t_2_Edge AS t_13_Edge
      WHERE
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_13_Edge.x, '') = COALESCE(t_15_Edge.y, '') AND (t_13_Edge.x IS NULL) = (t_15_Edge.y IS NULL)) AND
        (COALESCE(t_15_Edge.x, '') = COALESCE(t_17_Edge.y, '') AND (t_15_Edge.x IS NULL) = (t_17_Edge.y IS NULL)) AND
        (COALESCE(t_17_Edge.x, '') = COALESCE(t_19_Edge.y, '') AND (t_17_Edge.x IS NULL) = (t_19_Edge.y IS NULL))
     UNION ALL
    
      SELECT
        t_29_Edge.x AS x,
        t_21_Edge.y AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_29_Edge, t_2_Edge AS t_27_Edge, t_2_Edge AS t_25_Edge, t_2_Edge AS t_23_Edge, t_2_Edge AS t_21_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_21_Edge.x, '') = COALESCE(t_23_Edge.y, '') AND (t_21_Edge.x IS NULL) = (t_23_Edge.y IS NULL)) AND
        (COALESCE(t_23_Edge.x, '') = COALESCE(t_25_Edge.y, '') AND (t_23_Edge.x IS NULL) = (t_25_Edge.y IS NULL)) AND
        (COALESCE(t_25_Edge.x, '') = COALESCE(t_27_Edge.y, '') AND (t_25_Edge.x IS NULL) = (t_27_Edge.y IS NULL)) AND
        (COALESCE(t_27_Edge.x, '') = COALESCE(t_29_Edge.y, '') AND (t_27_Edge.x IS NULL) = (t_29_Edge.y IS NULL))
     UNION ALL
    
      SELECT
        t_41_Edge.x AS x,
        t_31_Edge.y AS y,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_41_Edge, t_2_Edge AS t_39_Edge, t_2_Edge AS t_37_Edge, t_2_Edge AS t_35_Edge, t_2_Edge AS t_33_Edge, t_2_Edge AS t_31_Edge
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_31_Edge.x, '') = COALESCE(t_33_Edge.y, '') AND (t_31_Edge.x IS NULL) = (t_33_Edge.y IS NULL)) AND
        (COALESCE(t_33_Edge.x, '') = COALESCE(t_35_Edge.y, '') AND (t_33_Edge.x IS NULL) = (t_35_Edge.y IS NULL)) AND
        (COALESCE(t_35_Edge.x, '') = COALESCE(t_37_Edge.y, '') AND (t_35_Edge.x IS NULL) = (t_37_Edge.y IS NULL)) AND
        (COALESCE(t_37_Edge.x, '') = COALESCE(t_39_Edge.y, '') AND (t_37_Edge.x IS NULL) = (t_39_Edge.y IS NULL)) AND
        (COALESCE(t_39_Edge.x, '') = COALESCE(t_41_Edge.y, '') AND (t_39_Edge.x IS NULL) = (t_41_Edge.y IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Reach_RecursiveCte.x AS x,
  t_43_Edge.y AS y,
  ((t_42_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_42_Reach_RecursiveCte, t_2_Edge AS t_43_Edge
WHERE
  (t_42_Reach_RecursiveCte.synalog_step < 10) AND
  (COALESCE(t_43_Edge.x, '') = COALESCE(t_42_Reach_RecursiveCte.y, '') AND (t_43_Edge.x IS NULL) = (t_42_Reach_RecursiveCte.y IS NULL))),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;