import 'package:flutter/material.dart';
import '/mainPages/SignUp.dart';
import '/editPages/forget.dart';
import '/MenuPages/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import '/information.dart';

Future<void> main() async {
  runApp(
    Login(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

String fullNamelogin = '';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shahem Resturant",
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 247, 233, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(23, 70, 162, 1),
            toolbarHeight: 65,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Shahem's Resturant",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 247, 233, 1),
                      fontFamily: 'Pacifico',
                      fontSize: 30),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/icons/cutlery2.png",
                  width: 44,
                  height: 44,
                )
              ],
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
  TextEditingController pswd = TextEditingController();
  TextEditingController email2 = TextEditingController();
  bool isObscureConfirmPassword = true;

  UserDetails? user;

  Future<void> fetchUserData() async {
    String userid = Auth().auth.currentUser!.uid;
    UserDetails? usr = await FirebaseService().getUserDetails(userid);
    if (usr != null) {
      setState(() {
        user = usr;
      });
    } else {
      print("user not available");
    }
  }

  Future<void> handleSignin() async {
    try {
      await Auth().signIn(email: email2.text, password: pswd.text);
      print("Logged in Successfully");
      fetchUserData();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                .hasMatch(value!)) {
                              return 'Please Enter a Valid Email Address';
                            }
                          },
                          controller: email2,
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
                        TextFormField(
                          obscureText: isObscureConfirmPassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Password";
                            }
                          },
                          controller: pswd,
                          decoration: InputDecoration(
                            label: Text("Enter Your Password"),
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(23, 70, 162, 1),
                                fontSize: 17),
                            icon: Icon(
                              Icons.password,
                              color: Colors.amber,
                              size: 40,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscureConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.amber,
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
                                  width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16), // Adjust contentPadding
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => forgetPage()));
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            handleSignin();
                            User1.setEmail(email2.text);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Menu(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "You don't have an account?",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.amber, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(172, 172, 171, 1),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
