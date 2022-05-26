import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_refresh_random_ai/model/user_data/users_data_response.dart';

final String api ="https://randomuser.me/api/?results=";
int userCount=10;

/*Future<UsersData> fetchUsersData() async {
  final request=api+userCount.toString();
  final response = await http.get(Uri.parse(request));

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    debugPrint("result-----${result}");
    var da = UsersData.fromJson(result);
    debugPrint("result model-----${da.results}");
    return da;
  }
  else {
    throw Exception('Failed to load UsersData');
  }
}*/

class Contacts extends ChangeNotifier {
  late UsersData _data ;
  UsersData get loadedData => _data;

  Future<void> fetchUsersData() async {
    final request=api+userCount.toString();
    final response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      debugPrint("result-----${result}");
      var da = UsersData.fromJson(result);
      debugPrint("result model-----${da.results}");
      _data = da;
      notifyListeners();
      //return result['results'];
    }
    else {
      throw Exception('Failed to load UsersData');
    }
  }

}
