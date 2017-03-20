# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Product.create! id: 1, name: "Banana", price: 0.49, active: true
Product.create! id: 2, name: "Maçã", price: 0.29, active: true
Product.create! id: 3, name: "Morango", price: 1.99, active: true

SaleStatus.delete_all
SaleStatus.create! id: 1, name: "Em andamento"
SaleStatus.create! id: 2, name: "Finalizado"
SaleStatus.create! id: 3, name: "Cancelado"

Payment.delete_all
Payment.create! id: 1, name: "A vista"
Payment.create! id: 2, name: "Crédito"
Payment.create! id: 3, name: "Débito"
Payment.create! id: 4, name: "Outros"