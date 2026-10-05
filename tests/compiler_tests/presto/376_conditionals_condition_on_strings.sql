SELECT
  x_3 AS s,
  CASE WHEN (x_3 < 'h') THEN 'early' ELSE 'late' END AS w
FROM
  UNNEST(ARRAY['a', 'm']) as pushkin(x_3) ORDER BY s;