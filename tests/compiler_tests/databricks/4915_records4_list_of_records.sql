WITH t_2_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      STRUCT("ann" AS name, STRUCT("paris" AS city) AS home, 31 AS age, ARRAY("a", "b") AS tags) AS r
   UNION ALL
  
    SELECT
      2 AS id,
      STRUCT("bob" AS name, STRUCT("oslo" AS city) AS home, null AS age, ARRAY() AS tags) AS r
   UNION ALL
  
    SELECT
      3 AS id,
      STRUCT("cid" AS name, STRUCT("paris" AS city) AS home, 45 AS age, ARRAY("c") AS tags) AS r
   UNION ALL
  
    SELECT
      4 AS id,
      STRUCT("dee" AS name, STRUCT(null AS city) AS home, 22 AS age, ARRAY("a") AS tags) AS r
   UNION ALL
  
    SELECT
      5 AS id,
      STRUCT("eve" AS name, STRUCT("rome" AS city) AS home, 38 AS age, ARRAY("b", "c", "d") AS tags) AS r
  
) AS UNUSED_TABLE_NAME  ),
t_1_L AS (SELECT
  P.r.home.city AS city,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(STRUCT(P.r.name AS n, P.r.age AS a) AS v)), s -> s.v) END) AS l
FROM
  t_2_P AS P
WHERE
  (P.r.home.city IS NOT null)
GROUP BY 1)
SELECT
  t_0_L.city AS city,
  ARRAY_SIZE(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY city NULLS LAST;