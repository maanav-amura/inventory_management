var ProductComposite = Marionette.CompositeView.extend({
  template: JST['product_composite'],
  childView: ProductIndex,
  childViewContainer: 'tbody'
});
