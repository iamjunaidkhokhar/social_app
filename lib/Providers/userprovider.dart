import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;

  User _user;
  Status _status = Status.Uninitialized;
  Status get status => _status;

  User get user => _user;
  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    // ignore: deprecated_member_use
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  String get userId {
    return _user.uid;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password, String phone,
      String address) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final url = 'https://pakistankissan-69979.firebaseio.com/userinfo.json';
      try {
        await http.post(url,
            body: jsonEncode({
              'email': email,
              'name': name,
              'password': password,
              'phonenumber': phone,
              'address': address,
            }));
      } catch (e) {
        print('Error');
      }
      notifyListeners();
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  // ignore: deprecated_member_use
  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
