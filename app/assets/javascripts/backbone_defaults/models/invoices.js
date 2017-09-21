App.Models.Invoice = Backbone.Model.extend({
  urlRoot: '/invoices',
  initialize: function() {
    this.on('change',this.someChange,this)
  },
  someChange: function(model,options){
    alert('Invoice is changed!');
  }
});

App.Collections.Invoices = Backbone.Collection.extend({
  model: App.Models.Invoice,
  url: '/invoices',
  initialize : function() {
    this.on('add',this.addInvoice,this);
    this.on('change',this.changeInvoice,this);
  },
  addInvoice : function(model) {
    alert('welcome '+ model.get('user_id'));
  },
  changeInvoice : function() {
    alert('Invoices are changed!');
  }
});
