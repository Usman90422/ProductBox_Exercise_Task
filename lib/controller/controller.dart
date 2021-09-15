import 'dart:convert';

import 'package:http/http.dart' as http;

class Logincontroller {

  Future<String> checkcredentials(String username, String password) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    List data = json.decode(response.body);
    int index = 0;
    for (int i = 0; i < data.length; i++) {
      if (username == data[i]["username"] && password == data[i]["email"]) {
        index = 1;
      }
    }

    if (index == 1) {
      return "success";
    }
    else
      {
        return "failure";
      }

  }
}
