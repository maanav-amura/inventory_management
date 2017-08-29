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
* InvoiceBill
* InvoiceDetail

### Tables

* factories
* users
* products
* products_users
* invoice_bills
* invoice_details

### Associations

_one-to-one_
* Factory - FactoryManager

_one-to_many_
* Factory - User
* User - Manager
* User - Buyer
* User - InvoiceBill

_many-to_many_
* Manager - Product
* InvoiceBill - Product, through => InvoiceDetail
