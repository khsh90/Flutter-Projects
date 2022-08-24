class CustomHttpException implements Exception {
  final message;

  CustomHttpException(this.message);

  @override
  String toString() => message;
}
