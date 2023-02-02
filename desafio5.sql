SELECT
    msc.nome_musica AS 'cancao',
    COUNT(repro.musica_id) AS 'reproducoes'
FROM 
    SpotifyClone.musica AS msc
    INNER JOIN SpotifyClone.reproducao AS repro ON msc.musica_id = repro.musica_id

GROUP BY repro.musica_id
ORDER BY 
    reproducoes DESC,
    cancao 

LIMIT 2