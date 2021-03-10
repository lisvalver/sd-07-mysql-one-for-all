CREATE VIEW perfil_artistas AS 
SELECT artists.name AS `artista`,
album.title AS `album`,
COUNT(following.artist_id) AS `seguidores`
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.album AS album
ON artists.id = album.artist_id
INNER JOIN SpotifyClone.following AS following 
ON following.artist_id = artists.id
GROUP BY album;
