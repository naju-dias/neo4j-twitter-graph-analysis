MATCH (autor: Aluno {ru: "<ID>"})
CALL {
MATCH (t:Tweet)-[: POSSUI_TAG]→(tag: Hashtag)
// Filtro para ignorar retweets e respostas (tweets não originais)
WHERE NOT t: Retweet AND NOT t: Replied
RETURN tag, count(t) AS total
ORDER BY total DESC
LIMIT 1
}
MATCH (tag) [r: POSSUI_TAG]-(mensagens)
RETURN autor, tag, r, mensagens
LIMIT 25;
