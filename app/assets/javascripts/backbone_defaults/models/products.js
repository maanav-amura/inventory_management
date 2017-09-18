App.Models.Product = Backbone.Model.extend({
  urlRoot: '/products',
  initialize: function() {
    this.on('change',this.someChange,this)
  },
  defaults : {
    name : 'untitled',
    price : 0,
    capacity : 0,
    available : false
  },
  someChange: function(model,options){
    alert('Product is changed!');
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
    alert('welcome '+ model.get('name'));
  },
  changeProduct : function() {
    alert('Products are changed!');
  }
});
