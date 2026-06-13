SELECT
  x_9 AS c,
  (x_9 IN UNNEST(ARRAY["red", "blue", "yellow"])) AS is_primary
FROM
  UNNEST(ARRAY["red", "green", "blue"]) as x_9 ORDER BY c;