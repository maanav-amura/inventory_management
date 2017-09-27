// Collections for Users with Model User
App.Collections.Users = Backbone.Collection.extend({
  model: App.Models.User,
  url: '/users',
  initialize : function() {
    this.on('add',this.addUser,this);
    this.on('change',this.changeUser,this);
  },
  addUser : function(model) {
    alert(model.get('user_id'));
  },
  changeUser : function() {
    alert('Users are changed!');
  }
});
