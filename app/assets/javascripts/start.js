$( document ).ready(function() {
  var app = new Backbone.Marionette.Application();
  app.on('start', function() {
    new ProductRouter();
    new InvoiceRouter();
    new UserRouter();

    // Changing idAttribute
    Backbone.Model.prototype.idAttribute = "_id";

    Backbone.history.start({pushState: true});
  });
  app.start();
});
