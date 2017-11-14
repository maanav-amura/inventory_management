// Collections for Invoices with Model Invoice
App.Collections.Invoices = Backbone.Collection.extend({
  model: App.Models.Invoice,
  url: '/invoices',
  initialize : function() {
    this.on('add',this.addInvoice,this);
    this.on('change',this.changeInvoice,this);
  },
  addInvoice : function(model) {
    alert(model.get('user_id'));
  },
  changeInvoice : function() {
    alert('Invoices are changed!');
  }
});
