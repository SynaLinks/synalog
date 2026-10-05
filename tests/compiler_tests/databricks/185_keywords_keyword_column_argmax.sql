WITH t_2_S AS (SELECT * FROM VALUES
  (1, 5),
  (2, 9)
AS UNUSED_TABLE_NAME(`order`, s))
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(t_0_S.s AS value, t_0_S.`order` AS arg)), false)[0].arg AS `order`
FROM
  t_2_S AS t_0_S;