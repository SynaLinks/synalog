SELECT
  JSON_EXTRACT(SPLIT('a,,b', ','), '$[' || 1 || ']') AS e;