import 'package:flutter/material.dart';
import 'package:resturantapp/mainPages/profile.dart';
import 'package:resturantapp/mainPages/address1.dart';

void main() {
  runApp(appMenu());
}

class appMenu extends StatefulWidget {
  const appMenu({super.key});

  @override
  State<appMenu> createState() => _appMenuState();
}

class _appMenuState extends State<appMenu> {
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
              DrinkButton(
                drinkNum: 1,
                txt: 'assets/appPictures/ff.jpg',
                // price: 1.5,
              ),
              DrinkButton(drinkNum: 2, txt: 'assets/appPictures/ccf.jpg'),
              DrinkButton(drinkNum: 3, txt: 'assets/appPictures/or.jpg'),
              DrinkButton(drinkNum: 4, txt: 'assets/appPictures/cb.jpg'),
              DrinkButton(drinkNum: 5, txt: 'assets/appPictures/ccs.jpg'),
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
  const DrinkButton({
    Key? key,
    required this.drinkNum,
    required this.txt,
  }) : super(key: key);

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
                          Text(
                            '$_counter2',
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total : ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )*/
                    ],
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              // Reset counter to 1 on cancel
                              _counter2 = 1;
                              // widget.price = 0.0;
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
                            // Add drink to order with quantity _counter
                            // ... Add your logic here ...
                            setState(() {
                              // Reset counter to 1 after adding to cart
                              _counter2 = 1;
                              // widget.price = 0.0;
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
