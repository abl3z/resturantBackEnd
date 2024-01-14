import 'package:flutter/material.dart';
import 'package:resBackEnd/MenuPages/menu.dart';
import '../mainPages/profile.dart';
import '../menuEditPages/shawarmaEditPage.dart';
import 'package:resBackEnd/mainPages/address1.dart';

void main() {
  runApp(shawarmaMenu());
}

class shawarmaMenu extends StatefulWidget {
  const shawarmaMenu({super.key});

  @override
  State<shawarmaMenu> createState() => _shawarmaMenuState();
}

class _shawarmaMenuState extends State<shawarmaMenu> {
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
                  MaterialPageRoute(builder: (context) => Menu()),
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
              buildKey(1, 'assets/shawarmaPictures/chis.jpg', context, 1.15),
              buildKey(2, 'assets/shawarmaPictures/befs.jpg', context, 1.3),
              buildKey(3, 'assets/shawarmaPictures/dcs.jpg', context, 3.25),
              buildKey(4, 'assets/shawarmaPictures/dbs.jpg', context, 3.4),
              buildKey(5, 'assets/shawarmaPictures/fs.jpg', context, 2.35),
            ],
          ),
        ),
      ),
    );
  }
}

Expanded buildKey(
    int shawarmaNum, String txt, BuildContext context, double shawarmaPrice) {
  return Expanded(
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => shawarmaEdit(
              shawarmaID: shawarmaNum,
              totalofAll: shawarmaPrice,
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
