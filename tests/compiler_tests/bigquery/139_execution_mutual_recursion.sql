WITH t_15_Even_MultBodyAggAux_f1 AS (SELECT * FROM (
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_14_Even_fr0 AS (SELECT
  Even_MultBodyAggAux_f1.n AS n
FROM
  t_15_Even_MultBodyAggAux_f1 AS Even_MultBodyAggAux_f1
GROUP BY n),
t_13_Odd_fr1 AS (SELECT
  ((Even_fr0.n) + (1)) AS n
FROM
  t_14_Even_fr0 AS Even_fr0
WHERE
  (Even_fr0.n < 4)
GROUP BY n),
t_12_Even_MultBodyAggAux_f5 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr1.n) + (1)) AS n
    FROM
      t_13_Odd_fr1 AS Odd_fr1
    WHERE
      (Odd_fr1.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_11_Even_fr2 AS (SELECT
  Even_MultBodyAggAux_f5.n AS n
FROM
  t_12_Even_MultBodyAggAux_f5 AS Even_MultBodyAggAux_f5
GROUP BY n),
t_10_Odd_fr3 AS (SELECT
  ((Even_fr2.n) + (1)) AS n
FROM
  t_11_Even_fr2 AS Even_fr2
WHERE
  (Even_fr2.n < 4)
GROUP BY n),
t_9_Even_MultBodyAggAux_f9 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr3.n) + (1)) AS n
    FROM
      t_10_Odd_fr3 AS Odd_fr3
    WHERE
      (Odd_fr3.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_8_Even_fr4 AS (SELECT
  Even_MultBodyAggAux_f9.n AS n
FROM
  t_9_Even_MultBodyAggAux_f9 AS Even_MultBodyAggAux_f9
GROUP BY n),
t_7_Odd_fr5 AS (SELECT
  ((Even_fr4.n) + (1)) AS n
FROM
  t_8_Even_fr4 AS Even_fr4
WHERE
  (Even_fr4.n < 4)
GROUP BY n),
t_6_Even_MultBodyAggAux_f13 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr5.n) + (1)) AS n
    FROM
      t_7_Odd_fr5 AS Odd_fr5
    WHERE
      (Odd_fr5.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_Even_fr6 AS (SELECT
  Even_MultBodyAggAux_f13.n AS n
FROM
  t_6_Even_MultBodyAggAux_f13 AS Even_MultBodyAggAux_f13
GROUP BY n),
t_4_Odd_fr7 AS (SELECT
  ((Even_fr6.n) + (1)) AS n
FROM
  t_5_Even_fr6 AS Even_fr6
WHERE
  (Even_fr6.n < 4)
GROUP BY n),
t_3_Even_MultBodyAggAux_f17 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr7.n) + (1)) AS n
    FROM
      t_4_Odd_fr7 AS Odd_fr7
    WHERE
      (Odd_fr7.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_2_Even_fr8 AS (SELECT
  Even_MultBodyAggAux_f17.n AS n
FROM
  t_3_Even_MultBodyAggAux_f17 AS Even_MultBodyAggAux_f17
GROUP BY n),
t_1_Odd_fr9 AS (SELECT
  ((Even_fr8.n) + (1)) AS n
FROM
  t_2_Even_fr8 AS Even_fr8
WHERE
  (Even_fr8.n < 4)
GROUP BY n),
t_0_Even_MultBodyAggAux_f20 AS (SELECT * FROM (
  
    SELECT
      ((Odd_fr9.n) + (1)) AS n
    FROM
      t_1_Odd_fr9 AS Odd_fr9
    WHERE
      (Odd_fr9.n < 4)
   UNION ALL
  
    SELECT
      0 AS n
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Even_MultBodyAggAux_f20.n AS n
FROM
  t_0_Even_MultBodyAggAux_f20 AS Even_MultBodyAggAux_f20
GROUP BY n ORDER BY n;