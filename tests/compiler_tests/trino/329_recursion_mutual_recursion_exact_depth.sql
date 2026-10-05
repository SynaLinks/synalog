WITH t_6_Even_MultBodyAggAux_f4 AS (SELECT * FROM (
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_5_Even_fr1 AS (SELECT
  Even_MultBodyAggAux_f4.x AS x
FROM
  t_6_Even_MultBodyAggAux_f4 AS Even_MultBodyAggAux_f4
GROUP BY 1),
t_4_Odd_fr2 AS (SELECT
  ((Even_fr1.x) + (1)) AS x
FROM
  t_5_Even_fr1 AS Even_fr1
GROUP BY 1),
t_3_Even_MultBodyAggAux_f8 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr2.x) + (1)) AS x
    FROM
      t_4_Odd_fr2 AS Odd_fr2
   UNION ALL
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_Even_fr3 AS (SELECT
  Even_MultBodyAggAux_f8.x AS x
FROM
  t_3_Even_MultBodyAggAux_f8 AS Even_MultBodyAggAux_f8
GROUP BY 1),
t_1_Odd_fr4 AS (SELECT
  ((Even_fr3.x) + (1)) AS x
FROM
  t_2_Even_fr3 AS Even_fr3
GROUP BY 1),
t_0_Even_MultBodyAggAux_f12 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr4.x) + (1)) AS x
    FROM
      t_1_Odd_fr4 AS Odd_fr4
   UNION ALL
  
    SELECT
      0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f12.x AS x
FROM
  t_0_Even_MultBodyAggAux_f12 AS Even_MultBodyAggAux_f12
GROUP BY 1 ORDER BY x;