SELECT
  (SELECT
  MIN(x_5) AS logica_value
FROM
  UNNEST(ARRAY['bee', 'ant', 'cat']) as pushkin(x_5)) AS m;