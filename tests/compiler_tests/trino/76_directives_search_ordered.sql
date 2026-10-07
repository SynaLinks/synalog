SELECT
  x_1 AS name
FROM
  UNNEST(TRANSFORM(ARRAY['rome', 'paris', 'oslo'], synalog_e -> ROW(synalog_e))) as pushkin(x_1) ORDER BY name;