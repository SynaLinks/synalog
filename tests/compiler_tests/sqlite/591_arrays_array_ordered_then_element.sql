WITH t_5_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'c' AS v
   UNION ALL
  
    SELECT
      1 AS k,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  ArgMin(t_2_V.v, t_2_V.k, null) AS l
FROM
  t_5_V AS t_2_V)
SELECT
  JSON_EXTRACT(t_0_L.l, '$[' || ((JSON_ARRAY_LENGTH(t_0_L.l)) - (1)) || ']') AS last
FROM
  t_1_L AS t_0_L;