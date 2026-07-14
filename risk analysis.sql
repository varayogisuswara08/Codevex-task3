WITH ranked AS (
    SELECT *, NTILE(100) OVER (ORDER BY amount) AS percentile
    FROM transactions
)
SELECT account_id, transaction_id, transaction_date, amount, category
FROM ranked
WHERE percentile = 100
ORDER BY amount DESC;

WITH acc_stats AS (
    SELECT
        account_id,
        COUNT(*)                                             AS txn_count,
        ROUND(AVG(amount), 2)                                AS avg_amount,
        MAX(amount)                                           AS max_amount,
        SUM(CASE WHEN transaction_hour BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS odd_hour_txns
    FROM transactions
    GROUP BY account_id
),
spike_flags AS (
    SELECT account_id, COUNT(*) AS spike_count
    FROM (
        SELECT t.*, AVG(amount) OVER (PARTITION BY account_id) AS acct_avg
        FROM transactions t
    ) x
    WHERE amount >= 5 * acct_avg
    GROUP BY account_id
)
SELECT
    a.account_id,
    a.txn_count,
    a.avg_amount,
    a.max_amount,
    a.odd_hour_txns,
    COALESCE(s.spike_count, 0) AS spike_count,
    CASE
        WHEN COALESCE(s.spike_count, 0) >= 1 AND a.odd_hour_txns >= 1 THEN 'High'
        WHEN COALESCE(s.spike_count, 0) >= 1 OR a.odd_hour_txns >= 2 THEN 'Medium'
        ELSE 'Low'
    END AS risk_level
FROM acc_stats a
LEFT JOIN spike_flags s ON a.account_id = s.account_id
ORDER BY risk_level, a.max_amount DESC;

SELECT
    CASE
        WHEN c.credit_score < 580 THEN 'Poor (<580)'
        WHEN c.credit_score < 670 THEN 'Fair (580-669)'
        WHEN c.credit_score < 740 THEN 'Good (670-739)'
        ELSE 'Excellent (740+)'
    END AS credit_band,
    COUNT(*) AS total_loans,
    SUM(CASE WHEN l.status = 'Defaulted' THEN 1 ELSE 0 END) AS defaults,
    ROUND(100.0 * SUM(CASE WHEN l.status = 'Defaulted' THEN 1 ELSE 0 END) / COUNT(*), 2) AS default_rate_pct
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
GROUP BY credit_band
ORDER BY default_rate_pct DESC;
