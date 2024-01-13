class User {
  static Map<String, String> _userInfo = {
    'fullName': '',
    'gender': 'male',
    'email': '',
    'phoneNumber': '',
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

  static void setUserAcc(String email) {
    if (email == "saleh@gmail.com") {
      _userInfo['fullName'] = "Saleh Abualezz";
      _userInfo['gender'] = "male";
      _userInfo['email'] = "saleh@gmail.com";
      _userInfo['phoneNumber'] = "0786660448";
      _pass['password'] = "saleh123";
      _pass['password'] = "saleh123";
    }
    if (email == "ma_jawarneh@asu.edu.jo") {
      _userInfo['fullName'] = "Mahmoud Aljawarneh";
      _userInfo['gender'] = "male";
      _userInfo['email'] = "ma_jawarneh@asu.edu.jo";
      _userInfo['phoneNumber'] = "0781417262";
      _pass['password'] = "mahmoud079";
      _pass['password'] = "mahmoud079";
    }
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
    User.clearUserInfo();
    User.clearpass();
  }

  int checkGender(String gender) {
    if (gender == 'male') {
      return 0;
    }
    return 1;
  }

  bool checkPass(String pass) {
    if (_userInfo['email'] == "saleh@gmail.com" && pass == 'saleh123') {
      return true;
    } else if (_userInfo['email'] == "ma_jawarneh@asu.edu.jo" &&
        pass == 'mahmoud079') {
      return true;
    }
    return false;
  }

  bool checkAcc(String acc) {
    if (acc == "saleh@gmail.com") {
      return true;
    } else if (acc == "ma_jawarneh@asu.edu.jo") {
      return true;
    }
    return false;
  }
}
