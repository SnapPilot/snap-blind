enum AppRoute {
  home(path: '/home', name: 'Home'),
  login(path: '/login', name: 'Login'),
  chatList(path: '/chatList', name: 'ChatList'),
  myInfo(path: '/myInfo', name: 'MyInfo'),
  chat(path: '/chat', name: 'Chat'),
  adminLogin(path: '/admin-login', name: 'AdminLogin');

  const AppRoute({required this.path, required this.name});

  final String path;
  final String name;
}
