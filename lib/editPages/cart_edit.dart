import 'package:flutter/material.dart';
import '../../mainPages/Visa.dart';

void main() {
  runApp(MaterialApp(home: Cart()));
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String selectedPaymentMethod = 'Cash';
  String method = 'cash';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 247, 233, 1),
        resizeToAvoidBottomInset: false,
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
              Icon(
                Icons.shopping_cart,
                color: Colors.amber,
                size: 38,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          //dk
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    height: 130,
                    child: Image.asset(
                      "assets/cart_images/abl3z_burger.jpg",
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          "Edit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Color.fromRGBO(23, 70, 162, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Add your onTap functionality here
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    height: 130,
                    child: Image.asset(
                      "assets/cart_images/Pizza1.jpg",
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          "Edit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Color.fromRGBO(23, 70, 162, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Add your onTap functionality here
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    height: 130,
                    child: Image.asset(
                      "assets/cart_images/Shawerma_1.jpg",
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          "Edit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Color.fromRGBO(23, 70, 162, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Add your onTap functionality here
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    height: 130,
                    child: Image.asset(
                      "assets/cart_images/Cola1.jpg",
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          "Edit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Color.fromRGBO(23, 70, 162, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Add your onTap functionality here
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 330,
                    height: 130,
                    child: Image.asset(
                      "assets/cart_images/cheese_balls.jpg",
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Text(
                          "Edit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Color.fromRGBO(23, 70, 162, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Add your onTap functionality here
                    },
                  ),
                ],
              ),
              Container(
                child: Text(''),
                color: Color.fromRGBO(23, 70, 162, 1),
                width: double.infinity,
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Pay with:',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 'cash',
                              groupValue: method,
                              onChanged: (value) {
                                setState(() {
                                  method = value.toString();
                                });
                              },
                              activeColor: Color.fromRGBO(23, 70, 162, 1),
                            ),
                            Image.asset(
                              "assets/cart_images/cash.jpg",
                              width: 40,
                              height: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Cash", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'visa',
                              groupValue: method,
                              onChanged: (value) {
                                setState(() {
                                  method = value.toString();
                                });
                              },
                              activeColor: Color.fromRGBO(23, 70, 162, 1),
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Image.asset(
                              "assets/cart_images/visa.jpg",
                              width: 40,
                              height: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Visa", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (method == "visa") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Visa()));
                        }
                      },
                      child: Text("Order",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(23, 70, 162, 1),
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 67,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
