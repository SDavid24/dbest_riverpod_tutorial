import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_dbestech/models/user_models.dart';

class ApiServices{
  String endpoint = 'https://randomuser.me/api/?results=10';
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode == 200){
      final List result = jsonDecode(response.body)['results'];

      //return result of the json list fetched from api
      return result.map(((e) => UserModel.fromJson(e))).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}

//The provider serves an entrypoint to shared data across the app....
//The user provider method is in a 'shared state'
final userProvider = Provider<ApiServices>((ref) => ApiServices());



