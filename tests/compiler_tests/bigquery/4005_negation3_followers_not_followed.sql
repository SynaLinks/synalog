WITH t_0_F AS (SELECT * FROM (
  
    SELECT
      "ann" AS a,
      "bob" AS b
   UNION ALL
  
    SELECT
      "bob" AS a,
      "ann" AS b
   UNION ALL
  
    SELECT
      "bob" AS a,
      "cid" AS b
   UNION ALL
  
    SELECT
      "cid" AS a,
      "dee" AS b
   UNION ALL
  
    SELECT
      "dee" AS a,
      "cid" AS b
   UNION ALL
  
    SELECT
      "eve" AS a,
      "ann" AS b
   UNION ALL
  
    SELECT
      "fay" AS a,
      "fay" AS b
   UNION ALL
  
    SELECT
      "ann" AS a,
      "cid" AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  F.a AS v
FROM
  t_0_F AS F
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_F AS t_1_F
  WHERE
    (t_1_F.a = "ann") AND
    (t_1_F.b = F.a)) IS NULL) AND
  (F.b = "ann") ORDER BY v;