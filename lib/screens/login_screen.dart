
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutterapp/screens/login_email_password_screen.dart';
import 'package:flutterapp/screens/phone_screen.dart';
import 'package:flutterapp/screens/signup_email_password_screen.dart';
import 'package:flutterapp/services/firebase_auth_methods.dart';
import 'package:flutterapp/widgets/custom_button.dart';
import 'package:flutterapp/widgets/elevated_button.dart';


class LoginScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<LoginScreen> {


  @override
  initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            //Brightness.dark = iconos blancos, Brightness.light= iconos negros
            backgroundColor: Colors.lightBlue,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  //ElevatedButtonIcon()
                  CustomButton(
                    onTap: (){
                      Navigator.pushNamed(context, EmailPasswordSignup.routeName);
                    },
                    text: 'Email/Password Sign Up',
                  ),
                  CustomButton(
                    onTap: (){
                      Navigator.pushNamed(context, EmailPasswordLogin.routeName);
                    },
                    text: 'Email/Password Login',
                  ),
                  CustomButton(
                    onTap: (){
                      Navigator.pushNamed(context, PhoneScreen.routeName);
                    },
                    //el login con teléfono quedó incompleto por que no funciona keytool en Windows
                    //la persona del tutorial utiliza Mac OS (https://www.youtube.com/watch?v=u8H652UY-L8)
                    text: 'Phone Sign In (Quedó incompleto)',
                  ),
                  CustomButton(
                    onTap: (){
                      FirebaseAuthMethods(FirebaseAuth.instance)
                        .singnInWithGoogle(context);
                    },
                    text: 'Google Sign In',
                  ),
                  CustomButton(
                    onTap: (){

                    },
                    text: 'Facebook Sign In',
                  ),
                  CustomButton(
                    onTap: (){

                    },
                    text: 'Anonymous Sign In',
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

