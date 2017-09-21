var ProductIndex = Marionette.ItemView.extend({
  events: {
    'click .show': 'productShow',
    'click .edit' : 'productEdit',
    'click .remove': 'productRemove'
  },
  template: JST['product_index'],
  serializeData: function() {
    return {
      'products' : this.model.attributes
    }
  },
  productShow: function(e) {
    Backbone.history.navigate(`products/${$(e.currentTarget).data("id")}`, {trigger: true, replace: true});
  },
    productEdit: function(e) {
    Backbone.history.navigate(`products/${$(e.currentTarget).data("id")}/edit`, {trigger: true, replace: true});
  },
  productRemove: function(e) {
    $('#' + $(e.currentTarget).data("id")).remove();
         //  debugger
    $.ajax({
      url: `products/${$(e.currentTarget).data("id")}`,
      type: 'DELETE',
      success: function(result) {
        Backbone.history.navigate('products', {trigger: true});
      }
    });
  },
  onBeforeRender: function() {
    console.log('before render');
  },
  onRender: function() {
    console.log('on render');
  },
  onBeforeDestroy: function() {
    console.log('before destroy');
  },
  onDestroy: function() {
    console.log('on destroy');
  },
  onAttach: function() {
    console.log('on attach')
  }
});

