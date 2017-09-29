// Model for Product
App.Models.Product = Backbone.Model.extend({
  urlRoot: '/products',
  initialize: function() {
    this.on('change',this.someChange,this)
  },
  someChange: function(model,options){
    console.log('Product is changed!');
  }
});
