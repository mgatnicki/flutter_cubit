import 'package:dio/dio.dart';

Dio _dio = Dio();

Future<Response<T>> getFromApi<T>(String url) async => await _dio.get<T>(url);
