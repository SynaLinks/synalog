SELECT
  MIN(x_2) AS d
FROM
  UNNEST(TRANSFORM(ARRAY['2024-01-01', '2022-07-04', '2023-03-03'], synalog_e -> ROW(synalog_e))) as pushkin(x_2);