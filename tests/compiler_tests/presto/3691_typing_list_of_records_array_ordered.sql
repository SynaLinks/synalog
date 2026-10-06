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
  ARRAY_AGG(CAST(ROW(V.n) AS ROW(n varchar)) order by V.k) AS l
FROM
  t_4_V AS V)
SELECT
  ELEMENT_AT(t_0_L.l, 0 + 1).n AS n
FROM
  t_1_L AS t_0_L;