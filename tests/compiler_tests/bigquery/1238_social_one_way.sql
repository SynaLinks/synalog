WITH t_0_Follows AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Follows.a AS a,
  Follows.b AS b
FROM
  t_0_Follows AS Follows
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    t_0_Follows AS t_1_Follows
  WHERE
    (t_1_Follows.a IS NOT DISTINCT FROM Follows.b) AND
    (t_1_Follows.b IS NOT DISTINCT FROM Follows.a)) IS NULL) ORDER BY a NULLS LAST, b NULLS LAST;