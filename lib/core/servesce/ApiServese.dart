import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dataBaseServece.dart';

class ApiServese extends DataBaseServese {
  final Dio _dio;
  ApiServese(this._dio);

  final String _baseUrl = 'https://maps.googleapis.com/maps/api/';
  final String _key = 'AIzaSyC86lWEI5fMklifz509ZmHUyGpj1AuplUA';
  Future<dynamic> getData(
      {required String endPoint, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer$token',
      });
    }
    var response = await _dio.get('$_baseUrl$endPoint&key=$_key ',
        options: Options(headers: headers));

    return response.data;
  }

  @override
  Future<dynamic> addData(
      {required String endPoint,required Map<String, dynamic> body}) async {
    var response = await _dio.post(endPoint,
        data: jsonEncode(body),
        options: Options(headers: {
          'X-Goog-Api-Key': _key,
          'Content-Type': 'application/json',
          'X-Goog-FieldMask':
              'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline'
        }));

    return response.data;
  }

  Future<dynamic> put(
      {required String endPoint,
      @required String? token,
      Map<String, dynamic>? body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    var response = await _dio.put('$_baseUrl$endPoint',
        data: body, options: Options(headers: headers));

    return response.data;
  }

  Future<dynamic> patch(
      {required String endPoint,
      @required String? token,
      Map<String, dynamic>? body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    var response = await _dio.patch('$_baseUrl$endPoint',
        data: body, options: Options(headers: headers));

    return response.data;
  }

  Future<dynamic> delete(
      {required String endPoint,
      @required String? token,
      Map<String, dynamic>? body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    var response = await _dio.delete('$_baseUrl$endPoint',
        data: body, options: Options(headers: headers));

    return response.data;
  }
}

// class ApiServese {
//   final Dio _dio;
//   ApiServese(this._dio);
//
//   final String _baseUrl = 'https://fakestoreapi.com/';
//
//   Future<dynamic> get(
//       {required String endPoint, @required String? token}) async {
//     Map<String, String> headers = {};
//     if (token != null) {
//       headers.addAll({
//         'Authroization': 'Bearer $token',
//       });
//     }
//     var response = await _dio.get('$_baseUrl$endPoint',
//       options: Options(headers: headers),);
//
//     return response.data;
//   }
// }
