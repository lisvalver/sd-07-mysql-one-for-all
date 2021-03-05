CREATE VIEW historico_reproducao_usuarios AS 
SELECT
  u.name AS "usuario",
  m.name AS "nome"
FROM users AS u
JOIN user_history_songs AS h
ON h.user_id = u.id
JOIN musical_track AS m
ON h.songs_id = m.id
ORDER BY u.name, m.name;
