WITH t_1_S AS (SELECT * FROM VALUES
  (1, "oslo", "2026-01-03", "tea", 2, 3.5E0),
  (2, "oslo", "2026-01-17", "cake", null, 4.0E0),
  (3, "rome", "2026-02-02", "tea", 5, 3.0E0),
  (4, "rome", "2026-02-11", "coffee", 1, 2.5E0),
  (5, "rome", "2026-03-09", "cake", 3, 4.5E0),
  (6, "lima", "2026-03-21", "coffee", 4, 2.0E0),
  (7, "lima", "2026-01-30", "tea", null, 3.25E0),
  (8, "oslo", "2026-03-02", "coffee", 6, 2.75E0),
  (9, "lima", "2026-02-14", "cake", 2, 5.0E0)
AS UNUSED_TABLE_NAME(id, shop, day, product, qty, price)),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      S.qty AS u
    FROM
      t_1_S AS S
    WHERE
      (S.product = "tea")
   UNION ALL
  
    SELECT
      t_2_S.qty AS u
    FROM
      t_1_S AS t_2_S
    WHERE
      (t_2_S.product = "cake")
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(Q_MultBodyAggAux.u) AS u
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux;