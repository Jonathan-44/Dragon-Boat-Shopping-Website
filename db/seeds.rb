# Clear existing data
Boat.destroy_all
Cart.destroy_all
Shopper.destroy_all
Order.destroy_all
SalesReport.destroy_all
Vendor.destroy_all

# Shoppers
shopper1 = Shopper.create!(
  email: 'bob@email.com',
  password: 'password'
)

shopper2 = Shopper.create!(
  email: 'james@email.com',
  password: 'password'
)

shopper3 = Shopper.create!(
  email: 'newshopper@email.com',
  password: 'password'
)

# Vendors
vendor1 = Vendor.create!(
  email: 'jenny@email.com',
  password: 'password'
)

vendor2 = Vendor.create!(
  email: 'alex@email.com',
  password: 'password'
)

# Carts
cart1 = shopper1.cart
cart2 = shopper2.cart
cart3 = shopper3.cart

# For sale Boat Listings
boat1 = Boat.create!(
  name: 'Dragon Boat 1',
  color: 'Red',
  description: 'A fast and sleek red dragon boat.',
  price: 1000.00,
  vendor: vendor1,
  sold: false,
  features: 'Scaly Finish'
)

boat2 = Boat.create!(
  name: 'Dragon Boat 2',
  color: 'Blue',
  description: 'A sturdy and reliable blue dragon boat.',
  price: 1200.00,
  vendor: vendor1,
  sold: false,
  features: 'Feathered Finish'
)

boat3 = Boat.create!(
  name: 'Dragon Boat 3',
  color: 'Green',
  description: 'A beautiful green dragon boat.',
  price: 1100.00,
  vendor: vendor1,
  sold: false,
  features: 'Smooth Finish'

)

boat4 = Boat.create!(
  name: 'Dragon Boat 4',
  color: 'Yellow',
  description: 'A bright yellow dragon boat.',
  price: 1300.00,
  vendor: vendor2,
  sold: false,
  features: 'Scaly Finish'
)

boat5 = Boat.create!(
  name: 'Dragon Boat 5',
  color: 'Purple',
  description: 'An elegant purple dragon boat with unique design.',
  price: 1400.00,
  vendor: vendor2,
  sold: false,
  features: 'Leather Finish'
)

boat6 = Boat.create!(
  name: 'Dragon Boat 6',
  color: 'Orange',
  description: 'A vibrant orange dragon boat, perfect for festivals.',
  price: 1500.00,
  vendor: vendor2,
  sold: false,
  features: 'Feathered Finish'
)

# Add boats to carts
cart1.boats << boat1
cart1.boats << boat2
cart2.boats << boat3
cart2.boats << boat4

# New boats to restock
new_boat1 = Boat.create!(
  name: 'Dragon Boat 7',
  color: 'Red',
  description: 'A fast and sleek red dragon boat.',
  price: 1000.00,
  vendor: vendor1,
  sold: true
)

new_boat2 = Boat.create!(
  name: 'Dragon Boat 8',
  color: 'Blue',
  description: 'A sturdy and reliable blue dragon boat.',
  price: 1200.00,
  vendor: vendor1,
  sold: true
)

new_boat3 = Boat.create!(
  name: 'Dragon Boat 9',
  color: 'Purple',
  description: 'An elegant purple dragon boat with unique design.',
  price: 1400.00,
  vendor: vendor2,
  sold: true
)

new_boat4 = Boat.create!(
  name: 'Dragon Boat 10',
  color: 'Orange',
  description: 'A vibrant orange dragon boat, perfect for festivals.',
  price: 1500.00,
  vendor: vendor2,
  sold: true
)

# Add new boats to cart3
cart3.boats << new_boat1
cart3.boats << new_boat2
cart3.boats << new_boat3
cart3.boats << new_boat4

# Create orders and sales reports
order1 = Order.create!(
  name: 'Bob',
  email: 'bob@email.com',
  address: '123 Boat St',
  city: 'Boatville',
  state: 'CA',
  zip: '12345',
  country: 'USA',
  cart: cart3, 
  shopper: shopper3 
)

# Create sales reports for new boats
SalesReport.create!(
  vendor: vendor1,
  boat: new_boat1,
  order: order1,
  sold_at: DateTime.now
)

# Boats for Vendor 1
saleBoat1 = Boat.create!(
  name: 'Sale Boat A',
  description: 'A sturdy dragon boat with a sleek design.',
  color: 'Red',
  features: 'Includes upgraded paddles and a built-in cooler.',
  price: 12000,
  discount: 10,  # 10% discount
  is_on_sale: true,
  vendor: vendor1
)

