WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[CAST(ROW('a', 1) AS ROW(n varchar, v double)), CAST(ROW('b', 2) AS ROW(n varchar, v double))] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[CAST(ROW('c', 3) AS ROW(n varchar, v double))] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(T.l, 0 + 1) END).n AS n
FROM
  t_0_T AS T ORDER BY k;