var ProductController = Marionette.Controller.extend({
    index: function() {
    console.log('index');
    var products = new App.Collections.Products();
    products.fetch().done(function() {
      var product_view = new ProductLayout({collection: products});
      $('body').html(product_view.render().$el);
    });
  },
  show: function() { console.log('show'); },
  new: function() { console.log('new') },
  edit: function() { console.log('edit') },
  purchase: function() { console.log('purchase') },
  confirm: function() { console.log('confirm') }
});
