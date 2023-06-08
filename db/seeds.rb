# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Crear usuarios

User.create([
  { email: 'email1@example.com', password: 'password1' },
  { email: 'email2@example.com', password: 'password2' },
  { email: 'email3@example.com', password: 'password3' }
])

# Crear artículos
Article.create([
  { title: 'Título del artículo 1', content: 'Contenido del artículo 1', user: User.first },
  { title: 'Título del artículo 2', content: 'Contenido del artículo 2', user: User.second },
  { title: 'Título del artículo 3', content: 'Contenido del artículo 3', user: User.third }
])

# Crear comentarios
Comment.create([
  { content: 'Comentario 1', article: Article.first, user: User.second },
  { content: 'Comentario 2', article: Article.first, user: User.third },
  { content: 'Comentario 3', article: Article.second, user: User.first },
  { content: 'Comentario 4', article: Article.second, user: User.third },
  { content: 'Comentario 5', article: Article.third, user: User.first },
  { content: 'Comentario 6', article: Article.third, user: User.second }
])
