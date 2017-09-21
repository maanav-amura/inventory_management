App.Models.Product = Backbone.Model.extend({
  urlRoot: '/products',
  initialize: function() {
    this.on('change',this.someChange,this)
  },
  someChange: function(model,options){
    console.log('Product is changed!');
  }
});

App.Collections.Products = Backbone.Collection.extend({
  model: App.Models.Product,
  url: '/products',
  initialize : function() {
    this.on('add',this.addProduct,this);
    this.on('change',this.changeProduct,this);
  },
  addProduct : function(model) {
    console.log('welcome '+ model.get('name'));
  },
  changeProduct : function() {
    console.log('Products are changed!');
  }
});
