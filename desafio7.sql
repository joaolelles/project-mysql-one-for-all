SELECT
    art.nome AS 'artista',
    alb.nome_album AS 'album',
    COUNT(sgn.artista_id) AS 'seguidores'
FROM 
    SpotifyClone.artista AS art
    INNER JOIN SpotifyClone.album AS alb ON art.artista_id = alb.artista_id
    INNER JOIN SpotifyClone.seguindo AS sgn ON art.artista_id = sgn.artista_id

GROUP BY 
    artista,
    album
ORDER BY
    seguidores DESC,
    artista,
    album
