var ProductNew = Marionette.ItemView.extend({
  template: JST['product_new'],
  events: {
    'click .create': 'productCreate',
    'click .back': 'productBack'
  },
  productCreate: function() {
    product = new  App.Models.Product();
    product.save({name: $('#name').val(),
      capacity: $('#capacity').val(),
      price: $('#price').val(),
      available: $('#available').val(),
      factory_id: "59b26c61a870c630de1c22af"
     },
    {
      success: function(model, response) {
        Backbone.history.navigate('products', {trigger: true})
    }});
  },
  productBack: function(e) {
    Backbone.history.navigate('products',{trigger: true});
  }
});
