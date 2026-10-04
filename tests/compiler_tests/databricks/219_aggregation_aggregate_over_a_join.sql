WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "ann" AS name
   UNION ALL
  
    SELECT
      2 AS id,
      "bob" AS name
  
) AS UNUSED_TABLE_NAME  ),
t_1_O AS (SELECT * FROM (
  
    SELECT
      1 AS pid,
      10 AS amount
   UNION ALL
  
    SELECT
      1 AS pid,
      20 AS amount
   UNION ALL
  
    SELECT
      2 AS pid,
      5 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.name AS name,
  SUM(O.amount) AS total
FROM
  t_0_P AS P, t_1_O AS O
WHERE
  (O.pid = P.id)
GROUP BY 1 ORDER BY name;