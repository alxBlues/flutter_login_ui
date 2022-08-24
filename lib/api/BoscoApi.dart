import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_login_ui/services/local_storage.dart';

class BoscoApi {
  static Dio _dio = new Dio();
  static Dio _dioFree = new Dio();

  var thunderHeaders = {
    'content-type': 'application/json',
    'x-requested-with': 'XMLHttpRequest',
  };

  var thunderImageHeaders = {
    'content-type': 'multipart/form-data',
    'x-requested-with': 'XMLHttpRequest',
  };
  static void configureDio() {
    //Base del Url

    _dio.options.baseUrl = 'https://victimasacacias.com/api';

    // Configuracion de Headers
    // _dio.options.headers = {
    //  'Bearer': LocalStorage.prefs.getString('token') ?? ''
    //};
    var token = LocalStorage.prefs.getString('token');
    _dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    _dio.options.responseType = ResponseType.json;
    // _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } on DioError catch (e) {
      throw ('Error en el Get');
    }
  }

  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el Post');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = data;
    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } catch (e) {
      throw ('Error en el PUT $e');
    }
  }

  static Future httpDelete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el Delete');
    }
  }

  static Future httpPutImage(String path, PlatformFile file) async {
    final formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(file.bytes!, filename: 'myImage.png'),
      '_method': 'put'
    });
    try {
      final resp = await _dio.post(path, data: formData);
      print(resp);
      return resp.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.statusCode);
      } else {
        print(e.message);
      }
    }
  }
}
