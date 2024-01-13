import 'package:flutter/material.dart';
import 'package:resturantapp/editPages/cart_edit.dart';

void main() {
  runApp(Address());
}

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shahem Restaurant",
      home: SafeArea(
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Address Info",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 247, 233, 1),
                      fontFamily: 'Pacifico',
                      fontSize: 30),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/icons/cutlery2.png",
                  width: 44,
                  height: 44,
                ),
              ],
            ),
            backgroundColor: Color.fromRGBO(23, 70, 162, 1),
          ),
          body: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _key = GlobalKey<FormState>();
  String email = "";
  String city_name = "";
  String building_num = "";
  String apt_num = "";
  String floor = "";
  String srt_name = "";
  int phone_num = 0;
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                ),
                icon: Icon(
                  Icons.location_on,
                  color: Colors.amber,
                  size: 40,
                ),
                hintText: 'Amman',
                labelText: 'Enter Your City',
                labelStyle: TextStyle(color: Colors.black),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your City name";
                }
                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                  return 'Only Alphabetical Characters Allowed';
                }

                city_name = value;
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                ),
                icon: Icon(
                  Icons.apartment,
                  color: Colors.amber,
                  size: 40,
                ),
                hintText: "Building Number",
                labelText: 'Enter Your Building Number',
                labelStyle: TextStyle(color: Colors.black),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Bulding Number';
                } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'Only Numbers';
                }
                building_num = value;
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Apartment Number';
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Only Numbers';
                      }
                      apt_num = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.home_filled,
                        color: Colors.amber,
                        size: 40,
                      ),
                      label: Text("Apt Number"),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Floor Number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Only Numbers';
                      }
                      floor = value;
                    },
                    decoration: InputDecoration(
                      labelText: "Floor Number",
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
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                ),
                icon: Icon(
                  Icons.streetview,
                  color: Colors.amber,
                  size: 40,
                ),
                hintText: "Street Name",
                labelText: 'Enter Your Street Name',
                labelStyle: TextStyle(color: Colors.black),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Street Name";
                }
                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                  return 'Only Alphabetical Characters Allowed';
                }

                srt_name = value;
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                ),
                icon: Icon(
                  Icons.phone,
                  color: Colors.amber,
                  size: 40,
                ),
                hintText: "+962",
                labelText: 'Enter Your Phone Number',
                labelStyle: TextStyle(color: Colors.black),
              ),
              validator: (value) {
                if (value!.isEmpty || value.length < 10) {
                  return "Please Enter Your Phone Number";
                }
                if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                  return 'Only Numbers';
                }

                phone_num = int.parse(value);
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ),
                  );
                }
                ;
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 17, horizontal: 27),
              ),
              child: Text(
                "Save Address",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
