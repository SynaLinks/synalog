SELECT
  ((JSON_EXTRACT(JSON_OBJECT('m', 4), "$.m")) * (2)) AS v;