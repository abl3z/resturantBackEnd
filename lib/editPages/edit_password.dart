import 'package:flutter/material.dart';
import 'package:resturantapp/editPages/forget2.dart';
import 'package:resturantapp/information.dart';

User userInfo = User();
void main() {
  runApp(MaterialApp(
    home: editPass(),
  ));
}

bool _obscureTextOldPassword = true;
bool _obscureTextNewPassword = true;
bool _obscureTextConfirmPassword = true;

class editPass extends StatefulWidget {
  const editPass({super.key});

  @override
  State<editPass> createState() => _appState();
}

class _appState extends State<editPass> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
                Icons.password,
                size: 38,
                color: Colors.amber,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Change Password",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Pacifico',
                    fontSize: 28),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pass(context, "Old password", _obscureTextOldPassword,
                    _oldPasswordController),
                SizedBox(
                  height: 20,
                ),
                pass(context, "New password", _obscureTextNewPassword,
                    _newPasswordController),
                SizedBox(
                  height: 20,
                ),
                pass(context, "Confirm password", _obscureTextConfirmPassword,
                    _confirmPasswordController),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            User.setPassword(_newPasswordController.text);
                            User.setConfPass(_newPasswordController.text);
                            var sb1 = SnackBar(
                                content: Text(
                                  "You have Sucessfully Change Your Password",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                duration: Duration(seconds: 4),
                                backgroundColor:
                                    Color.fromRGBO(23, 70, 162, 1));
                            ScaffoldMessenger.of(context).showSnackBar(sb1);
                            Navigator.pop(context);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      ),
                      child: Text(
                        'Change Password',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(172, 172, 171, 1),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => forgetPage2(),
                          ),
                        );
                      },
                      child: Text('Forget password ?',
                          style: TextStyle(color: Colors.amber, fontSize: 15)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pass(BuildContext context, String txt, bool password,
      TextEditingController controller) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Your Password";
        }
        if (txt == "Confirm password" && value != _newPasswordController.text) {
          return 'Passwords do not match';
        }
        //TODO fix error
        if (_oldPasswordController.text != User.getPassword()) {
          return 'incorrect Old passwords ';
        }
        return null;
      },
      obscureText: password,
      controller: controller, // Set the appropriate controller
      decoration: InputDecoration(
        labelText: txt,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(23, 70, 162, 1), width: 1),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.visibility,
            color: Colors.amber,
            size: 30,
          ),
          onPressed: () {
            setState(
              () {
                if (txt == "Old password") {
                  _obscureTextOldPassword = !_obscureTextOldPassword;
                } else if (txt == "New password") {
                  _obscureTextNewPassword = !_obscureTextNewPassword;
                } else if (txt == "Confirm password") {
                  _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
                }
              },
            );
          },
        ),
      ),
    );
  }
}
