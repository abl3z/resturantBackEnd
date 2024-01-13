import 'package:flutter/material.dart';

void main() {
  runApp(
    Visa(),
  );
}

class Visa extends StatelessWidget {
  const Visa({super.key});

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
                Image.asset(
                  "assets/cart_images/visa.jpg",
                  width: 40,
                  height: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Visa",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          body: Info(),
        ),
      ),
    );
  }
}

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final _key = GlobalKey<FormState>();

  String expire_date = "";
  String CVV = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Image.asset(
                  "assets/cart_images/visa2.jpg",
                  width: 40,
                  height: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length < 16) {
                          return 'Please Enter A Valid Number';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Only Numbers';
                        }
                      },
                      decoration: InputDecoration(
                        iconColor: Colors.black,
                        labelText: 'Card Number',
                        hintText: "Enter Your Card Number",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 43,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Expire Date';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Only Numbers';
                      }
                      expire_date = value;
                    },
                    decoration: InputDecoration(
                      labelText: ("Expire Date"),
                      hintText: ("MM/YY"),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your CVV';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Only Numbers';
                      }
                      CVV = value;
                    },
                    decoration: InputDecoration(
                      labelText: "CVV",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) ;
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(23, 70, 162, 1),
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 27),
              ),
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
