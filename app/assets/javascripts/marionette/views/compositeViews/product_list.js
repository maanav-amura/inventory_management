var ProductList = Marionette.CompositeView.extend({
  template: JST['product_list'],
  childView: ProductItem,
  childViewContainer: 'tbody',
    events: {
    'click .new': 'new',
  },
  new: function() {
    Backbone.history.navigate('products/new',{trigger: true});
  }
});
