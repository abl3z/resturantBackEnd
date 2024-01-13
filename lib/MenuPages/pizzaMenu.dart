import 'package:flutter/material.dart';
import '../mainPages/profile.dart';
import '../../menuEditPages/pizzaEditPage.dart';
import 'menu.dart';
import 'package:resturantapp/mainPages/address1.dart';

void main() {
  runApp(pizzaMenu());
}

class pizzaMenu extends StatefulWidget {
  const pizzaMenu({super.key});

  @override
  State<pizzaMenu> createState() => _pizzaMenuState();
}

class _pizzaMenuState extends State<pizzaMenu> {
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, 'assets/pizzaPictures/chiPizza.jpg', context, 7),
              buildKey(2, 'assets/pizzaPictures/hawPizza.jpg', context, 7),
              buildKey(3, 'assets/pizzaPictures/marPizza.jpg', context, 6),
              buildKey(4, 'assets/pizzaPictures/metaPizza.jpg', context, 7),
              buildKey(5, 'assets/pizzaPictures/pepPizza.jpg', context, 6),
            ],
          ),
        ),
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
