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
  JOIN_STRINGS(t_0_L.l, '-') AS s
FROM
  t_1_L AS t_0_L;