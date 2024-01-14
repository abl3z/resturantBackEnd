import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  Stream<User?> get authStateChanges => auth.authStateChanges();
  Future<void> signIn({required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({required String email, required String password}) async {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> singOut() async {
    await auth.signOut();
  }
}

class User1 {
  static Map<String, String> _userInfo = {
    'fullName': '',
    'email': '',
    'phoneNumber': '',
    'gender': 'male',
  };

  static Map<String, String> _pass = {
    'password': '',
    'confPass': '',
  };

  static String getFullName() {
    return _userInfo['fullName']!;
  }

  static void setFullName(String fullName) {
    _userInfo['fullName'] = fullName;
  }

  static String getGender() {
    return _userInfo['gender']!;
  }

  static void setGender(int gender) {
    if (gender == 1) {
      _userInfo['gender'] = "female";
    } else {
      _userInfo['gender'] = "male";
    }
  }

  static String getEmail() {
    return _userInfo['email']!;
  }

  static void setEmail(String email) {
    _userInfo['email'] = email;
  }

  static String getPhoneNumber() {
    return _userInfo['phoneNumber']!;
  }

  static void setPhoneNumber(String phoneNumber) {
    _userInfo['phoneNumber'] = phoneNumber;
  }

  static String getPassword() {
    return _pass['password']!;
  }

  static void setPassword(String password) {
    _pass['password'] = password;
  }

  static String getConfPass() {
    return _pass['confPass']!;
  }

  static void setConfPass(String confPass) {
    _pass['confPass'] = confPass;
  }

  static void clearUserInfo() {
    _userInfo['fullName'] = '';
    _userInfo['email'] = '';
    _userInfo['phoneNumber'] = '';
    _userInfo['gender'] = 'male';
  }

  static void clearpass() {
    _pass['password'] = '';
    _pass['confPass'] = '';
  }

  static void logout() {
    User1.clearUserInfo();
    User1.clearpass();
  }

  int checkGender(String gender) {
    if (gender == 'male') {
      return 0;
    }
    return 1;
  }
}
