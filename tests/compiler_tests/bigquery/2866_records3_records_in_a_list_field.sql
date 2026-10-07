WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      STRUCT("a" AS name, ARRAY[STRUCT("p" AS n), STRUCT("q" AS n)] AS items) AS r
   UNION ALL
  
    SELECT
      STRUCT("b" AS name, ARRAY[STRUCT("r" AS n)] AS items) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.r.name AS name,
  x_1.n AS item
FROM
  t_0_T AS T, UNNEST(T.r.items) as x_1 ORDER BY name, item;