WITH t_0_Customer AS (SELECT * FROM VALUES
  (1, "Ada", "Lovelace", "ada@analytical.org"),
  (2, "alan", "TURING", "alan@bletchley.uk"),
  (3, "Grace", "Hopper", "grace@navy.mil"),
  (4, "Edsger", "Dijkstra", "ewd@utexas.edu"),
  (5, "Barbara", "Liskov", "liskov@mit.edu"),
  (6, "Ken", "Thompson", "ken@bell-labs.com")
AS UNUSED_TABLE_NAME(id, first, last, email))
SELECT
  Customer.id AS id,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(SPLIT(Customer.email, REGEXP_REPLACE("@", '([^a-zA-Z0-9])', '\\\\$1')), CAST(0 AS INT) + 1) END) AS local
FROM
  t_0_Customer AS Customer ORDER BY id NULLS LAST, local NULLS LAST;