WITH t_1_Price AS (SELECT * FROM VALUES
  ("pen", 1),
  ("book", 9)
AS UNUSED_TABLE_NAME(item, p))
SELECT
  SORT_ARRAY(COLLECT_LIST(STRUCT(Price.p AS value, Price.item AS arg)))[0].arg AS item
FROM
  t_1_Price AS Price;