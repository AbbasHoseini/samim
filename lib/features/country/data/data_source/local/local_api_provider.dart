import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class LocalApiProvider {

  Future login() async {
    final String jsonData = await rootBundle.loadString('assets/users.json');
    final List<dynamic> jsonList = json.decode(jsonData);
    final List<Map<String, dynamic>> users =
        jsonList.cast<Map<String, dynamic>>();
    return users;
  }
  
}
