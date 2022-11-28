import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/movie.dart';
import 'package:flutterapp/screens/movie_list_screen.dart';
import 'package:flutterapp/services/google_signin_api.dart';
import 'package:flutterapp/services/webservice.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class GoogleSignInViewModel extends ChangeNotifier {


  bool isLoading=true;

  void initLoading(){
    isLoading=true;
    notifyListeners();
  }


  Future signIn() async {
    await GoogleSignInApi.login();
  }



}
