$( document ).ready(function() {
  var app = new Backbone.Marionette.Application();
  app.on('start', function() {
    var productRouter = new ProductRouter();
    var invoiceRouter = new InvoiceRouter();
    var userRouter = new UserRouter();

    Backbone.history.start({pushState: true});
  });
  app.start();
});
