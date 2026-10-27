-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_3_Manages AS (SELECT * FROM (
  
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
t_2_Under_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Manages.boss AS boss,
        Manages.report AS report,
        0 AS synalog_step
      FROM
        t_3_Manages AS Manages
     UNION ALL
    
      SELECT
        t_6_Manages.boss AS boss,
        t_4_Manages.report AS report,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_6_Manages, t_3_Manages AS t_4_Manages
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_4_Manages.boss IS NOT DISTINCT FROM t_6_Manages.report)
     UNION ALL
    
      SELECT
        t_12_Manages.boss AS boss,
        t_8_Manages.report AS report,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_12_Manages, t_3_Manages AS t_10_Manages, t_3_Manages AS t_8_Manages
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_8_Manages.boss IS NOT DISTINCT FROM t_10_Manages.report) AND
        (t_10_Manages.boss IS NOT DISTINCT FROM t_12_Manages.report)
     UNION ALL
    
      SELECT
        t_20_Manages.boss AS boss,
        t_14_Manages.report AS report,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_20_Manages, t_3_Manages AS t_18_Manages, t_3_Manages AS t_16_Manages, t_3_Manages AS t_14_Manages
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_14_Manages.boss IS NOT DISTINCT FROM t_16_Manages.report) AND
        (t_16_Manages.boss IS NOT DISTINCT FROM t_18_Manages.report) AND
        (t_18_Manages.boss IS NOT DISTINCT FROM t_20_Manages.report)
     UNION ALL
    
      SELECT
        t_30_Manages.boss AS boss,
        t_22_Manages.report AS report,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_30_Manages, t_3_Manages AS t_28_Manages, t_3_Manages AS t_26_Manages, t_3_Manages AS t_24_Manages, t_3_Manages AS t_22_Manages
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_22_Manages.boss IS NOT DISTINCT FROM t_24_Manages.report) AND
        (t_24_Manages.boss IS NOT DISTINCT FROM t_26_Manages.report) AND
        (t_26_Manages.boss IS NOT DISTINCT FROM t_28_Manages.report) AND
        (t_28_Manages.boss IS NOT DISTINCT FROM t_30_Manages.report)
     UNION ALL
    
      SELECT
        t_42_Manages.boss AS boss,
        t_32_Manages.report AS report,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_Manages AS t_42_Manages, t_3_Manages AS t_40_Manages, t_3_Manages AS t_38_Manages, t_3_Manages AS t_36_Manages, t_3_Manages AS t_34_Manages, t_3_Manages AS t_32_Manages
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_32_Manages.boss IS NOT DISTINCT FROM t_34_Manages.report) AND
        (t_34_Manages.boss IS NOT DISTINCT FROM t_36_Manages.report) AND
        (t_36_Manages.boss IS NOT DISTINCT FROM t_38_Manages.report) AND
        (t_38_Manages.boss IS NOT DISTINCT FROM t_40_Manages.report) AND
        (t_40_Manages.boss IS NOT DISTINCT FROM t_42_Manages.report)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_43_Under_RecursiveCte.boss AS boss,
  t_44_Manages.report AS report,
  ((t_43_Under_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_Under_RecursiveCte AS t_43_Under_RecursiveCte, t_3_Manages AS t_44_Manages
WHERE
  (t_43_Under_RecursiveCte.synalog_step < 8) AND
  (t_44_Manages.boss IS NOT DISTINCT FROM t_43_Under_RecursiveCte.report)),
t_1_Under AS (SELECT
  Under_RecursiveCte.boss AS boss,
  Under_RecursiveCte.report AS report
FROM
  t_2_Under_RecursiveCte AS Under_RecursiveCte
GROUP BY Under_RecursiveCte.boss, Under_RecursiveCte.report)
SELECT
  Under.boss AS boss
FROM
  t_1_Under AS Under, t_1_Under AS t_0_Under
WHERE
  (Under.report = 'sre1') AND
  (t_0_Under.boss IS NOT DISTINCT FROM Under.boss) AND
  (t_0_Under.report = 'sre2') ORDER BY boss;