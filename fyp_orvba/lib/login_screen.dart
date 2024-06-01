import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp_orvba/Business%20Screens/business_dashboard.dart';
import 'package:fyp_orvba/User%20Screens/findServices.dart';
import 'package:fyp_orvba/User%20Screens/user_home.dart';
import 'package:fyp_orvba/components/admin_checker.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/components/textbox.dart';
import 'package:fyp_orvba/forgot_password/email_otp.dart';
import 'package:fyp_orvba/signup/user_signup.dart';
import 'package:gap/gap.dart';


class userLogin extends StatefulWidget {
  bool isAdmin;
  userLogin({super.key, this.isAdmin= true});

  @override
  State<userLogin> createState() => _userLoginState();
}

class _userLoginState extends State<userLogin> {
  final _database = FirebaseDatabase.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void _login() async {
    await firebaseAuth
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((value){
        if(widget.isAdmin == true){
    Navigator.pushReplacement(context,
    MaterialPageRoute(builder: ((context) => DashboardScreen())));
    }
        else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => UserHomePage())));
        }

    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Expanded(
              flex: 2,
              child:
                  Flexible(child: Image(image: AssetImage('assets/car.jpg'))),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Please login to continue',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    textBox(
                      text: 'Email',
                      icon: Icons.email,
                      controller: email,
                    ),
                    Gap(15),
                    textBox(
                      text: 'Password',
                      icon: Icons.lock,
                      controller: password,
                    ),
                    Gap(10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            emailVerificationCode()));
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Color(0xff7159E3), fontSize: 18),
                              ))),
                    )
                  ],
                )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Button(
                      text: 'Login',
                      onpress: () {

                        _login();
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: style13boldBlack,),
                      Gap(2),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>userSignup()));
                        },
                        child: Text("Register now", style: style13boldBlue,)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
