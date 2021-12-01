import 'package:chat_karo/constants.dart';
import 'package:chat_karo/screens/login_screen.dart';
import 'package:chat_karo/screens/registration_screen.dart';
import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_widgets_ns/animated_widgets.dart';
import 'package:animated_widgets_ns/widgets/opacity_animated.dart';
import 'package:floating_text/floating_text.dart';
import 'package:nice_buttons/nice_buttons.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingText(
                    text: "Welcome to Sangini",
                    repeat: true,
                    isRTL: true,
                    floatingTextStyle: TextStyle(
                      color: Colors.yellow,
                      fontSize: 40,
                      shadows: [
                        BoxShadow(
                          color: Colors.yellowAccent,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: darkPrimaryColor),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Automatic identify verification which enables you to verify your identity",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black38, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              OpacityAnimatedWidget(
                enabled: true,
                duration: Duration(seconds: 3),
                curve: Curves.easeIn,
                delay: Duration(seconds: 1),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/illustration.png'),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 3,
                      left: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black)),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
