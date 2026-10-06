WITH t_4_V AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      'a' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'b' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ArgMin(JSON_OBJECT('n', V.n), V.k, null) AS l
FROM
  t_4_V AS V)
SELECT
  JSON_EXTRACT(JSON_EXTRACT(t_0_L.l, '$[' || 0 || ']'), "$.n") AS n
FROM
  t_1_L AS t_0_L;