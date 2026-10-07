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
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE JSON_GROUP_ARRAY(X.v) END) AS l
FROM
  t_3_X AS X
WHERE
  (X.k = 1))
SELECT
  JSON_ARRAY_LENGTH(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L;