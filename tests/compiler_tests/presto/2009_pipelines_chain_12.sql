SELECT
  x_27 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]) as pushkin(x_27)
WHERE
  (x_27 != 12) AND
  (x_27 != 11) AND
  (x_27 != 10) AND
  (x_27 != 9) AND
  (x_27 != 8) AND
  (x_27 != 7) AND
  (x_27 != 6) AND
  (x_27 != 5) AND
  (x_27 != 4) AND
  (x_27 != 3) AND
  (x_27 != 2) AND
  (x_27 != 1);