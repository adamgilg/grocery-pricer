# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Store.create([{ name: "Safeway", address: "2020 Market St, San Francisco, CA" },
    { name: "Bi Rite", address: "3639 18th St, San Francisco, CA 94110" },
    { name: "Duc Loi", address: "2200 Mission St, San Francisco, CA 94110" },
    { name: "Mi Ranchito Produce", address: "2169 Mission Street, San Francisco, CA 94110" }])

Product.create([{ name: "Cashew-date bar", brand: "Barbar", description: "dates and cashews pressed into a bar" },
    { name: "Apple raisin walnut bar", brand: "Barbar", description: "fruit in bar-shape" },
    { name: "Oatmeal Walnut Raisin bar", brand: "Energy-bar-brand", description: "lots of calories" },
    { name: "Carrot Juice", brand: "MANY CARROTS", description: "basic carrot juice" },
    { name: "Unbleached White Flour, 5 lbs", brand: "Baker's Dee-lite", description: "'nuff said" },
    { name: "White Miso", brand: "Misoso", description: "organic soybean miso" },
    { name: "Mango-banana-kale smoothie", brand: "Adam's Kitchen", description: "the most delicious" },
    { name: "Cocoa Powder", brand: "Chocolatier", description: "unsweetened cocoa powder for baking" },
    { name: "Brown eggs, 1 dozen", brand: "Hen Co-op", description: "organic, cage free brown eggs" },
    { name: "White sugar, 5 lbs", brand: "Baker's Dee-lite", description: "boring ol' white sugar" },
    { name: "Unsalted butter, 1 lb", brand: "Dairy Farmers of America", description: "no salt here." },
    { name: "Baking soda", brand: "Baker's Dee-lite", description: "sodium bicarbonate" },
    { name: "Baking powder", brand: "Baker's Dee-lite", description: "sodium bicarbonate + tartaric acid" }])

User.create([{ name: "Adam", email: "adam@example.com", password: "password", password_confirmation: "password" },
    { name: "Ned", email: "ned@example.com", password: "password", password_confirmation: "password" },
    { name: "Jonathan", email: "jonathan@example.com", password: "password", password_confirmation: "password" }])

StoreProduct.create([{ store_id: 1, product_id: 1, price: 200 },
    { store_id: 1, product_id: 2, price: 200 },
    { store_id: 1, product_id: 3, price: 250 },
    { store_id: 1, product_id: 4, price: 425 },
    { store_id: 1, product_id: 5, price: 600 },
    { store_id: 1, product_id: 6, price: 799 },
    { store_id: 1, product_id: 8, price: 800 },
    { store_id: 1, product_id: 9, price: 699 },
    { store_id: 1, product_id: 10, price: 725 },
    { store_id: 1, product_id: 11, price: 499 },
    { store_id: 1, product_id: 12, price: 400 },
    { store_id: 1, product_id: 13, price: 425 },
    { store_id: 2, product_id: 1, price: 195 },
    { store_id: 2, product_id: 2, price: 150 },
    { store_id: 2, product_id: 4, price: 400 },
    { store_id: 2, product_id: 5, price: 523 },
    { store_id: 2, product_id: 8, price: 825 },
    { store_id: 2, product_id: 9, price: 525 },
    { store_id: 2, product_id: 10, price: 500 },
    { store_id: 2, product_id: 11, price: 450 },
    { store_id: 2, product_id: 12, price: 250 },
    { store_id: 2, product_id: 13, price: 350 },
    { store_id: 3, product_id: 7, price: 999 },
    { store_id: 3, product_id: 6, price: 700 },
    { store_id: 3, product_id: 1, price: 175 },
    { store_id: 4, product_id: 1, price: 160 },
    { store_id: 4, product_id: 2, price: 205 },
    { store_id: 4, product_id: 7, price: 1299 },
    { store_id: 4, product_id: 5, price: 500 },
    { store_id: 4, product_id: 8, price: 700 },
    { store_id: 4, product_id: 9, price: 599 },
    { store_id: 4, product_id: 10, price: 625 },
    { store_id: 4, product_id: 11, price: 399 },
    { store_id: 4, product_id: 12, price: 300 },
    { store_id: 4, product_id: 13, price: 325 }])