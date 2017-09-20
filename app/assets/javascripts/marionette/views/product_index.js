var ProductIndex = Marionette.ItemView.extend({
  template: JST['product'],
  serializeData: function() {
    return {
      'products' : this.model.attributes
    }
  }
});
