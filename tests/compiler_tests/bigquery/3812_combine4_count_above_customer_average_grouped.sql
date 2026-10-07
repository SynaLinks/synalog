WITH t_0_O AS (SELECT * FROM (
  
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
  O.c AS c,
  SUM(1) AS n
FROM
  t_0_O AS O
WHERE
  (O.amt > (SELECT
    AVG(t_1_O.amt) AS logica_value
  FROM
    t_0_O AS t_1_O
  WHERE
    (t_1_O.c = O.c)))
GROUP BY c ORDER BY c;