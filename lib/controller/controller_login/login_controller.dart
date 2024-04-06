import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:espam/api.dart';
import 'package:espam/model/model_login/login_model.dart';
import 'package:flutter/material.dart';


class LoginController {
  var dio = Dio();


  Future<List<LoginModel>> getAll() async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.get(API.user, options: myOption);
      if (response.statusCode == 200) {
        
        Iterable json = jsonDecode(response.data.toString());
        final result = json.map((user) => LoginModel.fromJson(user)).toList();
        return result;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<LoginModel> getOne(int id) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.get(path, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return LoginModel.fromJson(json);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<LoginModel> login(Map<String, dynamic> model) async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.post(API.login, data: model, options: myOption);
      if (response.statusCode == 200) {
        // var x = response.data;
        // debugPrint(x['data']);
        // debugPrint(response.data['message'].toString());
        var jsonString = jsonDecode(response.data.toString());
        // Map<String, dynamic> jsonString = json.decode(response.data);
        // debugPrint(jsonString);
        return LoginModel.fromJson(jsonString);
        // return x;
      } else {
        debugPrint(response.statusMessage);
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<LoginModel> put(int id, Map<String, dynamic> model) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.put(path, data: model, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return LoginModel.fromJson(json);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> delete(int id) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.delete(path, options: myOption);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.data.toString());
        return json;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
