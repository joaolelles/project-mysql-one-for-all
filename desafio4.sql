SELECT 
    usr.nome_usuario AS 'usuario',
    IF ( (
        YEAR(MAX(repro.data_reproducao)) >= 2021
    ),
    'Usuário ativo',
    'Usuário inativo'
    )
     AS 'status_usuario'
FROM 
    SpotifyClone.usuario AS usr
    INNER JOIN SpotifyClone.reproducao AS repro ON usr.usuario_id = repro.usuario_id

GROUP BY usr.nome_usuario
ORDER BY usr.nome_usuario