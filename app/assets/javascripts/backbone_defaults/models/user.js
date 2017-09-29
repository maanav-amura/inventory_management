// Model for User
App.Models.User = Backbone.Model.extend({
  urlRoot: '/users',
  initialize: function() {
    this.on('change',this.someChange,this)
  },
  someChange: function(model,options){
    alert('User is changed!');
  }
});
