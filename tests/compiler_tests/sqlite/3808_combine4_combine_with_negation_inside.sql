WITH t_0_O AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS c,
      30 AS amt
   UNION ALL
  
    SELECT
      2 AS id,
      'ann' AS c,
      12 AS amt
   UNION ALL
  
    SELECT
      3 AS id,
      'bob' AS c,
      50 AS amt
   UNION ALL
  
    SELECT
      4 AS id,
      'cid' AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      5 AS id,
      'cid' AS c,
      7 AS amt
   UNION ALL
  
    SELECT
      6 AS id,
      'cid' AS c,
      40 AS amt
   UNION ALL
  
    SELECT
      7 AS id,
      'bob' AS c,
      5 AS amt
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (SELECT
  SUM(MagicalEntangle(O.amt, x_5.value)) AS logica_value
FROM
  t_0_O AS O, JSON_EACH(JSON_ARRAY(0)) as x_5
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_8.value)) AS logica_value
  FROM
    JSON_EACH(JSON_ARRAY(0)) as x_8
  WHERE
    (O.c = 'ann')) IS NULL)) AS t;