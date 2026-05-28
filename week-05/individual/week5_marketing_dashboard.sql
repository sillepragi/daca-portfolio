-- Nädal: 5      Meeskond: Turundusanalüüsi osakond   Roll: B - Marketing Dashboard

-- ÜLESANNE: Turundusjuht tahab näha, millised müügikanalid toovad kõige rohkem kliente ja müüki. Loo marketing dashboard, mis näitab kanalite efektiivsust ja kliendihankimise mustrit.
-- VÄLJUND: 2 diagrammi + äritõlgendus (1-2 lauset per diagramm). Teen kaks diagrammi: 1) müük müügikanalite lõikes (tulpdiagramm) ja 2) kliendihankimine ajas (joondiagramm). Leian andmed.


-- Samm 1: Leian kogumüügi ja klientide arvu müügikanalite lõikes
SELECT
  s.channel,
  COUNT(DISTINCT s.customer_id) AS kliendid,
  SUM(s.total_price) AS tulu
FROM sales s
GROUP BY s.channel
ORDER BY tulu DESC;


-- Samm 2: Leian kliendihankimise mustri ehk vaatan uute klientide registreerimiste arvu kuude lõikes
SELECT 
    EXTRACT(MONTH FROM registration_date) as kuu_number,
    COUNT(customer_id) as uued_kliendid
FROM customers
GROUP BY kuu_number
ORDER BY kuu_number;
