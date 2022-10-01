import 'package:rzagram/data/networking/network_provider_ac.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkProvider extends NetworkProviderAC {
  final String baseURL;

  NetworkProvider({required this.baseURL});

  @override
  Future<dynamic> request({
    required String endpoint,
    required HttpMethod method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    Uri url = Uri.https(baseURL, endpoint);
    http.Response response;
    switch (method) {
      case HttpMethod.get:
        response = await http.get(url, headers: headers);
        break;
      case HttpMethod.post:
        response = await http.post(url, headers: headers, body: body);
        break;
      case HttpMethod.delete:
        response = await http.delete(url, headers: headers, body: body);
        break;
    }
    return json.decode(response.body);
  }

  @override
  Future<void> send({
    required String endpoint,
    required HttpMethod method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    Uri url = Uri.https(baseURL, endpoint);
    switch (method) {
      case HttpMethod.get:
        await http.get(url, headers: headers);
        break;
      case HttpMethod.post:
        await http.post(url, headers: headers, body: body);
        break;
      case HttpMethod.delete:
        await http.delete(url, headers: headers, body: body);
        break;
    }
  }
}
