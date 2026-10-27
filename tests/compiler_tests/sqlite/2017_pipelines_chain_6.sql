SELECT
  x_15.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_15
WHERE
  (x_15.value IS NOT 6) AND
  (x_15.value IS NOT 5) AND
  (x_15.value IS NOT 4) AND
  (x_15.value IS NOT 3) AND
  (x_15.value IS NOT 2) AND
  (x_15.value IS NOT 1) ORDER BY x NULLS LAST;