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
  
) AS UNUSED_TABLE_NAME  ),
t_2_C AS (SELECT * FROM (
  
    SELECT
      "ann" AS c
   UNION ALL
  
    SELECT
      "bob" AS c
   UNION ALL
  
    SELECT
      "cid" AS c
   UNION ALL
  
    SELECT
      "dee" AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_C.c AS c,
  (SELECT
  MAX(O.amt) AS logica_value
FROM
  t_1_O AS O
WHERE
  (O.amt < 45) AND
  (O.c = t_0_C.c)) AS v
FROM
  t_2_C AS t_0_C ORDER BY c NULLS LAST;