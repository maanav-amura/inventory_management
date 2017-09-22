var ProductIndexLayout= Marionette.LayoutView.extend({
  template: JST['product_layout'],
  regions: {
    list: '.list'
  },
  onRender: function() {
    this.showChildView('list',new ProductComposite({ collection: this.collection } ));// Passing Collection in Composite View
    // this.showChildView('list',new ProductCollection({ collection: this.collection } ));// Passing Model in Collection View
  }
});
