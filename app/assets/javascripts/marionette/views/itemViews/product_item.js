var ProductItem = Marionette.ItemView.extend({
  template: JST['product_item'],

  tagName: 'tr',

  events: {
    'click .show': 'productShow',
    'click .edit' : 'productEdit',
    'click .remove': 'productRemove'
  },

  productShow: function(e) {
    Backbone.history.navigate(`products/${$(e.currentTarget).data("id")}`, {trigger: true, replace: true});
  },

  productEdit: function(e) {
    Backbone.history.navigate(`products/${$(e.currentTarget).data("id")}/edit`, {trigger: true, replace: true});
  },

  productRemove: function(e) {
    this.model.destroy({
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
