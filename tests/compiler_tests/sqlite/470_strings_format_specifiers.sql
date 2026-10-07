SELECT
  Printf('%05d', -42) AS a,
  Printf('%.2f', 3.14159) AS b,
  Printf('%3s|%-3s|', 'a', 'b') AS c,
  Printf('100%%') AS d,
  Printf('%d', 1234567) AS e;