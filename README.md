# 📊 Análise de Dados de Rede Social com Neo4j

Projeto desenvolvido para a disciplina de NoSQL utilizando o banco de dados em grafo Neo4j para análise de interações entre usuários, tweets e hashtags a partir de arquivos JSON.

## 📍 Objetivo

Criar um banco de dados em grafo capaz de representar relações entre mensagens, usuários e hashtags, permitindo realizar análises sobre padrões de comportamento em dados de redes sociais.

## 🛠️ Tecnologias Utilizadas

- Neo4j
- Linguagem Cypher
- Biblioteca APOC
- Arquivos JSON

## ⚙️ Modelagem do Grafo

O banco de dados foi estruturado utilizando os seguintes tipos de nós:

Usuário  
Tweet  
Retweet  
Resposta  
Citação  
Hashtag  

Relacionamentos criados:

POSTOU  
RETUITOU  
RESPONDEU  
CITOU  
POSSUI_HASHTAG

## 📶 Importação dos Dados

Os dados foram importados a partir de arquivos JSON utilizando a biblioteca APOC do Neo4j.

Exemplo de consulta Cypher utilizada na importação:

CALL apoc.load.json("file:///tweets.json")
YIELD value
MERGE (u:User {id:value.user.id})
MERGE (t:Tweet {id:value.id})

## Análise 1 — Descoberta da Hashtag Principal

Foi criada uma consulta em Cypher para identificar qual hashtag aparece em todas as mensagens originais.

Resultado encontrado:

#issoaglobonaomostra

## Análise 2 — Dispositivos Utilizados para Postagem

Outra consulta foi realizada para identificar quais dispositivos foram mais utilizados para publicar tweets relacionados às hashtags analisadas.

Resultado:

Maior volume de postagens provenientes de dispositivos móveis, como Android e iPhone.

## 📚 Aprendizados

Durante o desenvolvimento do projeto foram explorados conceitos como:

- Modelagem de dados em grafos
- Importação de dados estruturados em JSON
- Criação de consultas analíticas em Cypher
- Análise de padrões em dados de redes sociais

## 👤 Autor

Ana Julia Alves Dias  
