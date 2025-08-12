enum AppRoute {
  home(path: '/home', name: 'Home'),
  login(path: '/login', name: 'Login');

  const AppRoute({required this.path, required this.name});

  final String path;
  final String name;
}
