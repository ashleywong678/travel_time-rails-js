# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Agency.create(name: "Star Agency", email: "admin@star.com", address: "123 Star St", country: "US", language: "English", phone_number: "111111111", password: "123")
Agency.create(name: "Travago", email: "admin@travago.com", address: "Middle of nowhere", country: "Some country", language: "Alien", phone_number: "1234567890", password: "123")
Agency.create(name: "Tien Ma Travels", email: "admin@tienma.com", address: "Chinatown", country: "China", language: "Mandarin", phone_number: "8888888888", password: "123")

# Tour.create(title: "Overnight Toronto", country: "Canada", date: "", length: 1, price: 100, description: "Overnight to Toronto fron NYC", agency_id: 1)
# Tour.create(title: "3 days 2 nights Mexico City, Mexico", country: "Mexico", date: "", length: 2, price: 300, description: "3 days 2 nights in 4 star resort in Mexico City. Hotel and airfare not included", agency_id: 2)
# Tour.create(title: "Star Galactica", country: "Space", date: "", length: 2, price: 1000000000, description: "Spend 2 nights in the famous Star Galactica", agency_id: 3)
# Tour.create(title: "7 nights Shanghai", country: "China", date: "", length: 7, price: 2000, description: "7 nights in Shanghai, China flying out from LAX. Hotel and airfare included.", agency_id: 3)

