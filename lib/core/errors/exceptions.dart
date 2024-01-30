class ServerException implements Exception {
  final String message;

  ServerException([this.message = '']);

  @override
  String toString() {
    if (message.isNotEmpty) {
      return 'ServerException: $message';
    }
    return 'ServerException';
  }
}

class CacheException implements Exception {
  final String message;

  CacheException([this.message = '']);

  @override
  String toString() {
    if (message.isNotEmpty) {
      return 'CacheException: $message';
    }
    return 'CacheException';
  }
}
