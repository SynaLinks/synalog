-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_1_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS "from",
      2 AS "to"
   UNION ALL
  
    SELECT
      2 AS "from",
      3 AS "to"
  
) AS UNUSED_TABLE_NAME  ),
t_0_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Edge."to" AS "to",
        0 AS synalog_step
      FROM
        t_1_Edge AS Edge
      WHERE
        (Edge."from" = 1)
     UNION ALL
    
      SELECT
        t_2_Edge."to" AS "to",
        ((0) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_4_Edge, t_1_Edge AS t_2_Edge
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (t_4_Edge."from" = 1) AND
        (COALESCE(t_2_Edge."from", 0) = COALESCE(t_4_Edge."to", 0) AND (t_2_Edge."from" IS NULL) = (t_4_Edge."to" IS NULL))
     UNION ALL
    
      SELECT
        t_6_Edge."to" AS "to",
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_10_Edge, t_1_Edge AS t_8_Edge, t_1_Edge AS t_6_Edge
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_6_Edge."from", 0) = COALESCE(t_8_Edge."to", 0) AND (t_6_Edge."from" IS NULL) = (t_8_Edge."to" IS NULL)) AND
        (t_10_Edge."from" = 1) AND
        (COALESCE(t_8_Edge."from", 0) = COALESCE(t_10_Edge."to", 0) AND (t_8_Edge."from" IS NULL) = (t_10_Edge."to" IS NULL))
     UNION ALL
    
      SELECT
        t_12_Edge."to" AS "to",
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_Edge AS t_18_Edge, t_1_Edge AS t_16_Edge, t_1_Edge AS t_14_Edge, t_1_Edge AS t_12_Edge
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_12_Edge."from", 0) = COALESCE(t_14_Edge."to", 0) AND (t_12_Edge."from" IS NULL) = (t_14_Edge."to" IS NULL)) AND
        (COALESCE(t_14_Edge."from", 0) = COALESCE(t_16_Edge."to", 0) AND (t_14_Edge."from" IS NULL) = (t_16_Edge."to" IS NULL)) AND
        (t_18_Edge."from" = 1) AND
        (COALESCE(t_16_Edge."from", 0) = COALESCE(t_18_Edge."to", 0) AND (t_16_Edge."from" IS NULL) = (t_18_Edge."to" IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_20_Edge."to" AS "to",
  ((t_19_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_Reach_RecursiveCte AS t_19_Reach_RecursiveCte, t_1_Edge AS t_20_Edge
WHERE
  (t_19_Reach_RecursiveCte.synalog_step < 5) AND
  (COALESCE(t_20_Edge."from", 0) = COALESCE(t_19_Reach_RecursiveCte."to", 0) AND (t_20_Edge."from" IS NULL) = (t_19_Reach_RecursiveCte."to" IS NULL)))
SELECT
  Reach_RecursiveCte."to" AS "to"
FROM
  t_0_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte."to" ORDER BY "to";