saleBoat2 = Boat.create!(
  name: 'Sale Boat B',
  description: 'A luxurious dragon boat with premium features.',
  color: 'Blue',
  features: 'Leather seats and a high-end navigation system.',
  price: 15000,
  discount: 15,  # 15% discount
  is_on_sale: true,
  vendor: vendor1
)

# Boats for Vendor 2
saleBoat3 = Boat.create!(
  name: 'Sale Boat C',
  description: 'A fast and agile dragon boat for competitive racing.',
  color: 'Green',
  features: 'Lightweight materials and advanced hull design.',
  price: 14000,
  discount: 12,  # 12% discount
  is_on_sale: true,
  vendor: vendor2
)

saleBoat4 = Boat.create!(
  name: 'Sale Boat D',
  description: 'An all-weather dragon boat with exceptional durability.',
  color: 'Yellow',
  features: 'Durable build and weather-resistant coating.',
  price: 11000,
  discount: 8,  # 8% discount
  is_on_sale: true,
  vendor: vendor2
)

# Events
Event.create!(
  name: "Buffalo Niagara Dragon Boat Festival",
  date: DateTime.new(2024, 8, 1, 10, 0, 0),
  location: "Buffalo, NY",
  description: "A fun-filled dragon boat festival at Buffalo Niagara.",
  url: "https://www.hopechestbuffalo.org/activities"
)

Event.create!(
  name: "Race in Atlanta",
  date: DateTime.new(2024, 9, 15, 9, 0, 0),
  location: "Atlanta, GA",
  description: "Join us for an exciting race in Atlanta.",
  url: "https://www.dragonboatatlanta.com"
)

Event.create!(
  name: "Lake Bemidji Waterfront",
  date: DateTime.new(2024, 10, 5, 11, 0, 0),
  location: "Bemidji, MN",
  description: "Enjoy a beautiful day of dragon boat racing at Lake Bemidji.",
  url: "https://www.bemidjidragonboat.com"
)

# Dragon Races 
dragon_race1 = DragonRace.create!(name: "Dragon Race 1", date: Date.today)
dragon_race2 = DragonRace.create!(name: "Dragon Race 2", date: Date.today + 1.day)
dragon_race3 = DragonRace.create!(name: "Dragon Race 3", date: Date.today + 2.days)

# Placements for dragon_race1
Placement.create!(participant: "Participant 1", position: 1, race_name: dragon_race1.name, date: dragon_race1.date, dragon_race: dragon_race1)
Placement.create!(participant: "Participant 2", position: 2, race_name: dragon_race1.name, date: dragon_race1.date, dragon_race: dragon_race1)
Placement.create!(participant: "Participant 3", position: 3, race_name: dragon_race1.name, date: dragon_race1.date, dragon_race: dragon_race1)

# Placements for dragon_race2
Placement.create!(participant: "Participant 4", position: 1, race_name: dragon_race2.name, date: dragon_race2.date, dragon_race: dragon_race2)
Placement.create!(participant: "Participant 5", position: 2, race_name: dragon_race2.name, date: dragon_race2.date, dragon_race: dragon_race2)
Placement.create!(participant: "Participant 6", position: 3, race_name: dragon_race2.name, date: dragon_race2.date, dragon_race: dragon_race2)

# Placements for dragon_race3
Placement.create!(participant: "Participant 7", position: 1, race_name: dragon_race3.name, date: dragon_race3.date, dragon_race: dragon_race3)
Placement.create!(participant: "Participant 8", position: 2, race_name: dragon_race3.name, date: dragon_race3.date, dragon_race: dragon_race3)
Placement.create!(participant: "Participant 9", position: 3, race_name: dragon_race3.name, date: dragon_race3.date, dragon_race: dragon_race3)



# Reviews for boats
Review.create!(
  boat: boat1,
  shopper: shopper1,
  rating: 5,
  comment: "Incredible performance and sleek design!"
)

Review.create!(
  boat: boat2,
  shopper: shopper2,
  rating: 4,
  comment: "Loved the vibrant color and smooth handling."
)

Review.create!(
  boat: boat3,
  shopper: shopper1,
  rating: 3,
  comment: "Good but a bit pricey for the features offered."
)

Review.create!(
  boat: boat4,
  shopper: shopper2,
  rating: 5,
  comment: "Perfect boat for racing, very fast and lightweight."
)

Review.create!(
  boat: boat5,
  shopper: shopper2,
  rating: 4,
  comment: "Elegant design and comfortable seating."
)

# More reviews as needed...
