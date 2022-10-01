abstract class NetworkProviderAC {
  Future<dynamic> request({
    required String endpoint,
    required HttpMethod method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });

  Future<void> send({
    required String endpoint,
    required HttpMethod method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  });
}

enum HttpMethod { get, post, delete }
