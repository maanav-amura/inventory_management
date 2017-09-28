var ProductController = Marionette.Controller.extend({
    index: function() {
    console.log('index');
    var products = new App.Collections.Products();
    products.fetch().done(function() {
      var product_view = new ProductLayout({collection: products});
      $('body').html(product_view.render().$el);
    });
  },
  show: function(id) {
    console.log('show');
    product = new App.Models.Product({ _id: id });
    product.fetch().done(function() {
      var product_view = new ProductShow({model: product});
      $('body').html(product_view.render().$el);
    });
  },
  new: function() {
    console.log('new');
    var product_view = new ProductNew();
    $('body').html(product_view.render().$el);
  },
  edit: function(id) {
   console.log('edit');
    product = new App.Models.Product({_id: id });
    product.fetch().done(function() {
      var product_view = new ProductEdit({model: product});
      $('body').html(product_view.render().$el);
    });
  },
  purchase: function() { console.log('purchase') },
  confirm: function() { console.log('confirm') }
});
