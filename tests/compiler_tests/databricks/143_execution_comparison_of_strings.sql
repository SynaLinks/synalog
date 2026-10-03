SELECT
  x_3 AS d
FROM
  explode(ARRAY("2026-01-05", "2026-03-01")) AS pushkin(x_3)
WHERE
  (x_3 < "2026-02-01");