SELECT 
    usr.nome_usuario AS 'usuario',
    COUNT(repro.data_reproducao) AS 'qt_de_musicas_ouvidas',
    ROUND(SUM(msc.duracao / 60), 2) AS 'total_minutos'
FROM 
    SpotifyClone.usuario AS usr
    INNER JOIN SpotifyClone.reproducao AS repro ON usr.usuario_id = repro.usuario_id
    INNER JOIN SpotifyClone.musica AS msc ON repro.musica_id = msc.musica_id

GROUP BY usr.nome_usuario
ORDER BY usr.nome_usuario
