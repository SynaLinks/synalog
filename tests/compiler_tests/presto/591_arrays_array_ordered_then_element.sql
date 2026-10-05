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
  ARRAY_AGG(t_2_V.v order by t_2_V.k) AS l
FROM
  t_5_V AS t_2_V)
SELECT
  ELEMENT_AT(t_0_L.l, ((CARDINALITY(t_0_L.l)) - (1)) + 1) AS last
FROM
  t_1_L AS t_0_L;