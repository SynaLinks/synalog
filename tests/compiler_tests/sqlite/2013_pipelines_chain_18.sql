SELECT
  x_39.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_39
WHERE
  (x_39.value != 18) AND
  (x_39.value != 17) AND
  (x_39.value != 16) AND
  (x_39.value != 15) AND
  (x_39.value != 14) AND
  (x_39.value != 13) AND
  (x_39.value != 12) AND
  (x_39.value != 11) AND
  (x_39.value != 10) AND
  (x_39.value != 9) AND
  (x_39.value != 8) AND
  (x_39.value != 7) AND
  (x_39.value != 6) AND
  (x_39.value != 5) AND
  (x_39.value != 4) AND
  (x_39.value != 3) AND
  (x_39.value != 2) AND
  (x_39.value != 1);