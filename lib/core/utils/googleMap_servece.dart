// import 'dart:convert';
//
// import 'package:dio/dio.dart';
//
// class GoogleMap {
//   Dio dio = Dio();
//   final baseUrl = 'https://maps.googleapis.com/maps/api/place';
//   final apiKey = 'AIzaSyC86lWEI5fMklifz509ZmHUyGpj1AuplUA';
//
//   Future<List<PlasecAutocompleteModel>> getPredictions(
//       {required String input}) async {
//     var responce =
//         await dio.get('$baseUrl/autocomplete/json?input=$input&key=$apiKey');
//
//     if (responce.statusCode == 200) {
//       var data = jsonDecode(responce.data)['predictions'];
//       List<PlasecAutocompleteModel> places = [];
//       data.map((e) {
//         places.add(PlasecAutocompleteModel.fromJson(e));
//       });
//
//       return places;
//     } else {
//       throw Exception();
//     }
//   }
// }
