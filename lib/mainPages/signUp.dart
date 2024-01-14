import 'package:flutter/material.dart';
import 'login.dart';
import '/MenuPages/menu.dart';
import '/information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:resBackEnd/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

User1 userInfo = User1();
int _selectedGender = 0;

Future<void> main() async {
  runApp(Signup());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class Signup extends StatelessWidget {
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Info());
  }
}

class Info extends StatefulWidget {
  Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

bool isObscurePassword = true;
bool isObscureConfirmPassword = true;

class _InfoState extends State<Info> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController PhNum = TextEditingController();
  TextEditingController pswd = TextEditingController();
  TextEditingController pswd_confirm = TextEditingController();
  var _formKey = GlobalKey<FormState>();

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

  final DatabaseReference UserRef =
      FirebaseDatabase.instance.ref().child("users");
  String gender1 = "";
  Future<void> handleSignUp() async {
    try {
      await Auth()
          .signUp(email: emailController.text, password: pswd.text)
          .whenComplete(() {
        Future.delayed(Duration(seconds: 3)).then((value) {
          UserDetails user = UserDetails(
              name: firstNameController.text,
              email: emailController.text,
              phone_Num: PhNum.text,
              photo:
                  "https://i.kym-cdn.com/entries/icons/facebook/000/041/742/cover3.jpg");
          print("registered success");
          var userid = Auth().auth.currentUser!.uid;
          userref
              .child("users")
              .child(userid)
              .set(user.toMap())
              .whenComplete(() {
            print("user added to database");
            fetchUserData();
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  final DatabaseReference userref = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 247, 233, 1),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 65,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sing Up",
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
          backgroundColor: Color.fromRGBO(23, 70, 162, 1),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty || value.length < 2) {
                                  return 'Please Enter Your Full name';
                                }
                                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                  return 'Only Alphabetical Characters Allowed';
                                } else {
                                  User1.setFullName(value);
                                }
                              },
                              controller: firstNameController,
                              decoration: InputDecoration(
                                iconColor: Colors.black,
                                labelText: "Enter Your Full Name",
                                hintText: "Full Name",
                                labelStyle: TextStyle(color: Colors.black),
                                icon: Icon(
                                  Icons.account_circle_rounded,
                                  color: Colors.amber,
                                  size: 40,
                                ),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(23, 70, 162, 1),
                                      width: 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.male_outlined,
                        color: Colors.amber,
                        size: 40,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Select your Gender : ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      DropdownButton<int>(
                        hint: Text("Gender"),
                        value: _selectedGender,
                        onChanged: (newGender) {
                          setState(() {
                            if (newGender == 0) {
                              _selectedGender = 0;
                              gender1 = "Male";
                            } else {
                              _selectedGender = 1;
                              gender1 = "Female";
                            }
                            //TODO Fix the gender not responding
                            User1.setGender(
                              _selectedGender,
                            );
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'Male',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              'Female',
                              style: TextStyle(color: Colors.pinkAccent),
                            ),
                            value: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value!)) {
                          return 'Please Enter a Valid Email Address';
                        } else {
                          User1.setEmail(value);
                        }
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        iconColor: Colors.black,
                        labelText: ("Enter Your Email"),
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "example@gmail.com",
                        icon: Icon(
                          Icons.email_outlined,
                          size: 40,
                          color: Colors.amber,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return "Please Enter Your Phone Number";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Only Numbers';
                        } else {
                          User1.setPhoneNumber(value);
                        }
                      },
                      controller: PhNum,
                      decoration: InputDecoration(
                        iconColor: Colors.black,
                        label: Text("Enter Your Phone Number"),
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: "+962",
                        icon: Icon(
                          Icons.add_call,
                          size: 40,
                          color: Colors.amber,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: isObscurePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Password';
                        } else {
                          User1.setPassword(value);
                        }
                      },
                      controller: pswd,
                      decoration: InputDecoration(
                        iconColor: Colors.black,
                        label: Text("Enter Your Password"),
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(
                          Icons.password,
                          size: 40,
                          color: Colors.amber,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.amber,
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
                              color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: isObscureConfirmPassword,
                      validator: (value) {
                        if (value != pswd.text) {
                          return 'Passwords Do Not Match';
                        }
                        if (value!.isEmpty) {
                          return "Please Enter Your Password";
                        } else {
                          User1.setConfPass(value);
                        }
                      },
                      controller: pswd_confirm,
                      decoration: InputDecoration(
                        iconColor: Colors.black,
                        label: Text("Confirm Your Password"),
                        labelStyle: TextStyle(color: Colors.black),
                        icon: Icon(
                          Icons.password,
                          size: 40,
                          color: Colors.amber,
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
                              color: Color.fromRGBO(23, 70, 162, 1), width: 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  print(
                                      "--------------------------------------------------------------");
                                  // print(info);
                                  // print(check);
                                  handleSignUp();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Menu(
                                        fullName: User1.getFullName(),
                                        email: User1.getEmail(),
                                      ),
                                    ),
                                  );
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              padding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 27),
                            ),
                            child: Text(
                              "Sign Up Now",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(172, 172, 171, 1),
                              padding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 27),
                            ),
                            child: Text(
                              "Sign in Now",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.amber),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(370, 70),
                          primary: Colors.black,
                          padding: EdgeInsets.symmetric(
                              vertical: 19, horizontal: 30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 47,
                            ),
                            Image.asset(
                              "assets/Google.webp",
                              width: 40,
                              height: 30,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Login With Google",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
