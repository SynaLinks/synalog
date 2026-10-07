SELECT
  ((2) * (x_4.value)) AS y
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_4
WHERE
  (((2) * (x_4.value)) > 4);