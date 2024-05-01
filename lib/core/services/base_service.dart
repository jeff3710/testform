import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

enum HttpMethod { get, post, put, delete }

abstract class BaseService {
  BaseOptions get _options {
    return BaseOptions(baseUrl: 'http://127.0.0.1:8888/api/', headers: {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
  }

  String _cleanPath(String path) {
    if (!path.endsWith('/')) {
      return path;
    }
    return path;
  }

  Future<Either<String, Map<String, dynamic>>> _handle({
    required HttpMethod method,
    required String path,
    Map<String, dynamic> data = const {},
  }) async {
    try {
      late Response<dynamic> response;
      switch (method) {
        case HttpMethod.get:
          response =
              await Dio(_options).get(_cleanPath(path), queryParameters: data);
        case HttpMethod.post:
          response = await Dio(_options).post(_cleanPath(path), data: data);
        case HttpMethod.put:
          response = await Dio(_options).put(_cleanPath(path), data: data);
        case HttpMethod.delete:
          response = await Dio(_options).delete(_cleanPath(path));
      }
      return right({'data': response.data});
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic> data = const {},
  }) {
    return _handle(method: HttpMethod.get, path: path, data: data);
  }

  Future<Either<String, Map<String, dynamic>>> post(
    String path, {
    Map<String, dynamic> data = const {},
  }) {
    return _handle(method: HttpMethod.post, path: path, data: data);
  }

  Future<Either<String, Map<String, dynamic>>> put(
    String path, {
    Map<String, dynamic> data = const {},
  }) {
    return _handle(method: HttpMethod.put, path: path, data: data);
  }
}
