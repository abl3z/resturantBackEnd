import 'package:flutter/material.dart';
import '../mainPages/profile.dart';
import 'package:resturantapp/mainPages/address1.dart';

void main() {
  runApp(drinksMenu());
}

class drinksMenu extends StatefulWidget {
  const drinksMenu({super.key});

  @override
  State<drinksMenu> createState() => _drinksMenuState();
}

class _drinksMenuState extends State<drinksMenu> {
  int _counter1 = 1;

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
                Navigator.pop(context);
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
              DrinkButton(drinkNum: 1, txt: 'assets/drinkPictures/cola.jpg'),
              DrinkButton(drinkNum: 2, txt: 'assets/drinkPictures/up.jpg'),
              DrinkButton(drinkNum: 3, txt: 'assets/drinkPictures/morange.jpg'),
              DrinkButton(drinkNum: 4, txt: 'assets/drinkPictures/orange.jpg'),
              DrinkButton(drinkNum: 5, txt: 'assets/drinkPictures/water.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}

class DrinkButton extends StatefulWidget {
  final int drinkNum;
  final String txt;

  const DrinkButton({Key? key, required this.drinkNum, required this.txt})
      : super(key: key);

  @override
  _DrinkButtonState createState() => _DrinkButtonState();
}

class _DrinkButtonState extends State<DrinkButton> {
  int _counter2 = 1;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (context, setState) {
                return AlertDialog(
                  title: Text('Select Quantity'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage(widget.txt),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (_counter2 > 1) {
                                setState(() {
                                  _counter2--;
                                });
                              }
                            },
                            child: Icon(Icons.remove),
                          ),
                          SizedBox(width: 10.0),
                          StatefulBuilder(
                            builder: (context, setState) {
                              return Text('$_counter2');
                            },
                          ),
                          SizedBox(width: 10.0),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _counter2++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _counter2 = 1;
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            'cancel',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _counter2 = 1;
                            });
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              });
            },
          );
        },
        child: Image(
          image: AssetImage(widget.txt),
        ),
      ),
    );
  }
}
