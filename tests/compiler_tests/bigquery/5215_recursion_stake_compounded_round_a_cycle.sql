WITH t_14_Own AS (SELECT * FROM (
  
    SELECT
      "a" AS owner,
      "b" AS owned,
      50 AS percent
   UNION ALL
  
    SELECT
      "b" AS owner,
      "c" AS owned,
      40 AS percent
   UNION ALL
  
    SELECT
      "c" AS owner,
      "a" AS owned,
      10 AS percent
  
) AS UNUSED_TABLE_NAME  ),
t_11_C_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_13_Own.owner AS owner,
      t_13_Own.owned AS entity,
      1 AS hops,
      t_13_Own.percent AS stake
    FROM
      t_14_Own AS t_13_Own
  
) AS UNUSED_TABLE_NAME  ),
t_10_C_r0 AS (SELECT
  C_MultBodyAggAux_recursive_head_f1.owner AS owner,
  C_MultBodyAggAux_recursive_head_f1.entity AS entity,
  C_MultBodyAggAux_recursive_head_f1.hops AS hops,
  C_MultBodyAggAux_recursive_head_f1.stake AS stake
FROM
  t_11_C_MultBodyAggAux_recursive_head_f1 AS C_MultBodyAggAux_recursive_head_f1
GROUP BY owner, entity, hops, stake),
t_8_C_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      C_r0.owner AS owner,
      t_9_Own.owned AS entity,
      ((C_r0.hops) + (1)) AS hops,
      ((C_r0.stake) * (((t_9_Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      t_10_C_r0 AS C_r0, t_14_Own AS t_9_Own
    WHERE
      (t_9_Own.owner IS NOT DISTINCT FROM C_r0.entity)
   UNION ALL
  
    SELECT
      t_15_Own.owner AS owner,
      t_15_Own.owned AS entity,
      1 AS hops,
      t_15_Own.percent AS stake
    FROM
      t_14_Own AS t_15_Own
  
) AS UNUSED_TABLE_NAME  ),
t_7_C_r1 AS (SELECT
  C_MultBodyAggAux_recursive_head_f2.owner AS owner,
  C_MultBodyAggAux_recursive_head_f2.entity AS entity,
  C_MultBodyAggAux_recursive_head_f2.hops AS hops,
  C_MultBodyAggAux_recursive_head_f2.stake AS stake
FROM
  t_8_C_MultBodyAggAux_recursive_head_f2 AS C_MultBodyAggAux_recursive_head_f2
GROUP BY owner, entity, hops, stake),
t_5_C_MultBodyAggAux_recursive_head_f3 AS (SELECT * FROM (
  
    SELECT
      C_r1.owner AS owner,
      t_6_Own.owned AS entity,
      ((C_r1.hops) + (1)) AS hops,
      ((C_r1.stake) * (((t_6_Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      t_7_C_r1 AS C_r1, t_14_Own AS t_6_Own
    WHERE
      (t_6_Own.owner IS NOT DISTINCT FROM C_r1.entity)
   UNION ALL
  
    SELECT
      t_16_Own.owner AS owner,
      t_16_Own.owned AS entity,
      1 AS hops,
      t_16_Own.percent AS stake
    FROM
      t_14_Own AS t_16_Own
  
) AS UNUSED_TABLE_NAME  ),
t_4_C_r2 AS (SELECT
  C_MultBodyAggAux_recursive_head_f3.owner AS owner,
  C_MultBodyAggAux_recursive_head_f3.entity AS entity,
  C_MultBodyAggAux_recursive_head_f3.hops AS hops,
  C_MultBodyAggAux_recursive_head_f3.stake AS stake
FROM
  t_5_C_MultBodyAggAux_recursive_head_f3 AS C_MultBodyAggAux_recursive_head_f3
GROUP BY owner, entity, hops, stake),
t_2_C_MultBodyAggAux_recursive_head_f4 AS (SELECT * FROM (
  
    SELECT
      C_r2.owner AS owner,
      t_3_Own.owned AS entity,
      ((C_r2.hops) + (1)) AS hops,
      ((C_r2.stake) * (((t_3_Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      t_4_C_r2 AS C_r2, t_14_Own AS t_3_Own
    WHERE
      (t_3_Own.owner IS NOT DISTINCT FROM C_r2.entity)
   UNION ALL
  
    SELECT
      t_17_Own.owner AS owner,
      t_17_Own.owned AS entity,
      1 AS hops,
      t_17_Own.percent AS stake
    FROM
      t_14_Own AS t_17_Own
  
) AS UNUSED_TABLE_NAME  ),
t_1_C_r3 AS (SELECT
  C_MultBodyAggAux_recursive_head_f4.owner AS owner,
  C_MultBodyAggAux_recursive_head_f4.entity AS entity,
  C_MultBodyAggAux_recursive_head_f4.hops AS hops,
  C_MultBodyAggAux_recursive_head_f4.stake AS stake
FROM
  t_2_C_MultBodyAggAux_recursive_head_f4 AS C_MultBodyAggAux_recursive_head_f4
GROUP BY owner, entity, hops, stake),
t_0_C_MultBodyAggAux_recursive_head_f5 AS (SELECT * FROM (
  
    SELECT
      C_r3.owner AS owner,
      Own.owned AS entity,
      ((C_r3.hops) + (1)) AS hops,
      ((C_r3.stake) * (((Own.percent) / NULLIF(100, 0)))) AS stake
    FROM
      t_1_C_r3 AS C_r3, t_14_Own AS Own
    WHERE
      (Own.owner IS NOT DISTINCT FROM C_r3.entity)
   UNION ALL
  
    SELECT
      t_18_Own.owner AS owner,
      t_18_Own.owned AS entity,
      1 AS hops,
      t_18_Own.percent AS stake
    FROM
      t_14_Own AS t_18_Own
  
) AS UNUSED_TABLE_NAME  )
SELECT
  C_MultBodyAggAux_recursive_head_f5.owner AS owner,
  C_MultBodyAggAux_recursive_head_f5.entity AS entity,
  C_MultBodyAggAux_recursive_head_f5.hops AS hops,
  C_MultBodyAggAux_recursive_head_f5.stake AS stake
FROM
  t_0_C_MultBodyAggAux_recursive_head_f5 AS C_MultBodyAggAux_recursive_head_f5
GROUP BY owner, entity, hops, stake ORDER BY hops NULLS LAST, owner NULLS LAST, entity NULLS LAST;