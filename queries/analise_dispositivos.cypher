MATCH (aluno: Aluno {ru: "<ID>"})
(t:Tweet)-[:POSSUI_TAG]→ (h: Hashtag
WHERE t.fonte IS NOT NULL
WITH aluno, t.fonte AS meio_postagem, h, count(t) AS volume
ORDER BY volume DESC
www
LIMIT 15
RETURN aluno, meio_postagem, h;
