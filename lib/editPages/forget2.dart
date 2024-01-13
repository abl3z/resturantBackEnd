import 'package:flutter/material.dart';
import 'package:resturantapp/editPages/code2.dart';

void main() {
  runApp(forgetPage2());
}

class forgetPage2 extends StatelessWidget {
  const forgetPage2({Key? key}) : super(key: key);

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
                ),
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
  TextEditingController email3 = TextEditingController();
  bool isObscureOldPassword = true;
  bool isObscureNewPassword = true;
  bool isObscureConfirmPassword = true;

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
                          if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                              .hasMatch(value!)) {
                            return 'Please Enter a Valid Email Address';
                          }
                        },
                        controller: email3,
                        decoration: InputDecoration(
                          labelText: ("Enter Your Email"),
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(23, 70, 162, 1),
                              fontSize: 17),
                          hintText: "example@gmail.com",
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.amber,
                            size: 40,
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
                              builder: (context) => codePage2(),
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
