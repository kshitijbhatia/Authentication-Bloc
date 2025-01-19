class DataException implements Exception {
  final int? statusCode;
  final String message;

  DataException(this.message, {this.statusCode});
}