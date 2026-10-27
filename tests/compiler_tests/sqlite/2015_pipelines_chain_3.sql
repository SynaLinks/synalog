SELECT
  x_9.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_9
WHERE
  (x_9.value IS NOT 3) AND
  (x_9.value IS NOT 2) AND
  (x_9.value IS NOT 1) ORDER BY x NULLS LAST;