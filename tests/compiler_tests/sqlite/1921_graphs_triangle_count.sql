WITH t_5_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      5 AS a,
      6 AS b
   UNION ALL
  
    SELECT
      6 AS a,
      7 AS b
   UNION ALL
  
    SELECT
      7 AS a,
      8 AS b
   UNION ALL
  
    SELECT
      8 AS a,
      5 AS b
   UNION ALL
  
    SELECT
      9 AS a,
      10 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_4_U_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E.a AS a,
      E.b AS b
    FROM
      t_5_E AS E
   UNION ALL
  
    SELECT
      t_6_E.b AS a,
      t_6_E.a AS b
    FROM
      t_5_E AS t_6_E
  
) AS UNUSED_TABLE_NAME  ),
t_3_U AS (SELECT
  U_MultBodyAggAux.a AS a,
  U_MultBodyAggAux.b AS b
FROM
  t_4_U_MultBodyAggAux AS U_MultBodyAggAux
GROUP BY U_MultBodyAggAux.a, U_MultBodyAggAux.b),
t_0_T AS (SELECT
  U.a AS a,
  U.b AS b,
  t_1_U.b AS c
FROM
  t_3_U AS U, t_3_U AS t_1_U, t_3_U AS t_2_U
WHERE
  (U.a < U.b) AND
  (U.b < t_1_U.b) AND
  (t_1_U.a = U.b) AND
  (t_2_U.a = t_1_U.b) AND
  (t_2_U.b = U.a)
GROUP BY U.a, U.b, t_1_U.b)
SELECT
  SUM(1) AS n
FROM
  t_0_T AS T;