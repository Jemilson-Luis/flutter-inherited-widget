import 'package:flutter/widgets.dart';

class AuthModel {
  String id;
  String firstName;
  String lastName;

  AuthModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
}

class AuthProvider extends ChangeNotifier {
  AuthModel _auth = AuthModel(
    id: "12345",
    firstName: "Jemilson",
    lastName: "Luís",
  );

  AuthModel get auth => _auth;

  void updateAuth(AuthModel params) {
    _auth = params;
    notifyListeners();
  }
}
