SELECT
  x_27.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_27
WHERE
  (x_27.value IS NOT 12) AND
  (x_27.value IS NOT 11) AND
  (x_27.value IS NOT 10) AND
  (x_27.value IS NOT 9) AND
  (x_27.value IS NOT 8) AND
  (x_27.value IS NOT 7) AND
  (x_27.value IS NOT 6) AND
  (x_27.value IS NOT 5) AND
  (x_27.value IS NOT 4) AND
  (x_27.value IS NOT 3) AND
  (x_27.value IS NOT 2) AND
  (x_27.value IS NOT 1);