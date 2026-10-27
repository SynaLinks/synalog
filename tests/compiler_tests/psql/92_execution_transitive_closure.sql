-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_1_Edge AS (SELECT * FROM (
  
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
t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Edge.x AS x,
        Edge.y AS y,
        0 AS synalog_step
      FROM
        t_1_Edge AS Edge
     UNION ALL
    
      SELECT
        t_4_Edge.x AS x,
        t_2_Edge.y AS y,
        ((0) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_4_Edge, t_1_Edge AS t_2_Edge
      WHERE
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_2_Edge.x, '') = COALESCE(t_4_Edge.y, '') AND (t_2_Edge.x IS NULL) = (t_4_Edge.y IS NULL))
     UNION ALL
    
      SELECT
        t_10_Edge.x AS x,
        t_6_Edge.y AS y,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_10_Edge, t_1_Edge AS t_8_Edge, t_1_Edge AS t_6_Edge
      WHERE
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_6_Edge.x, '') = COALESCE(t_8_Edge.y, '') AND (t_6_Edge.x IS NULL) = (t_8_Edge.y IS NULL)) AND
        (COALESCE(t_8_Edge.x, '') = COALESCE(t_10_Edge.y, '') AND (t_8_Edge.x IS NULL) = (t_10_Edge.y IS NULL))
     UNION ALL
    
      SELECT
        t_18_Edge.x AS x,
        t_12_Edge.y AS y,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_18_Edge, t_1_Edge AS t_16_Edge, t_1_Edge AS t_14_Edge, t_1_Edge AS t_12_Edge
      WHERE
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_12_Edge.x, '') = COALESCE(t_14_Edge.y, '') AND (t_12_Edge.x IS NULL) = (t_14_Edge.y IS NULL)) AND
        (COALESCE(t_14_Edge.x, '') = COALESCE(t_16_Edge.y, '') AND (t_14_Edge.x IS NULL) = (t_16_Edge.y IS NULL)) AND
        (COALESCE(t_16_Edge.x, '') = COALESCE(t_18_Edge.y, '') AND (t_16_Edge.x IS NULL) = (t_18_Edge.y IS NULL))
     UNION ALL
    
      SELECT
        t_28_Edge.x AS x,
        t_20_Edge.y AS y,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_28_Edge, t_1_Edge AS t_26_Edge, t_1_Edge AS t_24_Edge, t_1_Edge AS t_22_Edge, t_1_Edge AS t_20_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_20_Edge.x, '') = COALESCE(t_22_Edge.y, '') AND (t_20_Edge.x IS NULL) = (t_22_Edge.y IS NULL)) AND
        (COALESCE(t_22_Edge.x, '') = COALESCE(t_24_Edge.y, '') AND (t_22_Edge.x IS NULL) = (t_24_Edge.y IS NULL)) AND
        (COALESCE(t_24_Edge.x, '') = COALESCE(t_26_Edge.y, '') AND (t_24_Edge.x IS NULL) = (t_26_Edge.y IS NULL)) AND
        (COALESCE(t_26_Edge.x, '') = COALESCE(t_28_Edge.y, '') AND (t_26_Edge.x IS NULL) = (t_28_Edge.y IS NULL))
     UNION ALL
    
      SELECT
        t_40_Edge.x AS x,
        t_30_Edge.y AS y,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_40_Edge, t_1_Edge AS t_38_Edge, t_1_Edge AS t_36_Edge, t_1_Edge AS t_34_Edge, t_1_Edge AS t_32_Edge, t_1_Edge AS t_30_Edge
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 10) AND
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_30_Edge.x, '') = COALESCE(t_32_Edge.y, '') AND (t_30_Edge.x IS NULL) = (t_32_Edge.y IS NULL)) AND
        (COALESCE(t_32_Edge.x, '') = COALESCE(t_34_Edge.y, '') AND (t_32_Edge.x IS NULL) = (t_34_Edge.y IS NULL)) AND
        (COALESCE(t_34_Edge.x, '') = COALESCE(t_36_Edge.y, '') AND (t_34_Edge.x IS NULL) = (t_36_Edge.y IS NULL)) AND
        (COALESCE(t_36_Edge.x, '') = COALESCE(t_38_Edge.y, '') AND (t_36_Edge.x IS NULL) = (t_38_Edge.y IS NULL)) AND
        (COALESCE(t_38_Edge.x, '') = COALESCE(t_40_Edge.y, '') AND (t_38_Edge.x IS NULL) = (t_40_Edge.y IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_41_Reach_RecursiveCte.x AS x,
  t_42_Edge.y AS y,
  ((t_41_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_Reach_RecursiveCte AS t_41_Reach_RecursiveCte, t_1_Edge AS t_42_Edge
WHERE
  (t_41_Reach_RecursiveCte.synalog_step < 10) AND
  (COALESCE(t_42_Edge.x, '') = COALESCE(t_41_Reach_RecursiveCte.y, '') AND (t_42_Edge.x IS NULL) = (t_41_Reach_RecursiveCte.y IS NULL)))
SELECT
  Reach_RecursiveCte.x AS x,
  Reach_RecursiveCte.y AS y
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.x, Reach_RecursiveCte.y ORDER BY x, y;