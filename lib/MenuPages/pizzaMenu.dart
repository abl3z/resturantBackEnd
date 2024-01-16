import 'package:flutter/material.dart';
import '../mainPages/profile.dart';
import '../../menuEditPages/pizzaEditPage.dart';
import 'menu.dart';
import 'package:resBackEnd/mainPages/address1.dart';
import '/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  runApp(pizzaMenu());
}

class pizzaMenu extends StatefulWidget {
  const pizzaMenu({super.key});

  @override
  State<pizzaMenu> createState() => _pizzaMenuState();
}

class _pizzaMenuState extends State<pizzaMenu> {
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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
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
                        pro![index].photoUrl,
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

Expanded buildKey(
    int pizzaID, String txt, BuildContext context, double pizzaPrice) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditPizza(
              pizzaID: pizzaID,
              totalofAll: pizzaPrice,
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
