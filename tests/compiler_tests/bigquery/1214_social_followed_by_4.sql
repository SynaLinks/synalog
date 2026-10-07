WITH t_2_Follows AS (SELECT * FROM (
  
    SELECT
      "ann" AS a,
      "bob" AS b
   UNION ALL
  
    SELECT
      "bob" AS a,
      "ann" AS b
   UNION ALL
  
    SELECT
      "ann" AS a,
      "cat" AS b
   UNION ALL
  
    SELECT
      "cat" AS a,
      "dan" AS b
   UNION ALL
  
    SELECT
      "dan" AS a,
      "cat" AS b
   UNION ALL
  
    SELECT
      "bob" AS a,
      "cat" AS b
   UNION ALL
  
    SELECT
      "eve" AS a,
      "ann" AS b
   UNION ALL
  
    SELECT
      "eve" AS a,
      "bob" AS b
   UNION ALL
  
    SELECT
      "eve" AS a,
      "cat" AS b
   UNION ALL
  
    SELECT
      "dan" AS a,
      "eve" AS b
   UNION ALL
  
    SELECT
      "fay" AS a,
      "cat" AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_In AS (SELECT
  Follows.b AS u,
  SUM(1) AS n
FROM
  t_2_Follows AS Follows
GROUP BY u)
SELECT
  t_0_In.u AS u
FROM
  t_1_In AS t_0_In
WHERE
  (t_0_In.n >= 4);
