WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      1 AS n
   UNION ALL
  
    SELECT
      'x' AS g,
      2 AS n
   UNION ALL
  
    SELECT
      'y' AS g,
      3 AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_C AS (SELECT
  V.g AS g,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE JSON_GROUP_ARRAY(JSON_OBJECT('n', V.n)) END) AS l
FROM
  t_2_V AS V
GROUP BY V.g)
SELECT
  t_0_C.g AS g,
  SUM(1) AS c
FROM
  t_1_C AS t_0_C, JSON_EACH(t_0_C.l) as x_3
WHERE
  (JSON_EXTRACT(x_3.value, "$.n") > 0)
GROUP BY t_0_C.g ORDER BY g NULLS LAST;