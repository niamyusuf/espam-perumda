import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:espam/api.dart';
import 'package:espam/model/model_timeline/timeline_model.dart';
import 'package:flutter/material.dart';


class TimelineController {
  var dio = Dio();

  Future<List<TimelineModel>> getAll() async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.get(API.user, options: myOption);
      if (response.statusCode == 200) {
        
        Iterable json = jsonDecode(response.data.toString());
        final result = json.map((user) => TimelineModel.fromJson(user)).toList();
        return result;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<TimelineModel> getOne(int id) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.get(path, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return TimelineModel.fromJson(json);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<TimelineModel> getTimeLine(Map<String, dynamic> model) async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.post(API.timeline, data: model, options: myOption);
      if (response.statusCode == 200) {
        // var x = response.data;
        // debugPrint(x['data']);
        // debugPrint(response.data['message'].toString());
        var jsonString = jsonDecode(response.toString());
        // Map<String, dynamic> jsonString = json.decode(response.data);
        // debugPrint(jsonString);
        return TimelineModel.fromJson(jsonString);
        // return x;
      } else {
        debugPrint(response.statusMessage);
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }


  Future<ListDaftarModel> getPendaftaran(Map<String, dynamic> model) async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      Map<String, String> headers = {'Content-Type': 'application/json'};

      final response = await dio.post(API.datadaftar,  data: model, options: myOption);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.toString());
        var data = jsonResponse;
        
        print(data);
        // return data;
        return ListDaftarModel.fromJson(data);

        // return data.map((e) => ListDaftarModel.fromJson(e)).toList();
        // var x = response.data;
        // debugPrint(x['data']);
        // debugPrint(response.data.toString());
        
        // var jsonString = jsonDecode(response.data.toString()); //oke

        // Map<String, dynamic> jsonString = json.decode(response.data);
        // debugPrint(jsonString);
        // return ListDaftarModel.fromJson(jsonString);

        // final json = jsonDecode(response.data.toString());
        // final result = json.map((user) => ListDaftarModel.fromJson(user)).toList();
        // print(result);
        // return result;
        // return x;
      } else {
        debugPrint(response.statusMessage);
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<TimelineModel> put(int id, Map<String, dynamic> model) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.put(path, data: model, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return TimelineModel.fromJson(json);
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

