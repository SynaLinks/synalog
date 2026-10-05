SELECT
  CAST(ROW(x_1) AS ROW(n double)).n AS n
FROM
  UNNEST(ARRAY[10, 9]) as pushkin(x_1) ORDER BY n;
