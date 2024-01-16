import 'dart:js_interop';
import 'dart:js_util';

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

class UserDetails {
  String name;
  String email;
  String phone_Num;
  String photo;

  UserDetails(
      {required this.email,
      required this.name,
      required this.phone_Num,
      required this.photo});
  Map<dynamic, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone_Num": phone_Num,
      "photo": photo
    };
  }

  factory UserDetails.fromMap(Map<dynamic, dynamic> map) {
    User1.setEmail(map["email"]);
    User1.setFullName(map["name"]);
    User1.setPhoneNumber(map["phone_Num"]);
    User1.setPhoto(map["photo"]);
    return UserDetails(
        email: map["email"],
        name: map["name"],
        phone_Num: map["phone_Num"],
        photo: map["photo"]);
  }
}

class proDetails {
  String photoName;

  String photoUrl;

  proDetails({required this.photoName, required this.photoUrl});
  Map<dynamic, dynamic> toMap() {
    return {"photoName": photoName, "photoUrl": photoUrl};
  }

  factory proDetails.fromMap(Map<dynamic, dynamic> map) {
    photoDetails.setname(map["photoName"]);
    photoDetails.setphotoUrl(map["photoUrl"]);

    return proDetails(photoName: map["photoName"], photoUrl: map["photoUrl"]);
  }
}

class FirebaseService {
  Future<UserDetails?> getUserDetails(String useruid) async {
    try {
      DatabaseReference refh = FirebaseDatabase.instance.ref().child("users");
      DatabaseEvent event = await refh.child(useruid).once();
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> snapdata = event.snapshot.value as dynamic;
        return UserDetails.fromMap(snapdata as Map<dynamic, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<proDetails>> getProDetails() async {
    DatabaseReference proRef =
        FirebaseDatabase.instance.ref().child("Category/Products");
    try {
      DatabaseEvent event = await proRef.once();
      if (event.snapshot.value != null) {
        print(event.snapshot.value.toString());
        List<proDetails> prolst = [];
        Map<dynamic, dynamic> snapshotData = event.snapshot.value as dynamic;
        snapshotData.forEach((key, value) {
          prolst.add(proDetails.fromMap(value as Map<dynamic, dynamic>));
        });
        print("product List: ${prolst.isEmpty}");
        return prolst;
      } else {
        return [];
      }
    } catch (e) {
      print('Erorr getting product details: $e');
      return [];
    }
  }
}

class User1 {
  static Map<String, String> userInfo = {
    'fullName': '',
    'email': '',
    'phoneNumber': '',
    'gender': 'male',
    'photoUrl': ''
  };

  static Map<String, String> _pass = {
    'password': '',
    'confPass': '',
  };

  static String getFullName() {
    return userInfo['fullName']!;
  }

  static void setFullName(String fullName) {
    userInfo['fullName'] = fullName;
  }

  static String getPhoto() {
    return userInfo['photoUrl']!;
  }

  static void setPhoto(String photoUrl) {
    userInfo['photoUrl'] = photoUrl;
  }

  static String getGender() {
    return userInfo['gender']!;
  }

  static void setGender(int gender) {
    if (gender == 1) {
      userInfo['gender'] = "female";
    } else {
      userInfo['gender'] = "male";
    }
  }

  static String getEmail() {
    return userInfo['email']!;
  }

  static void setEmail(String email) {
    userInfo['email'] = email;
  }

  static String getPhoneNumber() {
    return userInfo['phoneNumber']!;
  }

  static void setPhoneNumber(String phoneNumber) {
    userInfo['phoneNumber'] = phoneNumber;
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
    userInfo['fullName'] = '';
    userInfo['email'] = '';
    userInfo['phoneNumber'] = '';
    userInfo['gender'] = 'male';
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

class photoDetails {
  static Map<dynamic, dynamic> userInfo = {'name': '', 'photoUrl': ''};
  String getname() {
    return userInfo['name']!;
  }

  static void setname(String name) {
    userInfo['name'] = name;
  }

  String getphotoUrl() {
    return userInfo['photoUrl']!;
  }

  static void setphotoUrl(String photoUrl) {
    userInfo['photoUrl'] = photoUrl;
  }
}

class photo {
  List<String> Urls = [
    'assets/pizzaPictures/chiPizza.jpg',
    'assets/pizzaPictures/hawPizza.jpg',
    'assets/burgerPictures/saraBug.jpg',
    'assets/burgerPictures/ablezzBug.jpg'
  ];

  List<String> names = ['chiPizza', 'hawPizza', 'saraBug', 'ablezzBug'];
}
