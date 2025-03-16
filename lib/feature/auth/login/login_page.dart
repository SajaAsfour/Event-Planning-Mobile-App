// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:tevent/core/utils/app_colors.dart';
import 'package:tevent/core/widget/CustomTextField.dart';
import 'package:tevent/core/widget/custom_eleveted_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/birthday.png"),
                radius: 70,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
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
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Enter Your Password",
                hintStyle: TextStyle(fontFamily: "Times New Roman"),
                color: AppColors.primaryLight,
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: AppColors.primaryLight,
                ),
                obscureText: true,
                labelText: "Password",
                labelStyle: TextStyle(
                    fontFamily: "Times New Roman",
                    color: AppColors.primaryLight),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Forget Password?",
                style: TextStyle(
                    fontFamily: "Times New Romman",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryLight,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primaryLight,
                    decorationThickness: 2),
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child: CustomElevetedButton(
                      text: "Login",
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
