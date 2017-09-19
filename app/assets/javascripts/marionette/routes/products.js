productController = new ProductController();

ProductRouter = Marionette.AppRouter.extend({
  controller: productController,
  appRoutes: {
    'products': 'index',
    'products/new': 'new',
    'products/purchase': 'purchase',
    'products/:id': 'show',
    'products/:id/edit': 'edit',
    'products/:id/confirm': 'confirm'
  },
  onRoute: function(name, path, args) {       // callback
    console.log('User navigated to ' + path);
  }
});
