import 'dart:convert';

import 'package:eastern_interview/datamodel/bottom_datamodel.dart';
import 'package:eastern_interview/datamodel/category_datamodel.dart';
import 'package:eastern_interview/datamodel/middle_datamodel.dart';
import 'package:eastern_interview/datamodel/top_datamodel.dart';
import 'package:eastern_interview/utils/apis.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://api.bengkelrobot.net:8001";

  Future getCategores() async {
    final response = await http.get(Uri.parse(APIS.category));
    if (response.statusCode == 200) {

   //   return jsonDecode(response.body).map((item) => CategoryDataModel.fromJson(item));
      return CategoryDataModel.fromJson(jsonDecode(response.body));
    } else {
      return "";
    }
  }




  Future getTopMenu() async {
    final response = await http.get(Uri.parse(APIS.top));
    if (response.statusCode == 200) {
      return TopDataModel.fromJson(jsonDecode(response.body));
    } else {
      return "";
    }
  }



  Future getMiddleMenu() async {
    final response = await http.get(Uri.parse(APIS.middle));

    if (response.statusCode == 200) {
      return MiddleDataModel.fromJson(jsonDecode(response.body));
    } else {
      return "";
    }
  }



  Future getBottomMenu() async {
    final response = await http.get(Uri.parse(APIS.bottom));

    if (response.statusCode == 200) {
      return BottomDataModel.fromJson(jsonDecode(response.body));
    } else {
      return "";
    }
  }

}