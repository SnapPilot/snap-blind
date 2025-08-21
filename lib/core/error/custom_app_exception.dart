base class CustomAppException implements Exception {
  CustomAppException({this.message = "", this.cause});

  final String message;
  final Object? cause;
}
