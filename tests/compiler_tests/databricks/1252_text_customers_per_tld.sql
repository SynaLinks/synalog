WITH t_1_Customer AS (SELECT * FROM VALUES
  (1, "Ada", "Lovelace", "ada@analytical.org"),
  (2, "alan", "TURING", "alan@bletchley.uk"),
  (3, "Grace", "Hopper", "grace@navy.mil"),
  (4, "Edsger", "Dijkstra", "ewd@utexas.edu"),
  (5, "Barbara", "Liskov", "liskov@mit.edu"),
  (6, "Ken", "Thompson", "ken@bell-labs.com")
AS UNUSED_TABLE_NAME(id, first, last, email))
SELECT
  (CASE WHEN ((ARRAY_SIZE(SPLIT(Customer.email, REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1')))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT(Customer.email, REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1')), CAST(((ARRAY_SIZE(SPLIT(Customer.email, REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1')))) - (1)) AS INT) + 1) END) AS tld,
  SUM(1) AS n
FROM
  t_1_Customer AS Customer
GROUP BY 1 ORDER BY tld NULLS LAST, n NULLS LAST;