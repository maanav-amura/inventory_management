var ProductList = Marionette.CompositeView.extend({
  template: JST['product_list'],
  childView: ProductItem,
  childViewContainer: 'tbody'
});
