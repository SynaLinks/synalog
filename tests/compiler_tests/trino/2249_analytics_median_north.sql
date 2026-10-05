DROP TABLE IF EXISTS logica_test.V;
CREATE TABLE logica_test.V AS WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.d AS d,
  S.v AS v
FROM
  t_0_S AS S
WHERE
  (S.r = 'north');

-- Interacting with table logica_test.V

DROP TABLE IF EXISTS logica_test.Pos;
CREATE TABLE logica_test.Pos AS WITH t_1_Before_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_V.d AS d,
      t_3_V.d AS e
    FROM
      logica_test.V AS t_2_V, logica_test.V AS t_3_V
    WHERE
      (t_3_V.v < t_2_V.v)
   UNION ALL
  
    SELECT
      t_4_V.d AS d,
      t_5_V.d AS e
    FROM
      logica_test.V AS t_4_V, logica_test.V AS t_5_V
    WHERE
      (t_5_V.d < t_4_V.d) AND
      (t_5_V.v = t_4_V.v)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Before AS (SELECT
  Before_MultBodyAggAux.d AS d,
  Before_MultBodyAggAux.e AS e
FROM
  t_1_Before_MultBodyAggAux AS Before_MultBodyAggAux
GROUP BY 1, 2)
SELECT
  V.d AS d,
  V.v AS v,
  COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  t_0_Before AS Before
WHERE
  (Before.d = V.d)), 0) AS pos
FROM
  logica_test.V AS V;

-- Interacting with table logica_test.Pos

DROP TABLE IF EXISTS logica_test.N;
CREATE TABLE logica_test.N AS SELECT
  SUM(1) AS n
FROM
  logica_test.V AS V;

-- Interacting with table logica_test.N

WITH t_0_Mid AS (SELECT * FROM (
  
    SELECT
      t_1_Pos.v AS v
    FROM
      logica_test.Pos AS t_1_Pos, logica_test.N AS t_2_N
    WHERE
      (((((2) * (t_1_Pos.pos))) + (1)) = t_2_N.n)
   UNION ALL
  
    SELECT
      t_3_Pos.v AS v
    FROM
      logica_test.Pos AS t_3_Pos, logica_test.N AS t_4_N
    WHERE
      (((2) * (t_3_Pos.pos)) = t_4_N.n)
   UNION ALL
  
    SELECT
      t_5_Pos.v AS v
    FROM
      logica_test.Pos AS t_5_Pos, logica_test.N AS t_6_N
    WHERE
      (((((2) * (t_5_Pos.pos))) + (2)) = t_6_N.n)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG(Mid.v) AS m
FROM
  t_0_Mid AS Mid;
