// 1. Identificação pessoal
CREATE (:Aluno {ru: "<ID>", nome: "<NOME>"});

// 2. Definição do intervalo de arquivos JSON
WITH [1 IN range (313,317) | "tweets_coletados_"+i+".json"] AS arquivos
UNWIND arquivos AS arquivo
CALL apoc.load.json(arquivo) YIELD value
UNWIND value.data AS dado

// 3. Criação de Usuários e Mensagens
MERGE (u: User (id_original: dado author_id])
MERGE (m: Tweet [id_tweet: dado.id])
SET m.texto dado.text,
m.fonte dado.source,
m.ru_aluno = "<ID>"

// 4. Relacionamento de autoria
B MERGE (u)-[:ORIGINOU]→(m)
       
// 5. Hashtags
5 FOREACH (h IN dado entities.hashtags
MERGE (tag: Hashtag
nome: apoc.text.replace(apoc.text.clean(h.tag), '[^a-zA-Z0-9]', '')
})
MERGE (m)-[:POSSUI_TAG]→(tag)
           
// 6. Classificação
FOREACH (ref IN [r IN dado.referenced_tweets WHERE r.type = 'retweeted"]
SET m: Retweet
3 FOREACH (ref IN [r IN dado.referenced_tweets WHERE r.type 'quoted'] |
SET m: Quoted
FOREACH (ref IN [r IN dado.referenced_tweets WHERE r.type 'replied_to'] |
SET m: Replied
)

// 7. Validação
MERGE (aluno): VALIDOU_DADOS(m);
