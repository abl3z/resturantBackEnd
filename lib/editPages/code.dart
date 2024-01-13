import 'package:flutter/material.dart';
import 'package:resturantapp/editPages/reset.dart';

void main() {
  runApp(codePage());
}

class codePage extends StatelessWidget {
  const codePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shahem Resturant",
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 247, 233, 1),
          appBar: AppBar(
            toolbarHeight: 65,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.password,
                  color: Colors.amber,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Reset Password",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 247, 233, 1),
                      fontFamily: 'Pacifico',
                      fontSize: 30),
                ),
                SizedBox(
                  width: 25,
                )
              ],
            ),
            backgroundColor: Color.fromRGBO(23, 70, 162, 1),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _key = GlobalKey<FormState>();
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 240,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter The Code';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Only Numbers';
                          }
                        },
                        controller: code,
                        decoration: InputDecoration(
                          label: Text(
                            "Enter The Code",
                            style: TextStyle(fontSize: 18),
                          ),

                          icon: Icon(
                            Icons.pin,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(23, 70, 162, 1),
                                width: 1),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16), // Adjust contentPadding
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => resetPage(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
