WITH t_2_ApproverOf AS (SELECT * FROM (
  
    SELECT
      'eva' AS approver,
      'dan' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'cal' AS requester
   UNION ALL
  
    SELECT
      'dan' AS approver,
      'bea' AS requester
   UNION ALL
  
    SELECT
      'cal' AS approver,
      'ali' AS requester
  
) AS UNUSED_TABLE_NAME  ),
t_25_Above_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_26_ApproverOf.approver AS approver,
      t_26_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_26_ApproverOf
  
) AS UNUSED_TABLE_NAME  ),
t_24_Above_r0 AS (SELECT
  Above_MultBodyAggAux_recursive_head_f1.approver AS approver,
  Above_MultBodyAggAux_recursive_head_f1.requester AS requester
FROM
  t_25_Above_MultBodyAggAux_recursive_head_f1 AS Above_MultBodyAggAux_recursive_head_f1
GROUP BY Above_MultBodyAggAux_recursive_head_f1.approver, Above_MultBodyAggAux_recursive_head_f1.requester),
t_21_Above_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      t_22_ApproverOf.approver AS approver,
      t_22_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_22_ApproverOf
   UNION ALL
  
    SELECT
      t_23_ApproverOf.approver AS approver,
      Above_r0.requester AS requester
    FROM
      t_24_Above_r0 AS Above_r0, t_2_ApproverOf AS t_23_ApproverOf
    WHERE
      (t_23_ApproverOf.requester = Above_r0.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_20_Above_r1 AS (SELECT
  Above_MultBodyAggAux_recursive_head_f2.approver AS approver,
  Above_MultBodyAggAux_recursive_head_f2.requester AS requester
FROM
  t_21_Above_MultBodyAggAux_recursive_head_f2 AS Above_MultBodyAggAux_recursive_head_f2
GROUP BY Above_MultBodyAggAux_recursive_head_f2.approver, Above_MultBodyAggAux_recursive_head_f2.requester),
t_17_Above_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      t_18_ApproverOf.approver AS approver,
      t_18_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_18_ApproverOf
   UNION ALL
  
    SELECT
      t_19_ApproverOf.approver AS approver,
      Above_r1.requester AS requester
    FROM
      t_20_Above_r1 AS Above_r1, t_2_ApproverOf AS t_19_ApproverOf
    WHERE
      (t_19_ApproverOf.requester = Above_r1.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_16_Above_r2 AS (SELECT
  Above_MultBodyAggAux_recursive_head_f3.approver AS approver,
  Above_MultBodyAggAux_recursive_head_f3.requester AS requester
FROM
  t_17_Above_MultBodyAggAux_recursive_head_f3 AS Above_MultBodyAggAux_recursive_head_f3
GROUP BY Above_MultBodyAggAux_recursive_head_f3.approver, Above_MultBodyAggAux_recursive_head_f3.requester),
t_13_Above_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      t_14_ApproverOf.approver AS approver,
      t_14_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_14_ApproverOf
   UNION ALL
  
    SELECT
      t_15_ApproverOf.approver AS approver,
      Above_r2.requester AS requester
    FROM
      t_16_Above_r2 AS Above_r2, t_2_ApproverOf AS t_15_ApproverOf
    WHERE
      (t_15_ApproverOf.requester = Above_r2.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_12_Above_r3 AS (SELECT
  Above_MultBodyAggAux_recursive_head_f4.approver AS approver,
  Above_MultBodyAggAux_recursive_head_f4.requester AS requester
FROM
  t_13_Above_MultBodyAggAux_recursive_head_f4 AS Above_MultBodyAggAux_recursive_head_f4
GROUP BY Above_MultBodyAggAux_recursive_head_f4.approver, Above_MultBodyAggAux_recursive_head_f4.requester),
t_9_Above_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      t_10_ApproverOf.approver AS approver,
      t_10_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_10_ApproverOf
   UNION ALL
  
    SELECT
      t_11_ApproverOf.approver AS approver,
      Above_r3.requester AS requester
    FROM
      t_12_Above_r3 AS Above_r3, t_2_ApproverOf AS t_11_ApproverOf
    WHERE
      (t_11_ApproverOf.requester = Above_r3.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_8_Above_r4 AS (SELECT
  Above_MultBodyAggAux_recursive_head_f5.approver AS approver,
  Above_MultBodyAggAux_recursive_head_f5.requester AS requester
FROM
  t_9_Above_MultBodyAggAux_recursive_head_f5 AS Above_MultBodyAggAux_recursive_head_f5
GROUP BY Above_MultBodyAggAux_recursive_head_f5.approver, Above_MultBodyAggAux_recursive_head_f5.requester),
t_5_Above_MultBodyAggAux_recursive_head_f6 AS (SELECT * FROM (
  
    SELECT
      t_6_ApproverOf.approver AS approver,
      t_6_ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS t_6_ApproverOf
   UNION ALL
  
    SELECT
      t_7_ApproverOf.approver AS approver,
      Above_r4.requester AS requester
    FROM
      t_8_Above_r4 AS Above_r4, t_2_ApproverOf AS t_7_ApproverOf
    WHERE
      (t_7_ApproverOf.requester = Above_r4.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_4_Above_r5 AS (SELECT
  Above_MultBodyAggAux_recursive_head_f6.approver AS approver,
  Above_MultBodyAggAux_recursive_head_f6.requester AS requester
FROM
  t_5_Above_MultBodyAggAux_recursive_head_f6 AS Above_MultBodyAggAux_recursive_head_f6
GROUP BY Above_MultBodyAggAux_recursive_head_f6.approver, Above_MultBodyAggAux_recursive_head_f6.requester),
t_1_Above_MultBodyAggAux_recursive_head_f7 AS (SELECT * FROM (
  
    SELECT
      ApproverOf.approver AS approver,
      ApproverOf.requester AS requester
    FROM
      t_2_ApproverOf AS ApproverOf
   UNION ALL
  
    SELECT
      t_3_ApproverOf.approver AS approver,
      Above_r5.requester AS requester
    FROM
      t_4_Above_r5 AS Above_r5, t_2_ApproverOf AS t_3_ApproverOf
    WHERE
      (t_3_ApproverOf.requester = Above_r5.approver)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Above AS (SELECT
  Above_MultBodyAggAux_recursive_head_f7.approver AS approver,
  Above_MultBodyAggAux_recursive_head_f7.requester AS requester
FROM
  t_1_Above_MultBodyAggAux_recursive_head_f7 AS Above_MultBodyAggAux_recursive_head_f7
GROUP BY Above_MultBodyAggAux_recursive_head_f7.approver, Above_MultBodyAggAux_recursive_head_f7.requester)
SELECT
  Above.approver AS approver
FROM
  t_0_Above AS Above
WHERE
  (Above.requester = 'dan')
GROUP BY Above.approver ORDER BY approver;