SELECT
  (CASE WHEN "café" RLIKE "[a-z]+" THEN REGEXP_EXTRACT("café", "[a-z]+", 0) END) AS s;