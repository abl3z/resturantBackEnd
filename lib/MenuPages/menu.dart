import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'burgerMenu.dart';
import 'pizzaMenu.dart';
import 'shawarmaMenu.dart';
import 'drinksMenu.dart';
import 'appMenu.dart';
import '../mainPages/profile.dart';
import '../mainPages/login.dart';
import '../mainPages/address1.dart';
import '/shahem.dart';
import '/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

User1 userInfo = User1();

Future<void> main() async {
  runApp(
    MaterialApp(
      home: Menu(),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class Menu extends StatefulWidget {
  final String? fullName;
  final String? email;
  const Menu({super.key, this.fullName, this.email});
  @override
  State<Menu> createState() => MenuState();
}

class MenuState extends State<Menu> {
  List<proDetails>? pro;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 247, 233, 1),
        drawer: mydrwr(),
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: Color.fromRGBO(23, 70, 162, 1),
          iconTheme:
              IconThemeData(color: Color.fromRGBO(255, 247, 233, 1), size: 40),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Address(),
                  ),
                );
              },
              child: Icon(
                Icons.shopping_cart,
                size: 40,
                color: Color.fromRGBO(255, 247, 233, 1),
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(1, "assets/menuPictures/burgers.jpg", context),
            buildKey(2, "assets/menuPictures/pizzas.jpg", context),
            /* buildKey(3, "assets/menuPictures/shawarmas.jpg", context),
            buildKey(4, "assets/menuPictures/drinks.jpg", context),
            buildKey(5, "assets/menuPictures/appe.jpg", context),*/
          ],
        ),
      ),
    );
  }
}

Expanded buildKey(int pagenum, String txt, BuildContext context) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        if (pagenum == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => burgerMenu(),
            ),
          );
        } else if (pagenum == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pizzaMenu(),
            ),
          );
        } else if (pagenum == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => shawarmaMenu(),
            ),
          );
        } else if (pagenum == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => drinksMenu(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => appMenu(),
            ),
          );
        }

        // playSound(soundNUmber);
      },
      child: Image(
        image: AssetImage(txt),
      ),
    ),
  );
}

class mydrwr extends StatefulWidget {
  const mydrwr({super.key});

  @override
  State<mydrwr> createState() => mydrwrState();
}

class mydrwrState extends State<mydrwr> {
  UserDetails? user;

  Future<void> fetchUserData() async {
    String userid = Auth().auth.currentUser!.uid;
    UserDetails? usr = await FirebaseService().getUserDetails(userid);
    if (usr != null) {
      setState(() {
        user = usr;
      });
    } else {
      print("user not available");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(255, 247, 233, 1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              User1.getFullName(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              User1.getEmail(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.amber,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(User1.getPhoto()),
                )),
            decoration: BoxDecoration(
              color: Color.fromRGBO(23, 70, 162, 1),
            ),
          ),
          menulist()
        ],
      ),
    );
  }
}

class menulist extends StatefulWidget {
  const menulist({super.key});

  @override
  State<menulist> createState() => _menulistState();
}

class _menulistState extends State<menulist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(
            'assets/icons/profile.png',
            width: 40.0,
            height: 40.0,
          ),
          title: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PP()),
            );
          },
        ),
        Divider(
          color: Color.fromRGBO(23, 70, 162, 1),
          height: 4,
          thickness: 3,
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/hamburger.jpg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text(
            "Burgers",
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => burgerMenu()),
            );
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/pizza.jpg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text("Pizza"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pizzaMenu()),
            );
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/shawarma.jpg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text("Shawarmas"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => shawarmaMenu()),
            );
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/can.png',
            width: 40.0,
            height: 40.0,
          ),
          title: Text("Drinks"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => drinksMenu()),
            );
          },
        ),
        ListTile(
          leading: Image.asset(
            'assets/icons/potato.png',
            width: 40.0,
            height: 40.0,
          ),
          title: Text("Appetizers"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => appMenu()),
            );
          },
        ),
        Divider(
          color: Color.fromRGBO(23, 70, 162, 1),
          height: 4,
          thickness: 1.5,
        ),
        ListTile(
          leading: Image.asset(
            'shahemPic/shahemLogo.jpg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text(
            "About Shahem Resturant",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => about(),
              ),
            );
          },
        ),
        Divider(
          color: Color.fromRGBO(23, 70, 162, 1),
          height: 4,
          thickness: 1.5,
        ),
        SizedBox(height: 150),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.red[600],
          ),
          title: Text(
            "Log out",
            style:
                TextStyle(color: Colors.red[600], fontWeight: FontWeight.bold),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Confirm Logout'),
                content: Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      User1.logout();
                      setState(() {
                        Auth().auth.signOut();
                      });

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
