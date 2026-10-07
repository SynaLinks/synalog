WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      STRUCT("ann" AS name, STRUCT("paris" AS city) AS home, 31 AS age, ARRAY["a", "b"] AS tags) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      STRUCT("bob" AS name, STRUCT("oslo" AS city) AS home, null AS age, ARRAY[] AS tags) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      STRUCT("cid" AS name, STRUCT("paris" AS city) AS home, 45 AS age, ARRAY["c"] AS tags) AS r
   UNION ALL
  
    SELECT
      4 AS id,
      STRUCT("dee" AS name, STRUCT(null AS city) AS home, 22 AS age, ARRAY["a"] AS tags) AS r
   UNION ALL
  
    SELECT
      5 AS id,
      STRUCT("eve" AS name, STRUCT("rome" AS city) AS home, 38 AS age, ARRAY["b", "c", "d"] AS tags) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_P.id AS id
FROM
  t_1_P AS P, t_1_P AS t_0_P
WHERE
  (t_0_P.id != 5) AND
  (t_0_P.r.tags = P.r.tags) AND
  (P.id = 5) ORDER BY id;