-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_4_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
t_3_Under_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Manages.boss AS boss,
        Manages.report AS report,
        0 AS synalog_step
      FROM
        t_4_Manages AS Manages
     UNION ALL
    
      SELECT
        t_7_Manages.boss AS boss,
        t_5_Manages.report AS report,
        ((0) + (1)) AS synalog_step
      FROM
        t_4_Manages AS t_7_Manages, t_4_Manages AS t_5_Manages
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_5_Manages.boss, '') = COALESCE(t_7_Manages.report, '') AND (t_5_Manages.boss IS NULL) = (t_7_Manages.report IS NULL))
     UNION ALL
    
      SELECT
        t_13_Manages.boss AS boss,
        t_9_Manages.report AS report,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_4_Manages AS t_13_Manages, t_4_Manages AS t_11_Manages, t_4_Manages AS t_9_Manages
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_9_Manages.boss, '') = COALESCE(t_11_Manages.report, '') AND (t_9_Manages.boss IS NULL) = (t_11_Manages.report IS NULL)) AND
        (COALESCE(t_11_Manages.boss, '') = COALESCE(t_13_Manages.report, '') AND (t_11_Manages.boss IS NULL) = (t_13_Manages.report IS NULL))
     UNION ALL
    
      SELECT
        t_21_Manages.boss AS boss,
        t_15_Manages.report AS report,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_4_Manages AS t_21_Manages, t_4_Manages AS t_19_Manages, t_4_Manages AS t_17_Manages, t_4_Manages AS t_15_Manages
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_15_Manages.boss, '') = COALESCE(t_17_Manages.report, '') AND (t_15_Manages.boss IS NULL) = (t_17_Manages.report IS NULL)) AND
        (COALESCE(t_17_Manages.boss, '') = COALESCE(t_19_Manages.report, '') AND (t_17_Manages.boss IS NULL) = (t_19_Manages.report IS NULL)) AND
        (COALESCE(t_19_Manages.boss, '') = COALESCE(t_21_Manages.report, '') AND (t_19_Manages.boss IS NULL) = (t_21_Manages.report IS NULL))
     UNION ALL
    
      SELECT
        t_31_Manages.boss AS boss,
        t_23_Manages.report AS report,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_4_Manages AS t_31_Manages, t_4_Manages AS t_29_Manages, t_4_Manages AS t_27_Manages, t_4_Manages AS t_25_Manages, t_4_Manages AS t_23_Manages
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_23_Manages.boss, '') = COALESCE(t_25_Manages.report, '') AND (t_23_Manages.boss IS NULL) = (t_25_Manages.report IS NULL)) AND
        (COALESCE(t_25_Manages.boss, '') = COALESCE(t_27_Manages.report, '') AND (t_25_Manages.boss IS NULL) = (t_27_Manages.report IS NULL)) AND
        (COALESCE(t_27_Manages.boss, '') = COALESCE(t_29_Manages.report, '') AND (t_27_Manages.boss IS NULL) = (t_29_Manages.report IS NULL)) AND
        (COALESCE(t_29_Manages.boss, '') = COALESCE(t_31_Manages.report, '') AND (t_29_Manages.boss IS NULL) = (t_31_Manages.report IS NULL))
     UNION ALL
    
      SELECT
        t_43_Manages.boss AS boss,
        t_33_Manages.report AS report,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_4_Manages AS t_43_Manages, t_4_Manages AS t_41_Manages, t_4_Manages AS t_39_Manages, t_4_Manages AS t_37_Manages, t_4_Manages AS t_35_Manages, t_4_Manages AS t_33_Manages
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (COALESCE(t_33_Manages.boss, '') = COALESCE(t_35_Manages.report, '') AND (t_33_Manages.boss IS NULL) = (t_35_Manages.report IS NULL)) AND
        (COALESCE(t_35_Manages.boss, '') = COALESCE(t_37_Manages.report, '') AND (t_35_Manages.boss IS NULL) = (t_37_Manages.report IS NULL)) AND
        (COALESCE(t_37_Manages.boss, '') = COALESCE(t_39_Manages.report, '') AND (t_37_Manages.boss IS NULL) = (t_39_Manages.report IS NULL)) AND
        (COALESCE(t_39_Manages.boss, '') = COALESCE(t_41_Manages.report, '') AND (t_39_Manages.boss IS NULL) = (t_41_Manages.report IS NULL)) AND
        (COALESCE(t_41_Manages.boss, '') = COALESCE(t_43_Manages.report, '') AND (t_41_Manages.boss IS NULL) = (t_43_Manages.report IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_44_Under_RecursiveCte.boss AS boss,
  t_45_Manages.report AS report,
  ((t_44_Under_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_Under_RecursiveCte AS t_44_Under_RecursiveCte, t_4_Manages AS t_45_Manages
WHERE
  (t_44_Under_RecursiveCte.synalog_step < 8) AND
  (COALESCE(t_45_Manages.boss, '') = COALESCE(t_44_Under_RecursiveCte.report, '') AND (t_45_Manages.boss IS NULL) = (t_44_Under_RecursiveCte.report IS NULL))),
t_2_Under AS (SELECT
  Under_RecursiveCte.boss AS boss,
  Under_RecursiveCte.report AS report
FROM
  t_3_Under_RecursiveCte AS Under_RecursiveCte
GROUP BY Under_RecursiveCte.boss, Under_RecursiveCte.report),
t_1_N AS (SELECT
  Under.report AS report,
  SUM(1) AS n
FROM
  t_2_Under AS Under
GROUP BY Under.report)
SELECT
  t_0_N.report AS report
FROM
  t_1_N AS t_0_N
WHERE
  (t_0_N.n >= 3) ORDER BY report;