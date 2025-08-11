// - Faça uma busca de quantos livros não estão com o status publicado e pageCount menor que 300.

db.books.find({
  status: { $ne: "PUBLISH" },
  pageCount: { $lt: 300 }
})

// - Faça uma busca de livros que contém as palavras MongoDB e SQL Server no título

db.books.find({
  title: {$regex: "MongoDB|SQL Server", $options: "i" }  //$regex com "MongoDB|SQL Server" busca qualquer um dos termos, $options: "i" ignora maiúscula ou minúscula.
})

// - Faça uma busca com expressão regular onde ISBN começa com 18 

db.books.find({
  isbn: { $regex: "^18" }  // O ^ indica que a string deve iniciar com 18
})

// - Usando Expressão Regular, busque livros que contém a palavra JAVA ou Mobile na descrição do livro (LongDescription), lembrando que deve trazer todas as palavras independente de começa com maiúsculo ou minúsculo 

db.books.find({
  longDescription: {$regex: "java|mobile", $options: "i" }
})

// Exercício 2: Nas mesmas buscas do exercício anterior, traga apenas o número do resultado usando o contador

db.books.countDocuments({
  status: { $ne: "PUBLISH" },
  pageCount: { $lt: 300 }
})

db.books.countDocuments({
  title: {$regex: "MongoDB|SQL Server", $options: "i" }
})

db.books.countDocuments({
  isbn: { $regex: "^18" }  // O ^ indica que a string deve iniciar com 18
})

db.books.countDocuments({
  longDescription: {$regex: "java|mobile", $options: "i" }
})