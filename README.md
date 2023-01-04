# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## About

The purpose of this project was to simulate jumping into a project team working on an existing application using an unfamiliar programming language and framework. The application was functional but limited to start with. The following features were added to the oringinal application as part of the project:

1. **Feature: Sold Out Badge**

   Products will show if they are in stock or not and disable adding to cart if they are sold out. Prior this addition, products could be added to cart and purchased regardless of availability.

2. **Feature: Admin Categories**

   Administators have the ability to create new product categories, add products to these new categories and Category admin page is accessed using Restful routes. Prior to this only pre-existing categories were available to be used.

3. **Feature: User Authentication**

   Users can sign up, log in and log out using an e-mail and password. Passwords are not stored in plain text, rather leveraging `has_secure_password` and the `bcrypt` gem.

4. **Enhancement: Order Details Page**

   Once an order is placed, the user now sees details of the order instead of just a confirmation.

5. **Bug: Missing Admin Security**

   Added basic admin login using HTTP auth. Prior to this anyone could access admin pages.

6. **Bug: Checking Out with Empty Cart**

   When accessing the page to display your cart, application now displays a message if the cart is empty and provides a link to the home page. Prior, user would see payment and checkout option even if nothing in cart.

7. **Automated Tests**

   Tests were added for the product and user models using Rspec. Feature tests for adding items to the cart and user signup/login/logout were added using Cypress.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
