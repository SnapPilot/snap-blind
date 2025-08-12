enum AppRoute {
  home(path: '/home', name: 'Home');

  const AppRoute({required this.path, required this.name});

  final String path;
  final String name;
}
