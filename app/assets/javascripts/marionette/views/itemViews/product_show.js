var ProductShow = Marionette.ItemView.extend({
  template: JST['product_show'],
  events: {
    'click .back': 'productBack'
  },
  productBack: function(e) {
    Backbone.history.navigate('products',{trigger: true});
  }
});
