# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Store.create([{ name: "Safeway", address: "2020 Market St, San Francisco, CA" },
    { name: "Bi Rite", address: "3639 18th St, San Francisco, CA 94110" },
    { name: "Duc Lio", address: "2200 Mission St, San Francisco, CA 94110" },
    { name: "Mi Ranchito Produce", address: "2169 Mission Street, San Francisco, CA 94110" }])

Product.create([{ name: "Cashew Cookie", brand: "Larabar" },
    { name: "Apple Pie", brand: "Larabar" },
    { name: "Oatmeal Walnut Raisin", brand: "Clif Bar" },
    { name: "Carrot Juice", brand: "MANY CARROTS" },
    { name: "Flour", brand: "King Arthur" },
    { name: "White Miso", brand: "Misoso" },
    { name: "Mango-banana-kale smoothie", brand: "Adam's Kitchen" },])

User.create([{ name: "Adam", email: "adam@example.com", password: "password", password_confirmation: "password" },
    { name: "Ned", email: "ned@example.com", password: "password", password_confirmation: "password" },
    { name: "Jonathan", email: "jonathan@example.com", password: "password", password_confirmation: "password" }])

StoreProduct.create([{ store_id: 1, product_id: 1, price: 200 },
    { store_id: 1, product_id: 2, price: 200 },
    { store_id: 1, product_id: 3, price: 250 },
    { store_id: 1, product_id: 4, price: 425 },
    { store_id: 1, product_id: 5, price: 600 },
    { store_id: 1, product_id: 6, price: 799 },
    { store_id: 2, product_id: 1, price: 195 },
    { store_id: 2, product_id: 2, price: 150 },
    { store_id: 2, product_id: 4, price: 400 },
    { store_id: 2, product_id: 5, price: 523 },
    { store_id: 3, product_id: 7, price: 999 },
    { store_id: 3, product_id: 6, price: 700 },
    { store_id: 3, product_id: 1, price: 175 },
    { store_id: 4, product_id: 1, price: 160 },
    { store_id: 4, product_id: 2, price: 205 },
    { store_id: 4, product_id: 7, price: 1299 }])