// Composite Views and Events
var ProductList = Marionette.CompositeView.extend({
  template: JST['product_list'],
  childView: ProductItem,
  childViewContainer: 'tbody',
    events: {
    'click .new ': 'new',
    'keyup #search' : 'search'
  },
  new: function() {
    Backbone.history.navigate('products/new',{trigger: true});
  },
  search: function() {
    $.ajax({
      type: 'GET',
      url: '/products/search',
      data: { search : $('#search').val() },
      dataType: 'json',
      success: function(response) {
        $('#products').text("");
        response.forEach(function(product) {
          $('#products').append('<option value="' + product.name + '">');
        })
      }
    });
  }
});
