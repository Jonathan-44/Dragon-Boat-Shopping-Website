# README

Dragon Boat Basic Webpage
This project is a web application for purchasing dragon boats, designed to allow vendors to list boats for sale, while shoppers can browse, filter, and purchase boats. The application includes features such as image uploads for boats, sorting and filtering options, an integrated cart system, and event listings.

Ruby Version
Ruby 3.1.2

System Dependencies
Rails 7.0.4

PostgreSQL for database management

1. Configuration
Clone the repository:
  - git clone https://github.com/your-username/dragon-boat-basic-webpage.git
  - cd dragon-boat-basic-webpage

2. Install dependencies:
   - bundle install
  
3. Database Initialization
The seed file creates sample shoppers, vendors, boats, and events, along with adding some boats to carts.
  - rails db:migrate:reset db:seed

4. Run using
   - rails server
  
5. Open server using http://localhost:3000/
