import 'package:dio/dio.dart';

const String hostname = "http://10.103.236.226:8200";

final dio = Dio();

Future<Map<String, dynamic>> getHttpMap(String uri) async {
  Response response = await dio.get(hostname + uri);
  return response.data;
}

Future<List> getHttpList(String uri) async {
  Response response = await dio.get(hostname + uri);
  return response.data;
}

Future<Map<String, dynamic>> postHttp(String uri, Map<String, dynamic> form) async{
  final formData = FormData.fromMap(form);
  final response = await dio.post(
    hostname + uri,
    data: formData,
  );
  return response.data;
}
