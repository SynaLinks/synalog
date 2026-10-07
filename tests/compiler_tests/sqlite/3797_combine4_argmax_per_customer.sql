WITH t_2_O AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_3_C AS (SELECT * FROM (
  
    SELECT
      'ann' AS c
   UNION ALL
  
    SELECT
      'bob' AS c
   UNION ALL
  
    SELECT
      'cid' AS c
   UNION ALL
  
    SELECT
      'dee' AS c
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_C.c AS c,
  (SELECT
  (CASE WHEN 0 < 0 THEN NULL ELSE JSON_EXTRACT(ArgMax(JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', O.id, 'value', O.amt), x_10.value), "$.arg"), JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', O.id, 'value', O.amt), x_10.value), "$.value"), 1), '$[' || 0 || ']') END) AS logica_value
FROM
  t_2_O AS O, JSON_EACH(JSON_ARRAY(0)) as x_10
WHERE
  (O.c = t_0_C.c)) AS best
FROM
  t_3_C AS t_0_C ORDER BY c NULLS LAST;