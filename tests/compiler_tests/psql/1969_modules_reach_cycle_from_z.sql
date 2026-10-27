-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Loop AS (SELECT * FROM (
  
    SELECT
      'x' AS a,
      'y' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'x' AS b
   UNION ALL
  
    SELECT
      'y' AS a,
      'z' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Graph_Reach_RecursiveCte_f1 AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Loop.a AS a,
        Loop.b AS b,
        0 AS synalog_step
      FROM
        t_2_Loop AS Loop
     UNION ALL
    
      SELECT
        t_5_Loop.a AS a,
        t_3_Loop.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Loop AS t_5_Loop, t_2_Loop AS t_3_Loop
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_3_Loop.a, '') = COALESCE(t_5_Loop.b, '') AND (t_3_Loop.a IS NULL) = (t_5_Loop.b IS NULL))
     UNION ALL
    
      SELECT
        t_11_Loop.a AS a,
        t_7_Loop.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Loop AS t_11_Loop, t_2_Loop AS t_9_Loop, t_2_Loop AS t_7_Loop
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_7_Loop.a, '') = COALESCE(t_9_Loop.b, '') AND (t_7_Loop.a IS NULL) = (t_9_Loop.b IS NULL)) AND
        (COALESCE(t_9_Loop.a, '') = COALESCE(t_11_Loop.b, '') AND (t_9_Loop.a IS NULL) = (t_11_Loop.b IS NULL))
     UNION ALL
    
      SELECT
        t_19_Loop.a AS a,
        t_13_Loop.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Loop AS t_19_Loop, t_2_Loop AS t_17_Loop, t_2_Loop AS t_15_Loop, t_2_Loop AS t_13_Loop
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_13_Loop.a, '') = COALESCE(t_15_Loop.b, '') AND (t_13_Loop.a IS NULL) = (t_15_Loop.b IS NULL)) AND
        (COALESCE(t_15_Loop.a, '') = COALESCE(t_17_Loop.b, '') AND (t_15_Loop.a IS NULL) = (t_17_Loop.b IS NULL)) AND
        (COALESCE(t_17_Loop.a, '') = COALESCE(t_19_Loop.b, '') AND (t_17_Loop.a IS NULL) = (t_19_Loop.b IS NULL))
     UNION ALL
    
      SELECT
        t_29_Loop.a AS a,
        t_21_Loop.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Loop AS t_29_Loop, t_2_Loop AS t_27_Loop, t_2_Loop AS t_25_Loop, t_2_Loop AS t_23_Loop, t_2_Loop AS t_21_Loop
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_21_Loop.a, '') = COALESCE(t_23_Loop.b, '') AND (t_21_Loop.a IS NULL) = (t_23_Loop.b IS NULL)) AND
        (COALESCE(t_23_Loop.a, '') = COALESCE(t_25_Loop.b, '') AND (t_23_Loop.a IS NULL) = (t_25_Loop.b IS NULL)) AND
        (COALESCE(t_25_Loop.a, '') = COALESCE(t_27_Loop.b, '') AND (t_25_Loop.a IS NULL) = (t_27_Loop.b IS NULL)) AND
        (COALESCE(t_27_Loop.a, '') = COALESCE(t_29_Loop.b, '') AND (t_27_Loop.a IS NULL) = (t_29_Loop.b IS NULL))
     UNION ALL
    
      SELECT
        t_41_Loop.a AS a,
        t_31_Loop.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Loop AS t_41_Loop, t_2_Loop AS t_39_Loop, t_2_Loop AS t_37_Loop, t_2_Loop AS t_35_Loop, t_2_Loop AS t_33_Loop, t_2_Loop AS t_31_Loop
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_31_Loop.a, '') = COALESCE(t_33_Loop.b, '') AND (t_31_Loop.a IS NULL) = (t_33_Loop.b IS NULL)) AND
        (COALESCE(t_33_Loop.a, '') = COALESCE(t_35_Loop.b, '') AND (t_33_Loop.a IS NULL) = (t_35_Loop.b IS NULL)) AND
        (COALESCE(t_35_Loop.a, '') = COALESCE(t_37_Loop.b, '') AND (t_35_Loop.a IS NULL) = (t_37_Loop.b IS NULL)) AND
        (COALESCE(t_37_Loop.a, '') = COALESCE(t_39_Loop.b, '') AND (t_37_Loop.a IS NULL) = (t_39_Loop.b IS NULL)) AND
        (COALESCE(t_39_Loop.a, '') = COALESCE(t_41_Loop.b, '') AND (t_39_Loop.a IS NULL) = (t_41_Loop.b IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Graph_Reach_RecursiveCte_f1.a AS a,
  t_43_Loop.b AS b,
  ((t_42_Graph_Reach_RecursiveCte_f1.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Graph_Reach_RecursiveCte_f1 AS t_42_Graph_Reach_RecursiveCte_f1, t_2_Loop AS t_43_Loop
WHERE
  (t_42_Graph_Reach_RecursiveCte_f1.synalog_step < 8) AND
  (COALESCE(t_43_Loop.a, '') = COALESCE(t_42_Graph_Reach_RecursiveCte_f1.b, '') AND (t_43_Loop.a IS NULL) = (t_42_Graph_Reach_RecursiveCte_f1.b IS NULL))),
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
  (R.a = 'z');