import 'package:flutter/material.dart';
import '/editPages/edit_profile.dart';
import '/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  runApp(
    profilePage(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PP(),
    );
  }
}

class PP extends StatefulWidget {
  const PP({super.key});

  @override
  State<PP> createState() => _ppState();
}

class _ppState extends State<PP> {
  // String updateFullName() {
  //   setState(() {
  //     return User.setFullName(User.getFullName());
  //   });
  //   return '';
  // }
  User1 userInfo = User1();

  UserDetails? user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 247, 233, 1),
        appBar: AppBar(
          toolbarHeight: 65,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(255, 247, 233, 1),
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
              ;
            },
          ),
          backgroundColor: Color.fromRGBO(23, 70, 162, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                size: 38,
                color: Colors.amber,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Profile Account",
                style: TextStyle(
                    color: Color.fromRGBO(255, 247, 233, 1),
                    fontFamily: 'Pacifico',
                    fontSize: 30),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(User1.getPhoto()),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 27,
                ),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 25,
                ),
                SizedBox(
                  height: 47,
                  width: 360, // Set the desired height
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return pp(User1.getFullName());
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 27,
                ),
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 25,
                ),
                SizedBox(
                  height: 47,
                  width: 360, // Set the desired height
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: pp(User1.getGender()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 27,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 25,
                ),
                SizedBox(
                  height: 47,
                  width: 360, // Set the desired height
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: pp(User1.getEmail()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 27,
                ),
                Text(
                  "Phone Number",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 25,
                ),
                SizedBox(
                  height: 47,
                  width: 360, // Set the desired height
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: pp(User1.getPhoneNumber()),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 55,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => editProfile(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget pp(String labelText) {
  return Container(
    margin: EdgeInsets.only(top: 10), // Add some spacing above the border
    padding: EdgeInsets.symmetric(
        horizontal: 10), // Add padding inside the container
    /*decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 2, color: Colors.black),
      ),
    ),*/
    child: Text(
      labelText,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.start,
    ),
  );
}

// Widget exit() {
//   return ;
// }