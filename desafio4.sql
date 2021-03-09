CREATE VIEW top_3_artistas AS
    SELECT 
    artista.nome AS artista, COUNT(usuario.id) AS seguidores
FROM
    SpotifyClone.Seguindo AS seguindo
        INNER JOIN
    SpotifyClone.Usuario AS usuario ON seguindo.usuario_id = usuario.id
        INNER JOIN
    SpotifyClone.Artista AS artista ON seguindo.artista_id = artista.id
    group by artista
ORDER BY seguidores DESC , artista
LIMIT 3;
