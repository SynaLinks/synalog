SELECT
  SUM(((x_5) * (x_5))) AS t
FROM
  UNNEST(ARRAY[1, 2, 3]) as x_5;