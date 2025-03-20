// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/widget/CustomTextField.dart';
import 'package:tevent/core/widget/custom_eleveted_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: Text(
          "Register Page",
          style: TextStyle(fontFamily: "Times New Roman"),
        ),
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/birthday.png"),
                    radius: 70,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your Name";
                      }
                      return null;
                    },
                    hintText: "Enter Your Name",
                    hintStyle: TextStyle(fontFamily: "Times New Roman"),
                    color: AppColors.primaryLight,
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.primaryLight,
                    ),
                    labelText: "Name",
                    labelStyle: TextStyle(
                        fontFamily: "Times New Roman",
                        color: AppColors.primaryLight),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
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
                  CustomTextField(
                    controller: rePasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      if (value != passwordController.text) {
                        return "Password and RePassword not match";
                      }
                      return null;
                    },
                    hintText: "Rewrite your Password",
                    hintStyle: TextStyle(fontFamily: "Times New Roman"),
                    color: AppColors.primaryLight,
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: AppColors.primaryLight,
                    ),
                    obscureText: true,
                    labelText: "Re-Password",
                    labelStyle: TextStyle(
                        fontFamily: "Times New Roman",
                        color: AppColors.primaryLight),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevetedButton(
                      text: "Register",
                      onPressed: () {
                        register(context);
                      },
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

  void register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pushReplacementNamed(context, '/');

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      
    }
  }
}
