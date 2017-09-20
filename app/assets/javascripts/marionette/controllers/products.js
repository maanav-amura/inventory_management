var ProductController = Marionette.Controller.extend({
    index: function() {
    console.log('index');
    var products = new App.Models.Product();
    products.fetch().done(function() {
      alert($('#user_type').data('id'));
      var product_view = new ProductIndex({model: products});
      $('body').append(product_view.render().$el);
    })
  },

  show: function() { console.log('show'); },
  new: function() { console.log('new') },
  edit: function() { console.log('edit') },
  purchase: function() { console.log('purchase') },
  confirm: function() { console.log('confirm') }
});

