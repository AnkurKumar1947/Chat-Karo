import 'package:chat_karo/screens/chat_screen.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email = 'abc@gmail.com';
  String password = '123456';
  String confirmPassword = '123456';
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff009688),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              //color: Colors.orange,
              height: _size.height - 50,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login to your Account",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      makeInput(label: 'Email'),
                      makeInput(label: 'Password', obscureText: true),
                      makeInput(label: 'Confirm Password', obscureText: true),
                    ],
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
                      color: Colors.greenAccent,
                      elevation: 0,
                      onPressed: () async {
                        if (password != confirmPassword) {
                          CherryToast.error(
                                  title: "",
                                  displayTitle: false,
                                  description: "Passwords Don't Match",
                                  //animationType: ANIMATION_TYPE.FROM_RIGHT,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  autoDismiss: true)
                              .show(context);
                        } else if (password.length < 7) {
                          CherryToast.error(
                                  title: "",
                                  displayTitle: false,
                                  description:
                                      "Password must have Atleast 7 Characters",
                                  //animationType: ANIMATION_TYPE.FROM_RIGHT,
                                  animationDuration:
                                      Duration(milliseconds: 1000),
                                  autoDismiss: true)
                              .show(context);
                        } else {
                          print(email);
                          print(password);
                          print(confirmPassword);
                          setState(() {
                            showSpinner = true;
                          });

                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                            if (newUser != null) {
                              Navigator.pushNamed(context, ChatScreen.id);
                            }

                            setState(() {
                              showSpinner = false;
                            });

                            print('Koi exception nahi aayi bhai...shukr hai');
                          } catch (e) {
                            CherryToast.error(
                                    title: "",
                                    displayTitle: false,
                                    description:
                                        "Please Enter Correct Format of Email",
                                    //animationType: ANIMATION_TYPE.FROM_RIGHT,
                                    animationDuration:
                                        Duration(milliseconds: 1000),
                                    autoDismiss: true)
                                .show(context);
                            setState(() {
                              showSpinner = false;
                            });
                            print('Exception aa rhi hai bhai ye wali ---> ');
                            print(e);
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ? "),
                      Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(height: 5),
        TextField(
          //textAlign: TextAlign.center,
          onChanged: (value) {
            if (label == 'Email')
              email = value;
            else if (label == 'Password')
              password = value;
            else
              confirmPassword = value;
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
