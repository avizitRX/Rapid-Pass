import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:io';

HttpClient getHttpClient() {
  HttpClient client = HttpClient();
  client.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  return client;
}

http.Client getHttpClientWithCertificateValidation() {
  return IOClient(getHttpClient());
}
