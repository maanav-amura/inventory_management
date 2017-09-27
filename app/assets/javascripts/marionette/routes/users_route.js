userController = new UserController();

UserRouter = Marionette.AppRouter.extend({
  controller: userController,
  appRoutes: {
    'users/sign_in': 'sign_in',
    'users/sign_up': 'sign_up',
    '': 'sign_in'
  },
  onRoute: function(name, path, args) {       // callback
    console.log('User navigated to ' + path);
  }
});
