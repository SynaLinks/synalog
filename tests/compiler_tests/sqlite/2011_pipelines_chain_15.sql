SELECT
  x_33.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_33
WHERE
  (x_33.value != 15) AND
  (x_33.value != 14) AND
  (x_33.value != 13) AND
  (x_33.value != 12) AND
  (x_33.value != 11) AND
  (x_33.value != 10) AND
  (x_33.value != 9) AND
  (x_33.value != 8) AND
  (x_33.value != 7) AND
  (x_33.value != 6) AND
  (x_33.value != 5) AND
  (x_33.value != 4) AND
  (x_33.value != 3) AND
  (x_33.value != 2) AND
  (x_33.value != 1);