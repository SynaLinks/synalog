SELECT
  SUBSTR(x_2, 1, 2) AS p
FROM
  UNNEST(TRANSFORM(ARRAY['apple', 'pear'], synalog_e -> ROW(synalog_e))) as pushkin(x_2) ORDER BY p;