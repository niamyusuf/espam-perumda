import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:espam/api.dart';
import 'package:flutter/material.dart';

import '../../model/model/sipa_model.dart';



class SipaController {
  var dio = Dio();

  Future<List<SipaModel>> getAll() async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.get(API.user, options: myOption);
      if (response.statusCode == 200) {
        
        Iterable json = jsonDecode(response.data.toString());
        final result = json.map((user) => SipaModel.fromJson(user)).toList();
        return result;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<SipaModel> getOne(int id) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.get(path, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return SipaModel.fromJson(json);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<SipaModel> getTimeLine(Map<String, dynamic> model) async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.post(API.timelineSIPA, data: model, options: myOption);
      if (response.statusCode == 200) {
        // var x = response.data;
        // debugPrint(x['data']);
        // debugPrint(response.data['message'].toString());
        var jsonString = jsonDecode(response.toString());
        // Map<String, dynamic> jsonString = json.decode(response.data);
        // debugPrint(jsonString);
        return SipaModel.fromJson(jsonString);
        // return x;
      } else {
        debugPrint(response.statusMessage);
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }


  Future<ListDaftarModel> getData(Map<String, dynamic> model) async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      Map<String, String> headers = {'Content-Type': 'application/json'};

      final response = await dio.post(API.sipa,  data: model, options: myOption);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.toString());
        var data = jsonResponse;
        
        print(data);
        // return data;
        return ListDaftarModel.fromJson(data);

      } else {
        debugPrint(response.statusMessage);
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<SipaModel> put(int id, Map<String, dynamic> model) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.put(path, data: model, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return SipaModel.fromJson(json);
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

