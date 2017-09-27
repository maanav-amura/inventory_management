// Model for Invoice
App.Models.Invoice = Backbone.Model.extend({
  urlRoot: '/invoices',
  initialize: function() {
    this.on('change',this.someChange,this)
  },
  someChange: function(model,options){
    alert('Invoice is changed!');
  }
});
