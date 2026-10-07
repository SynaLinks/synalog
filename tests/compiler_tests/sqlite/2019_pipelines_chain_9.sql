SELECT
  x_21.value AS x
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3, 4, 5, 6, 7, 8)) as x_21
WHERE
  (x_21.value != 9) AND
  (x_21.value != 8) AND
  (x_21.value != 7) AND
  (x_21.value != 6) AND
  (x_21.value != 5) AND
  (x_21.value != 4) AND
  (x_21.value != 3) AND
  (x_21.value != 2) AND
  (x_21.value != 1);