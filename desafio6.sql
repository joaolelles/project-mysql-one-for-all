SELECT 
    MIN(pln.valor_plano) AS 'faturamento_minimo',
    MAX(pln.valor_plano) AS 'faturamento_maximo',
    ROUND(AVG(pln.valor_plano), 2) AS 'faturamento_medio',
    SUM(pln.valor_plano) AS 'faturamento_total'
FROM
    SpotifyClone.usuario AS usr
    INNER JOIN SpotifyClone.plano AS pln ON usr.plano_id = pln.plano_id

