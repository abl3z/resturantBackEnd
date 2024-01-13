import 'package:flutter/material.dart';
import 'package:resturantapp/editPages/edit_profile.dart';
import 'package:resturantapp/information.dart';

User userInfo = User();

void main() {
  runApp(
    profilePage(),
  );
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
                        return pp(User.getFullName());
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
                    child: pp(User.getGender()),
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
                    child: pp(User.getEmail()),
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
                    child: pp(User.getPhoneNumber()),
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
                      print(User.getGender());
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
