CREATE VIEW cancoes_premium AS
SELECT c.nome AS nome,
COUNT(hr.cancao_id) AS reproducoes
FROM SpotifyClone.historico_reproducoes AS hr
INNER JOIN SpotifyClone.cancoes AS c
ON hr.cancao_id = c.cancao_id
INNER JOIN SpotifyClone.usuarios AS u
ON hr.usuario_id = u.usuario_id
WHERE u.plano_id IN (2,3)
GROUP BY hr.cancao_id
ORDER BY nome;
