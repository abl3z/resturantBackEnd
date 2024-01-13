import 'package:flutter/material.dart';
import 'package:resturantapp/information.dart';
import 'package:flutter/services.dart';
import 'package:resturantapp/MenuPages/menu.dart';

void main() {
  runApp(resetPage2());
}

class resetPage2 extends StatelessWidget {
  const resetPage2({Key? key}) : super(key: key);

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
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(255, 247, 233, 1),
                size: 30,
              ),
              onPressed: () {
                SystemNavigator.pop();
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
  final _ConfirmPasswordkey = GlobalKey<FormState>();
  TextEditingController pswd3 = TextEditingController();
  TextEditingController pswd4 = TextEditingController();
  bool isObscurePassword = true;
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
                        obscureText: isObscurePassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your New Password";
                          } else if (value.length < 8) {
                            return "Your Password is not strong enough";
                          }
                        },
                        controller: pswd3,
                        decoration: InputDecoration(
                          label: Text("Reset Your Password"),
                          hintText: ("Enter Your New Password"),

                          labelStyle: TextStyle(color: Colors.black),
                          icon: Icon(
                            Icons.password,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                isObscurePassword = !isObscurePassword;
                              });
                            },
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
                      TextFormField(
                        key: _ConfirmPasswordkey,
                        obscureText: isObscureConfirmPassword,
                        validator: (value) {
                          if (value != pswd3.text) {
                            return 'Passwords Do Not Match';
                          } else if (value!.isEmpty) {
                            return "Please Enter Your Password";
                          } else if (value.length < 8) {
                            return "Your Password is not strong enough";
                          } else {
                            User.setPassword(value);
                            User.setConfPass(value);
                          }
                        },
                        controller: pswd4,
                        decoration: InputDecoration(
                            iconColor: Colors.black,
                            label: Text("Confirm Your Password"),
                            hintText: "Confirm Your New Password",
                            labelStyle: TextStyle(color: Colors.black),
                            icon: Icon(Icons.password),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscureConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isObscureConfirmPassword =
                                      !isObscureConfirmPassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(23, 70, 162, 1),
                                  width: 1),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)),
                      ),
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
                            MaterialPageRoute(builder: (context) => Menu()),
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
