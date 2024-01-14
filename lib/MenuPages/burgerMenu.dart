import 'package:flutter/material.dart';
import '../mainPages/profile.dart';
import 'package:resBackEnd/menuEditPages/burgerEditPage.dart';
import 'package:resBackEnd/MenuPages/menu.dart';
import 'package:resBackEnd/mainPages/address1.dart';

void main() {
  runApp(burgerMenu());
}

class burgerMenu extends StatefulWidget {
  const burgerMenu({super.key});

  @override
  State<burgerMenu> createState() => _burgerMenuState();
}

class _burgerMenuState extends State<burgerMenu> {
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
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, 'assets/burgerPictures/saraBug.jpg', context, 3),
              buildKey(2, 'assets/burgerPictures/ablezzBug.jpg', context, 5),
              buildKey(
                  3, 'assets/burgerPictures/monesterBug.jpg', context, 6.15),
              buildKey(4, 'assets/burgerPictures/cheeseBug.jpg', context, 3),
              buildKey(5, 'assets/burgerPictures/crunchyBug.jpg', context, 5.5),
            ],
          ),
        ),
      ),
    );
  }
}

Expanded buildKey(
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
