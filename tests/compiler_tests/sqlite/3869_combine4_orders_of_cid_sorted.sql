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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CASE WHEN (SELECT
  ArgMin(JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', O.id, 'value', SYNALOG_NUMBER_TEXT(O.amt)), x_8.value), "$.value"), JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', O.id, 'value', SYNALOG_NUMBER_TEXT(O.amt)), x_8.value), "$.arg"), null) AS logica_value
FROM
  t_2_O AS O, JSON_EACH(JSON_ARRAY(0)) as x_8
WHERE
  (O.c = 'cid')) IS NULL OR ';' IS NULL THEN NULL ELSE COALESCE((SELECT GROUP_CONCAT(value, ';') FROM (SELECT value FROM JSON_EACH((SELECT
  ArgMin(JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', O.id, 'value', SYNALOG_NUMBER_TEXT(O.amt)), x_8.value), "$.value"), JSON_EXTRACT(MagicalEntangle(JSON_OBJECT('arg', O.id, 'value', SYNALOG_NUMBER_TEXT(O.amt)), x_8.value), "$.arg"), null) AS logica_value
FROM
  t_2_O AS O, JSON_EACH(JSON_ARRAY(0)) as x_8
WHERE
  (O.c = 'cid'))) WHERE value IS NOT NULL ORDER BY key)), '') END) AS s;