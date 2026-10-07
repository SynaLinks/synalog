-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_29_Manages AS (SELECT * FROM (
  
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
t_26_Under_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_28_Manages.boss AS boss,
      t_28_Manages.report AS report
    FROM
      t_29_Manages AS t_28_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_25_Under_r0 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f1.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f1.report AS report
FROM
  t_26_Under_MultBodyAggAux_recursive_head_f1 AS Under_MultBodyAggAux_recursive_head_f1
GROUP BY Under_MultBodyAggAux_recursive_head_f1.boss, Under_MultBodyAggAux_recursive_head_f1.report),
t_23_Under_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Under_r0.boss AS boss,
      t_24_Manages.report AS report
    FROM
      t_25_Under_r0 AS Under_r0, t_29_Manages AS t_24_Manages
    WHERE
      (t_24_Manages.boss = Under_r0.report)
   UNION ALL
  
    SELECT
      t_30_Manages.boss AS boss,
      t_30_Manages.report AS report
    FROM
      t_29_Manages AS t_30_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_22_Under_r1 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f2.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f2.report AS report
FROM
  t_23_Under_MultBodyAggAux_recursive_head_f2 AS Under_MultBodyAggAux_recursive_head_f2
GROUP BY Under_MultBodyAggAux_recursive_head_f2.boss, Under_MultBodyAggAux_recursive_head_f2.report),
t_20_Under_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Under_r1.boss AS boss,
      t_21_Manages.report AS report
    FROM
      t_22_Under_r1 AS Under_r1, t_29_Manages AS t_21_Manages
    WHERE
      (t_21_Manages.boss = Under_r1.report)
   UNION ALL
  
    SELECT
      t_31_Manages.boss AS boss,
      t_31_Manages.report AS report
    FROM
      t_29_Manages AS t_31_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_19_Under_r2 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f3.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f3.report AS report
FROM
  t_20_Under_MultBodyAggAux_recursive_head_f3 AS Under_MultBodyAggAux_recursive_head_f3
GROUP BY Under_MultBodyAggAux_recursive_head_f3.boss, Under_MultBodyAggAux_recursive_head_f3.report),
t_17_Under_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Under_r2.boss AS boss,
      t_18_Manages.report AS report
    FROM
      t_19_Under_r2 AS Under_r2, t_29_Manages AS t_18_Manages
    WHERE
      (t_18_Manages.boss = Under_r2.report)
   UNION ALL
  
    SELECT
      t_32_Manages.boss AS boss,
      t_32_Manages.report AS report
    FROM
      t_29_Manages AS t_32_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_16_Under_r3 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f4.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f4.report AS report
FROM
  t_17_Under_MultBodyAggAux_recursive_head_f4 AS Under_MultBodyAggAux_recursive_head_f4
GROUP BY Under_MultBodyAggAux_recursive_head_f4.boss, Under_MultBodyAggAux_recursive_head_f4.report),
t_14_Under_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Under_r3.boss AS boss,
      t_15_Manages.report AS report
    FROM
      t_16_Under_r3 AS Under_r3, t_29_Manages AS t_15_Manages
    WHERE
      (t_15_Manages.boss = Under_r3.report)
   UNION ALL
  
    SELECT
      t_33_Manages.boss AS boss,
      t_33_Manages.report AS report
    FROM
      t_29_Manages AS t_33_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_13_Under_r4 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f5.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f5.report AS report
FROM
  t_14_Under_MultBodyAggAux_recursive_head_f5 AS Under_MultBodyAggAux_recursive_head_f5
GROUP BY Under_MultBodyAggAux_recursive_head_f5.boss, Under_MultBodyAggAux_recursive_head_f5.report),
t_11_Under_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Under_r4.boss AS boss,
      t_12_Manages.report AS report
    FROM
      t_13_Under_r4 AS Under_r4, t_29_Manages AS t_12_Manages
    WHERE
      (t_12_Manages.boss = Under_r4.report)
   UNION ALL
  
    SELECT
      t_34_Manages.boss AS boss,
      t_34_Manages.report AS report
    FROM
      t_29_Manages AS t_34_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_10_Under_r5 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f6.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f6.report AS report
FROM
  t_11_Under_MultBodyAggAux_recursive_head_f6 AS Under_MultBodyAggAux_recursive_head_f6
GROUP BY Under_MultBodyAggAux_recursive_head_f6.boss, Under_MultBodyAggAux_recursive_head_f6.report),
t_8_Under_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Under_r5.boss AS boss,
      t_9_Manages.report AS report
    FROM
      t_10_Under_r5 AS Under_r5, t_29_Manages AS t_9_Manages
    WHERE
      (t_9_Manages.boss = Under_r5.report)
   UNION ALL
  
    SELECT
      t_35_Manages.boss AS boss,
      t_35_Manages.report AS report
    FROM
      t_29_Manages AS t_35_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_7_Under_r6 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f7.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f7.report AS report
FROM
  t_8_Under_MultBodyAggAux_recursive_head_f7 AS Under_MultBodyAggAux_recursive_head_f7
GROUP BY Under_MultBodyAggAux_recursive_head_f7.boss, Under_MultBodyAggAux_recursive_head_f7.report),
t_5_Under_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      Under_r6.boss AS boss,
      t_6_Manages.report AS report
    FROM
      t_7_Under_r6 AS Under_r6, t_29_Manages AS t_6_Manages
    WHERE
      (t_6_Manages.boss = Under_r6.report)
   UNION ALL
  
    SELECT
      t_36_Manages.boss AS boss,
      t_36_Manages.report AS report
    FROM
      t_29_Manages AS t_36_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_4_Under_r7 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f8.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f8.report AS report
FROM
  t_5_Under_MultBodyAggAux_recursive_head_f8 AS Under_MultBodyAggAux_recursive_head_f8
GROUP BY Under_MultBodyAggAux_recursive_head_f8.boss, Under_MultBodyAggAux_recursive_head_f8.report),
t_3_Under_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      Under_r7.boss AS boss,
      Manages.report AS report
    FROM
      t_4_Under_r7 AS Under_r7, t_29_Manages AS Manages
    WHERE
      (Manages.boss = Under_r7.report)
   UNION ALL
  
    SELECT
      t_37_Manages.boss AS boss,
      t_37_Manages.report AS report
    FROM
      t_29_Manages AS t_37_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_2_Under AS (SELECT
  Under_MultBodyAggAux_recursive_head_f9.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f9.report AS report
FROM
  t_3_Under_MultBodyAggAux_recursive_head_f9 AS Under_MultBodyAggAux_recursive_head_f9
GROUP BY Under_MultBodyAggAux_recursive_head_f9.boss, Under_MultBodyAggAux_recursive_head_f9.report),
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
