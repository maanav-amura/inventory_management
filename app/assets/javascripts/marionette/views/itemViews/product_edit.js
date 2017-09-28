var ProductEdit = Marionette.ItemView.extend({
  template: JST['product_edit'],
  events: {
    'click .back': 'productBack',
    'click .edit': 'productUpdate'
  },
  productBack: function(e) {
    Backbone.history.navigate('products', {trigger: true});
  },
  productUpdate: function(e) {
    this.model.save({name: $('#name').val(),
      capacity: $('#capacity').val(),
      price: $('#price').val(),
      available: $('#available').val()
    },
    {
      success: function(model, response) {
        Backbone.history.navigate('products', {trigger: true})
    }});
  }
});
