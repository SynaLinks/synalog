-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Local AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
   UNION ALL
  
    SELECT
      'z' AS a,
      'w' AS b
   UNION ALL
  
    SELECT
      'p' AS a,
      'q' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_RecursiveCte_f1 AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Local.a AS a,
        Local.b AS b,
        0 AS synalog_step
      FROM
        t_2_Local AS Local
     UNION ALL
    
      SELECT
        t_5_Local.a AS a,
        t_3_Local.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Local AS t_5_Local, t_2_Local AS t_3_Local
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_3_Local.a, '') = COALESCE(t_5_Local.b, '') AND (t_3_Local.a IS NULL) = (t_5_Local.b IS NULL))
     UNION ALL
    
      SELECT
        t_11_Local.a AS a,
        t_7_Local.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Local AS t_11_Local, t_2_Local AS t_9_Local, t_2_Local AS t_7_Local
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_7_Local.a, '') = COALESCE(t_9_Local.b, '') AND (t_7_Local.a IS NULL) = (t_9_Local.b IS NULL)) AND
        (COALESCE(t_9_Local.a, '') = COALESCE(t_11_Local.b, '') AND (t_9_Local.a IS NULL) = (t_11_Local.b IS NULL))
     UNION ALL
    
      SELECT
        t_19_Local.a AS a,
        t_13_Local.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Local AS t_19_Local, t_2_Local AS t_17_Local, t_2_Local AS t_15_Local, t_2_Local AS t_13_Local
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_13_Local.a, '') = COALESCE(t_15_Local.b, '') AND (t_13_Local.a IS NULL) = (t_15_Local.b IS NULL)) AND
        (COALESCE(t_15_Local.a, '') = COALESCE(t_17_Local.b, '') AND (t_15_Local.a IS NULL) = (t_17_Local.b IS NULL)) AND
        (COALESCE(t_17_Local.a, '') = COALESCE(t_19_Local.b, '') AND (t_17_Local.a IS NULL) = (t_19_Local.b IS NULL))
     UNION ALL
    
      SELECT
        t_29_Local.a AS a,
        t_21_Local.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Local AS t_29_Local, t_2_Local AS t_27_Local, t_2_Local AS t_25_Local, t_2_Local AS t_23_Local, t_2_Local AS t_21_Local
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_21_Local.a, '') = COALESCE(t_23_Local.b, '') AND (t_21_Local.a IS NULL) = (t_23_Local.b IS NULL)) AND
        (COALESCE(t_23_Local.a, '') = COALESCE(t_25_Local.b, '') AND (t_23_Local.a IS NULL) = (t_25_Local.b IS NULL)) AND
        (COALESCE(t_25_Local.a, '') = COALESCE(t_27_Local.b, '') AND (t_25_Local.a IS NULL) = (t_27_Local.b IS NULL)) AND
        (COALESCE(t_27_Local.a, '') = COALESCE(t_29_Local.b, '') AND (t_27_Local.a IS NULL) = (t_29_Local.b IS NULL))
     UNION ALL
    
      SELECT
        t_41_Local.a AS a,
        t_31_Local.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Local AS t_41_Local, t_2_Local AS t_39_Local, t_2_Local AS t_37_Local, t_2_Local AS t_35_Local, t_2_Local AS t_33_Local, t_2_Local AS t_31_Local
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_31_Local.a, '') = COALESCE(t_33_Local.b, '') AND (t_31_Local.a IS NULL) = (t_33_Local.b IS NULL)) AND
        (COALESCE(t_33_Local.a, '') = COALESCE(t_35_Local.b, '') AND (t_33_Local.a IS NULL) = (t_35_Local.b IS NULL)) AND
        (COALESCE(t_35_Local.a, '') = COALESCE(t_37_Local.b, '') AND (t_35_Local.a IS NULL) = (t_37_Local.b IS NULL)) AND
        (COALESCE(t_37_Local.a, '') = COALESCE(t_39_Local.b, '') AND (t_37_Local.a IS NULL) = (t_39_Local.b IS NULL)) AND
        (COALESCE(t_39_Local.a, '') = COALESCE(t_41_Local.b, '') AND (t_39_Local.a IS NULL) = (t_41_Local.b IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Graph_Reach_RecursiveCte_f1.a AS a,
  t_43_Local.b AS b,
  ((t_42_Graph_Reach_RecursiveCte_f1.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Graph_Reach_RecursiveCte_f1 AS t_42_Graph_Reach_RecursiveCte_f1, t_2_Local AS t_43_Local
WHERE
  (t_42_Graph_Reach_RecursiveCte_f1.synalog_step < 8) AND
  (COALESCE(t_43_Local.a, '') = COALESCE(t_42_Graph_Reach_RecursiveCte_f1.b, '') AND (t_43_Local.a IS NULL) = (t_42_Graph_Reach_RecursiveCte_f1.b IS NULL))),
t_0_R AS (SELECT
  Graph_Reach_RecursiveCte_f1.a AS a,
  Graph_Reach_RecursiveCte_f1.b AS b
FROM
  t_1_Graph_Reach_RecursiveCte_f1 AS Graph_Reach_RecursiveCte_f1
GROUP BY Graph_Reach_RecursiveCte_f1.a, Graph_Reach_RecursiveCte_f1.b)
SELECT
  R.b AS b
FROM
  t_0_R AS R
WHERE
  (R.a = 'w');