SELECT
  x_1 AS name
FROM
  UNNEST(ARRAY['rome', 'paris', 'oslo']) as pushkin(x_1) ORDER BY name;