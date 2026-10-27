SELECT
  x_33.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_33
WHERE
  (x_33.value IS NOT 15) AND
  (x_33.value IS NOT 14) AND
  (x_33.value IS NOT 13) AND
  (x_33.value IS NOT 12) AND
  (x_33.value IS NOT 11) AND
  (x_33.value IS NOT 10) AND
  (x_33.value IS NOT 9) AND
  (x_33.value IS NOT 8) AND
  (x_33.value IS NOT 7) AND
  (x_33.value IS NOT 6) AND
  (x_33.value IS NOT 5) AND
  (x_33.value IS NOT 4) AND
  (x_33.value IS NOT 3) AND
  (x_33.value IS NOT 2) AND
  (x_33.value IS NOT 1);