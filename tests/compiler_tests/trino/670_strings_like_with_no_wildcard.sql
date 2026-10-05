SELECT
  x_3 AS s
FROM
  UNNEST(ARRAY['abc', 'abcd']) as pushkin(x_3)
WHERE
  (x_3 LIKE 'abc');