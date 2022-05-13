# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all
Library.destroy_all

koelbel = Library.create!(name: "Koelbel", branch_num: 1, city: "Centennial", open: true)
sheridan = Library.create!(name: "Sheridan", branch_num: 3, city: "Denver", open: false)

koelbel.books.create!(title: "Leaves of Grass", author: "Walt Whitman", copyright: 1855, available: true)
koelbel.books.create!(title: "The Sea-Wolf", author: "Jack London", copyright: 1904, available: true)
koelbel.books.create!(title: "Dune", author: "Frank Herbert", copyright: 1965, available: false)
koelbel.books.create!(title: "Treasure Island", author: "Robert Louis Stevenson", copyright: 1883, available: true)

sheridan.books.create!(title: "Of Mice and Men", author: "John Steinbeck", copyright: 1937, available: false)
sheridan.books.create!(title: "Pride and Prejudice", author: "Jane Austen", copyright: 1813, available: true)
sheridan.books.create!(title: "The Pilgrim's Progress From This World To That Which Is To Come", author: "John Bunyan", copyright: 1678, available: false)
sheridan.books.create!(title: "Alice's Adventures in Wonderland", author: "Lewis Carroll", copyright: 1865, available: false)
sheridan.books.create!(title: "Twenty Thousand Leagues Under the Sea", author: "Jules Verne", copyright: 1870, available: false)
sheridan.books.create!(title: "The Secret Garden", author: "Frances Hodgson Burnett", copyright: 1987, available: true)
sheridan.books.create!(title: "Jane Eyre", author: "Charlotte Bronte", copyright: 1847, available: false)