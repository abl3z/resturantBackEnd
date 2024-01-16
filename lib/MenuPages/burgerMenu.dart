import 'package:flutter/material.dart';
import '../mainPages/profile.dart';
import 'package:resBackEnd/menuEditPages/burgerEditPage.dart';
import 'package:resBackEnd/MenuPages/menu.dart';
import 'package:resBackEnd/mainPages/address1.dart';
import '/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  runApp(burgerMenu());
}

class burgerMenu extends StatefulWidget {
  const burgerMenu({super.key});

  @override
  State<burgerMenu> createState() => _burgerMenuState();
}

class _burgerMenuState extends State<burgerMenu> {
  List<proDetails>? pro;
  @override
  initState() {
    super.initState();
    fetchProDetails();
  }

  Future<void> fetchProDetails() async {
    try {
      List<proDetails>? ps = await FirebaseService().getProDetails();
      if (ps != null) {
        setState(() {
          pro = ps;
        });
      } else {
        print("Product data not found");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(),
                    ),
                  );
                },
              ),
              backgroundColor: Color.fromRGBO(23, 70, 162, 1),
              title: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PP(),
                    ),
                  );
                },
                child: Icon(
                  Icons.person,
                  color: Color.fromRGBO(255, 247, 233, 1),
                  size: 40,
                ),
              ),
              actions: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
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
                        color: Color.fromRGBO(255, 247, 233, 1),
                        size: 40,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ],
            ),
            body: ListView.builder(
                itemCount: (pro!.length / 2).toInt(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Column(
                    children: [
                      Image.network(
                        pro![index + 2].photoUrl,
                        height: 150,
                        width: 900,
                      ),
                    ],
                  ));
                })),
      ),
    );
  }
}

/*Expanded buildKey(
    int burgerNum, String txt, BuildContext context, double burgerPrice) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditBurger(
              BurgerID: burgerNum,
              totalofAll: burgerPrice,
            ),
          ),
        );
      },
      child: Image(
        image: AssetImage(txt),
      ),
    ),
  );
}
*/