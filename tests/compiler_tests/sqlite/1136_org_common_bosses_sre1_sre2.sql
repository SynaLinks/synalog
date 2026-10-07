WITH t_28_Manages AS (SELECT * FROM (
  
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
t_25_Under_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_27_Manages.boss AS boss,
      t_27_Manages.report AS report
    FROM
      t_28_Manages AS t_27_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_24_Under_r0 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f1.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f1.report AS report
FROM
  t_25_Under_MultBodyAggAux_recursive_head_f1 AS Under_MultBodyAggAux_recursive_head_f1
GROUP BY Under_MultBodyAggAux_recursive_head_f1.boss, Under_MultBodyAggAux_recursive_head_f1.report),
t_22_Under_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Under_r0.boss AS boss,
      t_23_Manages.report AS report
    FROM
      t_24_Under_r0 AS Under_r0, t_28_Manages AS t_23_Manages
    WHERE
      (t_23_Manages.boss = Under_r0.report)
   UNION ALL
  
    SELECT
      t_29_Manages.boss AS boss,
      t_29_Manages.report AS report
    FROM
      t_28_Manages AS t_29_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_21_Under_r1 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f2.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f2.report AS report
FROM
  t_22_Under_MultBodyAggAux_recursive_head_f2 AS Under_MultBodyAggAux_recursive_head_f2
GROUP BY Under_MultBodyAggAux_recursive_head_f2.boss, Under_MultBodyAggAux_recursive_head_f2.report),
t_19_Under_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      Under_r1.boss AS boss,
      t_20_Manages.report AS report
    FROM
      t_21_Under_r1 AS Under_r1, t_28_Manages AS t_20_Manages
    WHERE
      (t_20_Manages.boss = Under_r1.report)
   UNION ALL
  
    SELECT
      t_30_Manages.boss AS boss,
      t_30_Manages.report AS report
    FROM
      t_28_Manages AS t_30_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_18_Under_r2 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f3.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f3.report AS report
FROM
  t_19_Under_MultBodyAggAux_recursive_head_f3 AS Under_MultBodyAggAux_recursive_head_f3
GROUP BY Under_MultBodyAggAux_recursive_head_f3.boss, Under_MultBodyAggAux_recursive_head_f3.report),
t_16_Under_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      Under_r2.boss AS boss,
      t_17_Manages.report AS report
    FROM
      t_18_Under_r2 AS Under_r2, t_28_Manages AS t_17_Manages
    WHERE
      (t_17_Manages.boss = Under_r2.report)
   UNION ALL
  
    SELECT
      t_31_Manages.boss AS boss,
      t_31_Manages.report AS report
    FROM
      t_28_Manages AS t_31_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_15_Under_r3 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f4.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f4.report AS report
FROM
  t_16_Under_MultBodyAggAux_recursive_head_f4 AS Under_MultBodyAggAux_recursive_head_f4
GROUP BY Under_MultBodyAggAux_recursive_head_f4.boss, Under_MultBodyAggAux_recursive_head_f4.report),
t_13_Under_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      Under_r3.boss AS boss,
      t_14_Manages.report AS report
    FROM
      t_15_Under_r3 AS Under_r3, t_28_Manages AS t_14_Manages
    WHERE
      (t_14_Manages.boss = Under_r3.report)
   UNION ALL
  
    SELECT
      t_32_Manages.boss AS boss,
      t_32_Manages.report AS report
    FROM
      t_28_Manages AS t_32_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_12_Under_r4 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f5.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f5.report AS report
FROM
  t_13_Under_MultBodyAggAux_recursive_head_f5 AS Under_MultBodyAggAux_recursive_head_f5
GROUP BY Under_MultBodyAggAux_recursive_head_f5.boss, Under_MultBodyAggAux_recursive_head_f5.report),
t_10_Under_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      Under_r4.boss AS boss,
      t_11_Manages.report AS report
    FROM
      t_12_Under_r4 AS Under_r4, t_28_Manages AS t_11_Manages
    WHERE
      (t_11_Manages.boss = Under_r4.report)
   UNION ALL
  
    SELECT
      t_33_Manages.boss AS boss,
      t_33_Manages.report AS report
    FROM
      t_28_Manages AS t_33_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_9_Under_r5 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f6.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f6.report AS report
FROM
  t_10_Under_MultBodyAggAux_recursive_head_f6 AS Under_MultBodyAggAux_recursive_head_f6
GROUP BY Under_MultBodyAggAux_recursive_head_f6.boss, Under_MultBodyAggAux_recursive_head_f6.report),
t_7_Under_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      Under_r5.boss AS boss,
      t_8_Manages.report AS report
    FROM
      t_9_Under_r5 AS Under_r5, t_28_Manages AS t_8_Manages
    WHERE
      (t_8_Manages.boss = Under_r5.report)
   UNION ALL
  
    SELECT
      t_34_Manages.boss AS boss,
      t_34_Manages.report AS report
    FROM
      t_28_Manages AS t_34_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_6_Under_r6 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f7.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f7.report AS report
FROM
  t_7_Under_MultBodyAggAux_recursive_head_f7 AS Under_MultBodyAggAux_recursive_head_f7
GROUP BY Under_MultBodyAggAux_recursive_head_f7.boss, Under_MultBodyAggAux_recursive_head_f7.report),
t_4_Under_MultBodyAggAux_recursive_head_f8 AS (SELECT * FROM (
  
    SELECT
      Under_r6.boss AS boss,
      t_5_Manages.report AS report
    FROM
      t_6_Under_r6 AS Under_r6, t_28_Manages AS t_5_Manages
    WHERE
      (t_5_Manages.boss = Under_r6.report)
   UNION ALL
  
    SELECT
      t_35_Manages.boss AS boss,
      t_35_Manages.report AS report
    FROM
      t_28_Manages AS t_35_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_3_Under_r7 AS (SELECT
  Under_MultBodyAggAux_recursive_head_f8.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f8.report AS report
FROM
  t_4_Under_MultBodyAggAux_recursive_head_f8 AS Under_MultBodyAggAux_recursive_head_f8
GROUP BY Under_MultBodyAggAux_recursive_head_f8.boss, Under_MultBodyAggAux_recursive_head_f8.report),
t_2_Under_MultBodyAggAux_recursive_head_f9 AS (SELECT * FROM (
  
    SELECT
      Under_r7.boss AS boss,
      Manages.report AS report
    FROM
      t_3_Under_r7 AS Under_r7, t_28_Manages AS Manages
    WHERE
      (Manages.boss = Under_r7.report)
   UNION ALL
  
    SELECT
      t_36_Manages.boss AS boss,
      t_36_Manages.report AS report
    FROM
      t_28_Manages AS t_36_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_1_Under AS (SELECT
  Under_MultBodyAggAux_recursive_head_f9.boss AS boss,
  Under_MultBodyAggAux_recursive_head_f9.report AS report
FROM
  t_2_Under_MultBodyAggAux_recursive_head_f9 AS Under_MultBodyAggAux_recursive_head_f9
GROUP BY Under_MultBodyAggAux_recursive_head_f9.boss, Under_MultBodyAggAux_recursive_head_f9.report)
SELECT
  Under.boss AS boss
FROM
  t_1_Under AS Under, t_1_Under AS t_0_Under
WHERE
  (Under.report = 'sre1') AND
  (t_0_Under.boss = Under.boss) AND
  (t_0_Under.report = 'sre2') ORDER BY boss;