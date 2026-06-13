SELECT
  x_10 AS name,
  (("Hello, " || x_10) || "!") AS message
FROM
  UNNEST(ARRAY["Alice", "Bob", "Charlie"]) as x_10 ORDER BY name;