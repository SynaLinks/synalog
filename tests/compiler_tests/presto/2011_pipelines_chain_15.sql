SELECT
  x_33 AS x
FROM
  UNNEST(ARRAY[1, 2, 3, 4, 5, 6, 7, 8]) as pushkin(x_33)
WHERE
  (x_33 != 15) AND
  (x_33 != 14) AND
  (x_33 != 13) AND
  (x_33 != 12) AND
  (x_33 != 11) AND
  (x_33 != 10) AND
  (x_33 != 9) AND
  (x_33 != 8) AND
  (x_33 != 7) AND
  (x_33 != 6) AND
  (x_33 != 5) AND
  (x_33 != 4) AND
  (x_33 != 3) AND
  (x_33 != 2) AND
  (x_33 != 1);