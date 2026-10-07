WITH t_0_Event AS (SELECT * FROM VALUES
  (1, "2025-12-30 23:15:00", "login", "ana"),
  (2, "2026-01-02 08:05:30", "buy", "ana"),
  (3, "2026-01-15 12:00:00", "login", "ben"),
  (4, "2026-02-01 00:00:01", "buy", "ben"),
  (5, "2026-02-14 18:45:10", "buy", "ana"),
  (6, "2026-02-28 23:59:59", "login", "cy"),
  (7, "2026-03-01 06:30:00", "buy", "cy"),
  (8, "2026-03-15 14:20:00", "refund", "ana"),
  (9, "2026-03-31 09:00:00", "login", "ben"),
  (10, "2026-04-01 10:10:10", "buy", "ben")
AS UNUSED_TABLE_NAME(id, `at`, kind, `user`)),
t_1_Price AS (SELECT * FROM VALUES
  ("ana", "2026-01", 10),
  ("ana", "2026-02", 12),
  ("ben", "2026-01", 7),
  ("ben", "2026-02", 9),
  ("ben", "2026-04", 8),
  ("cy", "2026-03", 20)
AS UNUSED_TABLE_NAME(`user`, month, amount))
SELECT
  SUM(Price.amount) AS s
FROM
  t_0_Event AS Event, t_1_Price AS Price
WHERE
  (Event.kind = "buy") AND
  (Event.`user` = "ana") AND
  (Price.`user` = "ana") AND
  (Price.month = SUBSTR(Event.`at`, 1, 7)) AND
  ("2026-02" = SUBSTR(Event.`at`, 1, 7));
