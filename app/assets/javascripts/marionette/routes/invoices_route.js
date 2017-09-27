invoiceController = new InvoiceController();

InvoiceRouter = Marionette.AppRouter.extend({
  controller: invoiceController,
  appRoutes: {
    'invoices': 'index',
    'invoices/:id': 'show'
  },
  onRoute: function(name, path, args) {       // callback on route
    console.log('User navigated to ' + path);
  }
});
