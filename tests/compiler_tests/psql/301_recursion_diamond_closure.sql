-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      's' AS a,
      'l' AS b
   UNION ALL
  
    SELECT
      's' AS a,
      'r' AS b
   UNION ALL
  
    SELECT
      'l' AS a,
      't' AS b
   UNION ALL
  
    SELECT
      'r' AS a,
      't' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Reach_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Edge.a AS a,
        Edge.b AS b,
        0 AS synalog_step
      FROM
        t_2_Edge AS Edge
     UNION ALL
    
      SELECT
        t_5_Edge.a AS a,
        t_3_Edge.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_5_Edge, t_2_Edge AS t_3_Edge
      WHERE
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_3_Edge.a, '') = COALESCE(t_5_Edge.b, '') AND (t_3_Edge.a IS NULL) = (t_5_Edge.b IS NULL))
     UNION ALL
    
      SELECT
        t_11_Edge.a AS a,
        t_7_Edge.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge, t_2_Edge AS t_7_Edge
      WHERE
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_7_Edge.a, '') = COALESCE(t_9_Edge.b, '') AND (t_7_Edge.a IS NULL) = (t_9_Edge.b IS NULL)) AND
        (COALESCE(t_9_Edge.a, '') = COALESCE(t_11_Edge.b, '') AND (t_9_Edge.a IS NULL) = (t_11_Edge.b IS NULL))
     UNION ALL
    
      SELECT
        t_19_Edge.a AS a,
        t_13_Edge.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_19_Edge, t_2_Edge AS t_17_Edge, t_2_Edge AS t_15_Edge, t_2_Edge AS t_13_Edge
      WHERE
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_13_Edge.a, '') = COALESCE(t_15_Edge.b, '') AND (t_13_Edge.a IS NULL) = (t_15_Edge.b IS NULL)) AND
        (COALESCE(t_15_Edge.a, '') = COALESCE(t_17_Edge.b, '') AND (t_15_Edge.a IS NULL) = (t_17_Edge.b IS NULL)) AND
        (COALESCE(t_17_Edge.a, '') = COALESCE(t_19_Edge.b, '') AND (t_17_Edge.a IS NULL) = (t_19_Edge.b IS NULL))
     UNION ALL
    
      SELECT
        t_29_Edge.a AS a,
        t_21_Edge.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_29_Edge, t_2_Edge AS t_27_Edge, t_2_Edge AS t_25_Edge, t_2_Edge AS t_23_Edge, t_2_Edge AS t_21_Edge
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 10) AND
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (COALESCE(t_21_Edge.a, '') = COALESCE(t_23_Edge.b, '') AND (t_21_Edge.a IS NULL) = (t_23_Edge.b IS NULL)) AND
        (COALESCE(t_23_Edge.a, '') = COALESCE(t_25_Edge.b, '') AND (t_23_Edge.a IS NULL) = (t_25_Edge.b IS NULL)) AND
        (COALESCE(t_25_Edge.a, '') = COALESCE(t_27_Edge.b, '') AND (t_25_Edge.a IS NULL) = (t_27_Edge.b IS NULL)) AND
        (COALESCE(t_27_Edge.a, '') = COALESCE(t_29_Edge.b, '') AND (t_27_Edge.a IS NULL) = (t_29_Edge.b IS NULL))
     UNION ALL
    
      SELECT
        t_41_Edge.a AS a,
        t_31_Edge.b AS b,
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
        (COALESCE(t_31_Edge.a, '') = COALESCE(t_33_Edge.b, '') AND (t_31_Edge.a IS NULL) = (t_33_Edge.b IS NULL)) AND
        (COALESCE(t_33_Edge.a, '') = COALESCE(t_35_Edge.b, '') AND (t_33_Edge.a IS NULL) = (t_35_Edge.b IS NULL)) AND
        (COALESCE(t_35_Edge.a, '') = COALESCE(t_37_Edge.b, '') AND (t_35_Edge.a IS NULL) = (t_37_Edge.b IS NULL)) AND
        (COALESCE(t_37_Edge.a, '') = COALESCE(t_39_Edge.b, '') AND (t_37_Edge.a IS NULL) = (t_39_Edge.b IS NULL)) AND
        (COALESCE(t_39_Edge.a, '') = COALESCE(t_41_Edge.b, '') AND (t_39_Edge.a IS NULL) = (t_41_Edge.b IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Reach_RecursiveCte.a AS a,
  t_43_Edge.b AS b,
  ((t_42_Reach_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Reach_RecursiveCte AS t_42_Reach_RecursiveCte, t_2_Edge AS t_43_Edge
WHERE
  (t_42_Reach_RecursiveCte.synalog_step < 10) AND
  (COALESCE(t_43_Edge.a, '') = COALESCE(t_42_Reach_RecursiveCte.b, '') AND (t_43_Edge.a IS NULL) = (t_42_Reach_RecursiveCte.b IS NULL))),
t_0_Reach AS (SELECT
  Reach_RecursiveCte.a AS a,
  Reach_RecursiveCte.b AS b
FROM
  t_1_Reach_RecursiveCte AS Reach_RecursiveCte
GROUP BY Reach_RecursiveCte.a, Reach_RecursiveCte.b)
SELECT
  SUM(1) AS n
FROM
  t_0_Reach AS Reach;