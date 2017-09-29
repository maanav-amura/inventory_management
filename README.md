# Inventory Management System

### Feature

* **Customer/Shopkeeper/Vendor can purchase products from factory**
* **Invoice is automatically generated for purchased products**
* **Inventory managers provides the production capacity of the products**
* **Sales managers can change the prices of the products**
* **Factory manager can manage inventory manager, sales manager and products**

### Models

* Factory
* User
  * Buyer
    * Customer
    * Shopkeeper
    * Vendor
  * Manager
    * FactoryManager
    * InventoryManager
    * SalesManager
* Product
* Product Details
* InvoiceBill

### Tables

* factories
* users
* products
* invoice_bills

### Associations

_one-to_many_
* Factory - User
* Factory - Product
* User - Invoice Bill

_embeds-many_
* Product Details - User

### Gems Functionality
* Devise
* CanCanCan
* FactoryGirl
* Rspec
* SimpleCov
* Faker
