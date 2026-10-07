WITH t_1_O AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "ann" AS c,
      30 AS amt
   UNION ALL
  
    SELECT
      2 AS id,
      "ann" AS c,
      12 AS amt
   UNION ALL
  
    SELECT
      3 AS id,
      "bob" AS c,
      50 AS amt
   UNION ALL
  
    SELECT
      4 AS id,
      "cid" AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      5 AS id,
      "cid" AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      6 AS id,
      "cid" AS c,
      40 AS amt
   UNION ALL
  
    SELECT
      7 AS id,
      "bob" AS c,
      5 AS amt
  
) AS UNUSED_TABLE_NAME  )
SELECT
  O.id AS id,
  ((1) + (COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  t_1_O AS t_0_O
WHERE
  (t_0_O.amt > O.amt) AND
  (t_0_O.c = O.c)), 0))) AS r
FROM
  t_1_O AS O ORDER BY id NULLS LAST;