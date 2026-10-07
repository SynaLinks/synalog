SELECT
  x_1 AS name
FROM
  UNNEST(ARRAY["rome", "paris", "oslo"]) as x_1 ORDER BY name;