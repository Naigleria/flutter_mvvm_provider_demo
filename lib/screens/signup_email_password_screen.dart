import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/services/firebase_auth_methods.dart';
import 'package:flutterapp/widgets/custom_button.dart';
import 'package:flutterapp/widgets/custom_textfield.dart';

class EmailPasswordSignup extends StatefulWidget {
  static String routeName='/signup-email-password';
  EmailPasswordSignup({Key? key}) : super(key: key);

  @override
  State<EmailPasswordSignup> createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<EmailPasswordSignup> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser(){
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(fontSize: 30.0),
          ),
          SizedBox(height:MediaQuery.of(context).size.height*0.08),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: emailController,
              hintText: 'Enter your email',
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: passwordController,
              hintText: 'Enter your password',
            ),
          ),
          SizedBox(height: 40.0),
          CustomButton(
            onTap: signUpUser,
            text: 'Sign Up'
          )
        ],
      ),
    );
  }
}