var ProductIndexLayout= Marionette.LayoutView.extend({
  template: JST['product_layout'],
  regions: {
    list: '.list'
  },
  onRender: function() {
    this.showChildView('list',new ProductCollection({ model: this.model } ));
  }
});
