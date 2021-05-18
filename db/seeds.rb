# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'tester@tester.com', password: '123456')

User.first.contents.create(title: 'A nice title', description: 'What an awsome description can be put inside here?')

Content.first.tags.create(name: 'Ruby', user: User.first)
