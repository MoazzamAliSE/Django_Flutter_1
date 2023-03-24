import 'dart:convert';

import 'package:http/http.dart' as http;

class Student {
  // String baseUrl = 'http://127.0.0.1:8000/api/student/';
  // String baseUrl = 'http://10.0.2.2:8000/api/student/';
  // String baseUrl = 'http://192.168.137.1:8000/api/student/';
  String baseUrl = 'http://192.168.137.1/api/student/';
  // String baseUrl = 'http://192.168.137.1/api/student/';
  Future<List> getAllStudents() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print(response.statusCode);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      print("${e}abc");
      return Future.error(e);
    }
  }
}
// python manage.py runserver 192.168.137.1:80