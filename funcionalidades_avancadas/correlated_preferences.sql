SELECT 
    writer,
    COUNT(*) FILTER (WHERE symbol = 'AAPL') AS appl_count,
    COUNT(*) FILTER (WHERE symbol = 'MSFT') AS msft_count,
    COUNT(*) FILTER (WHERE symbol = 'AMZN') AS amzn_count,
    COUNT(*) FILTER (WHERE symbol = 'TSLA') AS tsla_count
FROM
    tweets_with_stock_price
WHERE 
    writer IS NOT NULL
GROUP BY
    writer
-- ORDER BY
--     appl_count DESC
-- ORDER BY
--     msft_count DESC
-- ORDER BY
--     amzn_count DESC
ORDER BY
    tsla_count DESC
LIMIT 20;
-- analisar algumas contas, verificar se é bot, diferenciar entre 
-- contas pessoais ou de serviço
