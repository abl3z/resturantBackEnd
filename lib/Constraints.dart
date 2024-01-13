import 'package:flutter/material.dart';

// Text field constraints and validations
var firstNameLabel = "First Name";
var lastNameLabel = "Last Name";
var emailLabel = "Enter Your Email";
var emailHint = "example@gmail.com";
var phoneLabel = "Enter Your Phone Number";
var phoneHint = "+962";
var passwordLabel = "Enter Your Password";
var confirmPasswordLabel = "Confirm Your Password";

var KTextStyle = TextStyle(fontSize: 70);

// Validation messages
var firstNameValidation = "Please Enter Your First name";
var lastNameValidation = "Please Enter Your Last Name";
var emailValidation = "Please Enter More Than 8 Characters";
var phoneValidation = "Please Enter a Valid Phone Number";
var passwordValidation = "Please Enter Your Password";
var confirmPasswordValidation = "Passwords Do Not Match";

// Text field styling
var textFieldColor = Colors.black;
var textFieldLabelColor = Colors.black;
var textFieldFocusedColor = Colors.black;
var textFieldBorderWidth = 2.0;

// Padding for text fields
var textFieldPadding = EdgeInsets.all(25);

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController PhNum = TextEditingController();
  TextEditingController pswd = TextEditingController();
  TextEditingController pswd_confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Name and Last Name TextFields
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return firstNameValidation;
                        }
                      },
                      controller: firstNameController,
                      decoration: InputDecoration(
                        iconColor: textFieldColor,
                        labelText: firstNameLabel,
                        labelStyle: TextStyle(color: textFieldLabelColor),
                        hintText: emailHint,
                        icon: Icon(Icons.account_circle_rounded),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textFieldColor,
                              width: textFieldBorderWidth),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textFieldFocusedColor,
                              width: textFieldBorderWidth),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return lastNameValidation;
                        }
                      },
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: lastNameLabel,
                        labelStyle: TextStyle(color: textFieldLabelColor),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textFieldColor,
                              width: textFieldBorderWidth),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textFieldFocusedColor,
                              width: textFieldBorderWidth),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Email, Phone, Password, and Confirm Password TextFields have the same constraints
          ],
        ),
      ),
    );
  }
}
