SELECT
  x_1.value AS s
FROM
  JSON_EACH(JSON_ARRAY(''');ATTACH DATABASE ''x'' AS y;--', 'other')) as x_1
WHERE
  (x_1.value != 'other');