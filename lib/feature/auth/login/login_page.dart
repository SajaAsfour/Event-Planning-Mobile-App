// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/widget/CustomTextField.dart';
import 'package:tevent/core/widget/custom_eleveted_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login Page",
          style: TextStyle(
              fontFamily: "Times New Roman", color: AppColors.whiteColor),
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/birthday.png"),
                  radius: 70,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  hintText: "Enter Your Email",
                  hintStyle: TextStyle(fontFamily: "Times New Roman"),
                  color: AppColors.primaryLight,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.primaryLight,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      fontFamily: "Times New Roman",
                      color: AppColors.primaryLight),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters long";
                    }
                    return null;
                  },
                  hintText: "Enter Your Password",
                  hintStyle: TextStyle(fontFamily: "Times New Roman"),
                  color: AppColors.primaryLight,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: AppColors.primaryLight,
                  ),
                  obscureText: true,
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontFamily: "Times New Roman",
                      color: AppColors.primaryLight),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontFamily: "Times New Roman",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryLight,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryLight,
                          decorationThickness: 2),
                      textAlign: TextAlign.end,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text(
                        "Do not have an account?",
                        style: TextStyle(
                          fontFamily: "Times New Roman",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryLight,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryLight,
                          decorationThickness: 2,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevetedButton(
                    text: "Login",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        login(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
