SELECT
  x_3 AS t,
  CARDINALITY(SPLIT(x_3, ',')) AS n
FROM
  UNNEST(ARRAY['a,b', 'c']) as pushkin(x_3) ORDER BY t;