-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_Influenced AS (SELECT * FROM (
  
    SELECT
      'austen' AS a,
      'tolkien' AS b
   UNION ALL
  
    SELECT
      'tolkien' AS a,
      'herbert' AS b
   UNION ALL
  
    SELECT
      'herbert' AS a,
      'gibson' AS b
   UNION ALL
  
    SELECT
      'asimov' AS a,
      'herbert' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Down_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Influenced.a AS a,
        Influenced.b AS b,
        0 AS synalog_step
      FROM
        t_2_Influenced AS Influenced
     UNION ALL
    
      SELECT
        t_5_Influenced.a AS a,
        t_3_Influenced.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_5_Influenced, t_2_Influenced AS t_3_Influenced
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_3_Influenced.a, '') = COALESCE(t_5_Influenced.b, '') AND (t_3_Influenced.a IS NULL) = (t_5_Influenced.b IS NULL))
     UNION ALL
    
      SELECT
        t_11_Influenced.a AS a,
        t_7_Influenced.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_11_Influenced, t_2_Influenced AS t_9_Influenced, t_2_Influenced AS t_7_Influenced
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_7_Influenced.a, '') = COALESCE(t_9_Influenced.b, '') AND (t_7_Influenced.a IS NULL) = (t_9_Influenced.b IS NULL)) AND
        (COALESCE(t_9_Influenced.a, '') = COALESCE(t_11_Influenced.b, '') AND (t_9_Influenced.a IS NULL) = (t_11_Influenced.b IS NULL))
     UNION ALL
    
      SELECT
        t_19_Influenced.a AS a,
        t_13_Influenced.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_19_Influenced, t_2_Influenced AS t_17_Influenced, t_2_Influenced AS t_15_Influenced, t_2_Influenced AS t_13_Influenced
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_13_Influenced.a, '') = COALESCE(t_15_Influenced.b, '') AND (t_13_Influenced.a IS NULL) = (t_15_Influenced.b IS NULL)) AND
        (COALESCE(t_15_Influenced.a, '') = COALESCE(t_17_Influenced.b, '') AND (t_15_Influenced.a IS NULL) = (t_17_Influenced.b IS NULL)) AND
        (COALESCE(t_17_Influenced.a, '') = COALESCE(t_19_Influenced.b, '') AND (t_17_Influenced.a IS NULL) = (t_19_Influenced.b IS NULL))
     UNION ALL
    
      SELECT
        t_29_Influenced.a AS a,
        t_21_Influenced.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_29_Influenced, t_2_Influenced AS t_27_Influenced, t_2_Influenced AS t_25_Influenced, t_2_Influenced AS t_23_Influenced, t_2_Influenced AS t_21_Influenced
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_21_Influenced.a, '') = COALESCE(t_23_Influenced.b, '') AND (t_21_Influenced.a IS NULL) = (t_23_Influenced.b IS NULL)) AND
        (COALESCE(t_23_Influenced.a, '') = COALESCE(t_25_Influenced.b, '') AND (t_23_Influenced.a IS NULL) = (t_25_Influenced.b IS NULL)) AND
        (COALESCE(t_25_Influenced.a, '') = COALESCE(t_27_Influenced.b, '') AND (t_25_Influenced.a IS NULL) = (t_27_Influenced.b IS NULL)) AND
        (COALESCE(t_27_Influenced.a, '') = COALESCE(t_29_Influenced.b, '') AND (t_27_Influenced.a IS NULL) = (t_29_Influenced.b IS NULL))
     UNION ALL
    
      SELECT
        t_41_Influenced.a AS a,
        t_31_Influenced.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Influenced AS t_41_Influenced, t_2_Influenced AS t_39_Influenced, t_2_Influenced AS t_37_Influenced, t_2_Influenced AS t_35_Influenced, t_2_Influenced AS t_33_Influenced, t_2_Influenced AS t_31_Influenced
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (COALESCE(t_31_Influenced.a, '') = COALESCE(t_33_Influenced.b, '') AND (t_31_Influenced.a IS NULL) = (t_33_Influenced.b IS NULL)) AND
        (COALESCE(t_33_Influenced.a, '') = COALESCE(t_35_Influenced.b, '') AND (t_33_Influenced.a IS NULL) = (t_35_Influenced.b IS NULL)) AND
        (COALESCE(t_35_Influenced.a, '') = COALESCE(t_37_Influenced.b, '') AND (t_35_Influenced.a IS NULL) = (t_37_Influenced.b IS NULL)) AND
        (COALESCE(t_37_Influenced.a, '') = COALESCE(t_39_Influenced.b, '') AND (t_37_Influenced.a IS NULL) = (t_39_Influenced.b IS NULL)) AND
        (COALESCE(t_39_Influenced.a, '') = COALESCE(t_41_Influenced.b, '') AND (t_39_Influenced.a IS NULL) = (t_41_Influenced.b IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Down_RecursiveCte.a AS a,
  t_43_Influenced.b AS b,
  ((t_42_Down_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Down_RecursiveCte AS t_42_Down_RecursiveCte, t_2_Influenced AS t_43_Influenced
WHERE
  (t_42_Down_RecursiveCte.synalog_step < 6) AND
  (COALESCE(t_43_Influenced.a, '') = COALESCE(t_42_Down_RecursiveCte.b, '') AND (t_43_Influenced.a IS NULL) = (t_42_Down_RecursiveCte.b IS NULL))),
t_0_Down AS (SELECT
  Down_RecursiveCte.a AS a,
  Down_RecursiveCte.b AS b
FROM
  t_1_Down_RecursiveCte AS Down_RecursiveCte
GROUP BY Down_RecursiveCte.a, Down_RecursiveCte.b)
SELECT
  Down.a AS a
FROM
  t_0_Down AS Down
WHERE
  (Down.b = 'herbert') ORDER BY a;