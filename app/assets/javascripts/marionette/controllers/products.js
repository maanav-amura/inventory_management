var ProductController = Marionette.Controller.extend({
    index: function() {
    console.log('index');
    var products = new App.Models.Product();
    products.fetch().done(function() {
      console.log($('#user_type').data('id'));
      var product_view = new ProductIndexLayout({model: products});
      $('body').html(product_view.render().$el);
      // product_view.showChildView('list',new ProductIndex( {model: products} ) ); // on attach
    });
  },
  show: function() { console.log('show'); },
  new: function() { console.log('new') },
  edit: function() { console.log('edit') },
  purchase: function() { console.log('purchase') },
  confirm: function() { console.log('confirm') }
});
