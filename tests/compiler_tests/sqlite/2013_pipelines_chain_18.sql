SELECT
  x_39.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_39
WHERE
  (x_39.value IS NOT 18) AND
  (x_39.value IS NOT 17) AND
  (x_39.value IS NOT 16) AND
  (x_39.value IS NOT 15) AND
  (x_39.value IS NOT 14) AND
  (x_39.value IS NOT 13) AND
  (x_39.value IS NOT 12) AND
  (x_39.value IS NOT 11) AND
  (x_39.value IS NOT 10) AND
  (x_39.value IS NOT 9) AND
  (x_39.value IS NOT 8) AND
  (x_39.value IS NOT 7) AND
  (x_39.value IS NOT 6) AND
  (x_39.value IS NOT 5) AND
  (x_39.value IS NOT 4) AND
  (x_39.value IS NOT 3) AND
  (x_39.value IS NOT 2) AND
  (x_39.value IS NOT 1);