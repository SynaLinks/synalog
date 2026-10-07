WITH t_2_Event AS (SELECT * FROM VALUES
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
t_1_F AS (SELECT
  MIN(Event.`at`) AS f,
  MAX(Event.`at`) AS l
FROM
  t_2_Event AS Event
WHERE
  (Event.`user` = "ben"))
SELECT
  SUBSTR(t_0_F.f, 1, 10) AS first,
  SUBSTR(t_0_F.l, 1, 10) AS last
FROM
  t_1_F AS t_0_F;
