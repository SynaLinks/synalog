WITH t_1_Items AS (SELECT * FROM VALUES
  (1, ARRAY("a", "b")),
  (2, ARRAY("c")),
  (3, ARRAY("a", "d", "e"))
AS UNUSED_TABLE_NAME(id, tags)),
t_0_AllTags AS (SELECT
  FLATTEN(COLLECT_LIST(Items.tags)) AS logica_value
FROM
  t_1_Items AS Items),
t_2_FilteredTags AS (SELECT
  FLATTEN(COLLECT_LIST(CASE WHEN (ARRAY_SIZE(t_3_Items.tags) > 1) THEN t_3_Items.tags ELSE ARRAY() END)) AS logica_value
FROM
  t_1_Items AS t_3_Items)
SELECT
  AllTags.logica_value AS all_tags,
  FilteredTags.logica_value AS filtered
FROM
  t_0_AllTags AS AllTags, t_2_FilteredTags AS FilteredTags;