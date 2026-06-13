SELECT
  x_9 AS c,
  (CONTAINS(ARRAY['red', 'blue', 'yellow'], x_9)) AS is_primary
FROM
  UNNEST(ARRAY['red', 'green', 'blue']) as pushkin(x_9) ORDER BY c;