// Collections for Products with Model Product
App.Collections.Products = Backbone.Collection.extend({
  model: App.Models.Product,
  url: '/products',
  initialize : function() {
    this.on('add',this.addProduct,this);
    this.on('change',this.changeProduct,this);
  },
  addProduct : function(model) {
    console.log(model.get('name'));
  },
  changeProduct : function() {
    console.log('Products are changed!');
  }
});
