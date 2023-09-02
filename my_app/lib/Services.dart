import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user.dart';
import 'models/users.dart';

class Services {
  static const String url = "http://154.16.55.156:8080/users";

  static Future<Users> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseUsers(response.body);
      } else {
        return Users();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Users();
    }
  }

  static Users parseUsers(String reponseBody) {
    final paresd = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<User> users = paresd.map<User>((json) => User.fromJson(json)).toList();
    Users u = Users();
    u.users = users;

    return u;
  }
}
