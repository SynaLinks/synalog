-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_2_Manages AS (SELECT * FROM (
  
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
t_1_Under_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Manages.boss AS boss,
        Manages.report AS report,
        0 AS synalog_step
      FROM
        t_2_Manages AS Manages
     UNION ALL
    
      SELECT
        t_5_Manages.boss AS boss,
        t_3_Manages.report AS report,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_5_Manages, t_2_Manages AS t_3_Manages
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_3_Manages.boss IS NOT DISTINCT FROM t_5_Manages.report)
     UNION ALL
    
      SELECT
        t_11_Manages.boss AS boss,
        t_7_Manages.report AS report,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_11_Manages, t_2_Manages AS t_9_Manages, t_2_Manages AS t_7_Manages
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_7_Manages.boss IS NOT DISTINCT FROM t_9_Manages.report) AND
        (t_9_Manages.boss IS NOT DISTINCT FROM t_11_Manages.report)
     UNION ALL
    
      SELECT
        t_19_Manages.boss AS boss,
        t_13_Manages.report AS report,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_19_Manages, t_2_Manages AS t_17_Manages, t_2_Manages AS t_15_Manages, t_2_Manages AS t_13_Manages
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_13_Manages.boss IS NOT DISTINCT FROM t_15_Manages.report) AND
        (t_15_Manages.boss IS NOT DISTINCT FROM t_17_Manages.report) AND
        (t_17_Manages.boss IS NOT DISTINCT FROM t_19_Manages.report)
     UNION ALL
    
      SELECT
        t_29_Manages.boss AS boss,
        t_21_Manages.report AS report,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_29_Manages, t_2_Manages AS t_27_Manages, t_2_Manages AS t_25_Manages, t_2_Manages AS t_23_Manages, t_2_Manages AS t_21_Manages
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_21_Manages.boss IS NOT DISTINCT FROM t_23_Manages.report) AND
        (t_23_Manages.boss IS NOT DISTINCT FROM t_25_Manages.report) AND
        (t_25_Manages.boss IS NOT DISTINCT FROM t_27_Manages.report) AND
        (t_27_Manages.boss IS NOT DISTINCT FROM t_29_Manages.report)
     UNION ALL
    
      SELECT
        t_41_Manages.boss AS boss,
        t_31_Manages.report AS report,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Manages AS t_41_Manages, t_2_Manages AS t_39_Manages, t_2_Manages AS t_37_Manages, t_2_Manages AS t_35_Manages, t_2_Manages AS t_33_Manages, t_2_Manages AS t_31_Manages
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_31_Manages.boss IS NOT DISTINCT FROM t_33_Manages.report) AND
        (t_33_Manages.boss IS NOT DISTINCT FROM t_35_Manages.report) AND
        (t_35_Manages.boss IS NOT DISTINCT FROM t_37_Manages.report) AND
        (t_37_Manages.boss IS NOT DISTINCT FROM t_39_Manages.report) AND
        (t_39_Manages.boss IS NOT DISTINCT FROM t_41_Manages.report)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Under_RecursiveCte.boss AS boss,
  t_43_Manages.report AS report,
  ((t_42_Under_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Under_RecursiveCte AS t_42_Under_RecursiveCte, t_2_Manages AS t_43_Manages
WHERE
  (t_42_Under_RecursiveCte.synalog_step < 8) AND
  (t_43_Manages.boss IS NOT DISTINCT FROM t_42_Under_RecursiveCte.report)),
t_0_Under AS (SELECT
  Under_RecursiveCte.boss AS boss,
  Under_RecursiveCte.report AS report
FROM
  t_1_Under_RecursiveCte AS Under_RecursiveCte
GROUP BY Under_RecursiveCte.boss, Under_RecursiveCte.report)
SELECT
  Under.report AS report
FROM
  t_0_Under AS Under
WHERE
  (Under.boss = 'cto') ORDER BY report;