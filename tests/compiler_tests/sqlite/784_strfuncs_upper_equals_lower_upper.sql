SELECT
  SUM(1) AS n
FROM
  JSON_EACH(JSON_ARRAY('Apple', 'kiwi', 'Banana')) as x_2
WHERE
  (UPPER(LOWER(x_2.value)) = UPPER(x_2.value));