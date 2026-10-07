WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      "a" AS g,
      1 AS x
   UNION ALL
  
    SELECT
      "a" AS g,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_C AS (SELECT
  V.g AS g,
  ARRAY_AGG(V.x) AS l
FROM
  t_3_V AS V
GROUP BY g),
t_5_G AS (SELECT * FROM (
  
    SELECT
      "a" AS g
   UNION ALL
  
    SELECT
      "b" AS g
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT * FROM (
  
    SELECT
      C.g AS g,
      C.l AS l
    FROM
      t_2_C AS C
   UNION ALL
  
    SELECT
      t_4_G.g AS g,
      ARRAY[] AS l
    FROM
      t_5_G AS t_4_G
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_2_C AS t_6_C
      WHERE
        (t_6_C.g = t_4_G.g)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_L.g AS g,
  ARRAY_LENGTH(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY g NULLS LAST;