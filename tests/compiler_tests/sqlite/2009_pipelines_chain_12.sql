SELECT
  x_27.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_27
WHERE
  (x_27.value != 12) AND
  (x_27.value != 11) AND
  (x_27.value != 10) AND
  (x_27.value != 9) AND
  (x_27.value != 8) AND
  (x_27.value != 7) AND
  (x_27.value != 6) AND
  (x_27.value != 5) AND
  (x_27.value != 4) AND
  (x_27.value != 3) AND
  (x_27.value != 2) AND
  (x_27.value != 1);