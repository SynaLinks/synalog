WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      'a' AS n,
      1 AS v
   UNION ALL
  
    SELECT
      'b' AS n,
      2 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE JSON_GROUP_ARRAY(JSON_OBJECT('n', t_2_V.n, 'v', t_2_V.v)) END) AS l
FROM
  t_3_V AS t_2_V)
SELECT
  JSON_EXTRACT(x_1.value, "$.n") AS n,
  JSON_EXTRACT(x_1.value, "$.v") AS v
FROM
  t_1_L AS t_0_L, JSON_EACH(t_0_L.l) as x_1 ORDER BY n NULLS LAST;