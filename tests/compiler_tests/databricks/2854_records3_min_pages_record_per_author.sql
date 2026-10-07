WITH t_3_B AS (SELECT * FROM VALUES
  (1, "Dune", "herbert", 1965, 412, true),
  (2, "Emma", "austen", 1815, 474, false),
  (3, "Ubik", "dick", 1969, 202, true),
  (4, "Kim", "kipling", 1901, 368, false),
  (5, "Solaris", "lem", 1961, 204, true),
  (6, "Persuasion", "austen", 1817, 249, false),
  (7, "Valis", "dick", 1981, 271, true)
AS UNUSED_TABLE_NAME(id, title, author, year, pages, sf)),
t_1_M AS (SELECT
  B.author AS author,
  SORT_ARRAY(COLLECT_LIST(STRUCT(B.pages AS value, STRUCT(B.title AS title, B.pages AS v) AS arg)))[0].arg AS m
FROM
  t_3_B AS B
GROUP BY 1)
SELECT
  t_0_M.author AS author,
  t_0_M.m.title AS title,
  t_0_M.m.v AS v
FROM
  t_1_M AS t_0_M ORDER BY author NULLS LAST, title NULLS LAST, v NULLS LAST;