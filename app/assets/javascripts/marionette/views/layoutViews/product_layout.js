// Single Layout for Products CRUD
var ProductLayout= Marionette.LayoutView.extend({
  template: JST['product_layout'],
  regions: {
    list: '.list'
  },

  onRender: function() {
    // Passing collection and rendering in Composite View
    this.showChildView('list',new ProductList({ collection: this.collection } ));

    // Passing collection and rendering in Collection View
    // this.showChildView('list',new ProductCollection({ collection: this.collection } ));
  }
});
