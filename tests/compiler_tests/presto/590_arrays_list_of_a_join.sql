WITH t_3_X AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'b' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'c' AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ARRAY_AGG(X.v) AS l
FROM
  t_3_X AS X
WHERE
  (X.k = 1))
SELECT
  CARDINALITY(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;