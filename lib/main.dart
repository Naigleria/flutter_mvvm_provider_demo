import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/firebase_options.dart';
import 'package:flutterapp/providers/generalAppInfo.dart';
import 'package:flutterapp/screens/login_email_password_screen.dart';
import 'package:flutterapp/screens/login_screen.dart';
import 'package:flutterapp/screens/movie_list_screen.dart';
import 'package:flutterapp/screens/phone_screen.dart';
import 'package:flutterapp/screens/signup_email_password_screen.dart';
import 'package:flutterapp/view%20models/movie_list_view_model.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>GeneralAppInfo()),
      ],
      child: MaterialApp(
        title: "Movies",
        debugShowCheckedModeBanner: false,
        home:
        ChangeNotifierProvider(
          create: (context) => MovieListViewModel(),
          child: LoginScreen(),

        ),
        routes: {
          EmailPasswordSignup.routeName: (context) => EmailPasswordSignup(),
          EmailPasswordLogin.routeName:(context) => EmailPasswordLogin(),
          PhoneScreen.routeName:(context) => PhoneScreen(),
        },
      ),
    );
  }

}