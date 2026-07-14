SELECT
    ROUND(SUM(principal_amount), 2) AS total_defaulted_principal,
    COUNT(*) AS defaulted_loan_count
FROM loans
WHERE status = 'Defaulted';

WITH spike_flags AS (
    SELECT account_id, COUNT(*) AS spike_count, MAX(amount) AS largest_spike
    FROM (
        SELECT t.*, AVG(amount) OVER (PARTITION BY account_id) AS acct_avg
        FROM transactions t
    ) x
    WHERE amount >= 1 * acct_avg
    GROUP BY account_id
)
SELECT
    c.customer_id,
    c.customer_name,
    sf.account_id,
    sf.spike_count,
    sf.largest_spike
FROM spike_flags sf
JOIN accounts a ON sf.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
ORDER BY sf.largest_spike DESC;

SELECT
    date_format('%Y-%m', transaction_date) AS txn_month,   
    COUNT(*) AS txn_count,
    ROUND(SUM(amount), 2) AS total_volume
FROM transactions
GROUP BY txn_month
ORDER BY txn_month;

SELECT
    category,
    COUNT(*) AS txn_count,
    ROUND(SUM(amount), 2) AS total_volume
FROM transactions
GROUP BY category
ORDER BY total_volume DESC;

WITH acc_stats AS (
    SELECT account_id,
           SUM(CASE WHEN transaction_hour BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS odd_hour_txns
    FROM transactions GROUP BY account_id
),
spike_flags AS (
    SELECT account_id, COUNT(*) AS spike_count
    FROM (SELECT t.*, AVG(amount) OVER (PARTITION BY account_id) AS acct_avg FROM transactions t) x
    WHERE amount >= 5 * acct_avg
    GROUP BY account_id
),
risk AS (
    SELECT
        a.account_id,
        CASE
            WHEN COALESCE(s.spike_count, 0) >= 1 AND a.odd_hour_txns >= 1 THEN 'High'
            WHEN COALESCE(s.spike_count, 0) >= 1 OR a.odd_hour_txns >= 2 THEN 'Medium'
            ELSE 'Low'
        END AS risk_level
    FROM acc_stats a
    LEFT JOIN spike_flags s ON a.account_id = s.account_id
)
SELECT risk_level, COUNT(*) AS account_count
FROM risk
GROUP BY risk_level
ORDER BY CASE risk_level WHEN 'High' THEN 1 WHEN 'Medium' THEN 2 ELSE 3 END;


