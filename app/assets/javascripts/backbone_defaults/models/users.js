App.Models.User = Backbone.Model.extend({
  urlRoot: '/users',
  initialize: function() {
    this.on('change',this.someChange,this)
  },
  defaults : {
    name : 'undefined',
    age : 0,
    type : 'undefined',
    email : 'undefined',
    password : 'undefined'
  },
  someChange: function(model,options){
    alert('User is changed!');
  }
});

App.Collections.Users = Backbone.Collection.extend({
  model: App.Models.User,
  url: '/users',
  initialize : function() {
    this.on('add',this.addUser,this);
    this.on('change',this.changeUser,this);
  },
  addUser : function(model) {
    alert('welcome '+ model.get('user_id'));
  },
  changeUser : function() {
    alert('Users are changed!');
  }
});
