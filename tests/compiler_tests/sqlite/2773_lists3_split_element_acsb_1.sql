SELECT
  (CASE WHEN 1 < 0 THEN NULL ELSE JSON_EXTRACT(SPLIT('a, b', ','), '$[' || 1 || ']') END) AS e;