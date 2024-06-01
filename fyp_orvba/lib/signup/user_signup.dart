import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/components/textbox.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:fyp_orvba/signup/verification.dart';
import 'package:gap/gap.dart';

class userSignup extends StatefulWidget {
  const userSignup({super.key});

  @override
  State<userSignup> createState() => _userSignupState();
}

class _userSignupState extends State<userSignup> {
  final _database = FirebaseDatabase.instance.ref();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController fullname = TextEditingController();

  void _signUpUser() async {
    // Extract values from text controllers
    String _fullname = fullname.text;
    String _username = username.text;
    String _email = email.text;
    String _password = password.text;
    String _contect = contact.text;
    

    // Add data to FirebaseDatabase
    Map<String, dynamic> userSignupData = {
      'fullname': _fullname,
      'username': _username,
      'email': _email,
      'contact': _contect,
    };

      UserCredential? userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _password);
    if(userCredential.user != null){
      _database.child('register').push().set(userSignupData);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => userLogin())));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("The email address is already in use.")));
    }


  }

  validateTextFields() {
    if (username.text.isNotEmpty &&
        contact.text.isNotEmpty &&
        email.text.isNotEmpty &&
        fullname.text.isNotEmpty &&
        password.text.isNotEmpty) {
      int num =
          password.text.toString().compareTo(confirmPassword.text.toString());
      if (num != 0) {
        return 1;
      }
      return 0;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Please provide authentic details',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      textBox(
                        text: 'Full Name',
                        icon: Icons.person,
                        controller: fullname,
                      ),
                      Gap(15),
                      textBox(
                        text: 'Name',
                        icon: Icons.person,
                        controller: username,
                      ),
                      Gap(15),
                      textBox(
                        text: 'Email',
                        icon: Icons.email,
                        controller: email,
                      ),
                      Gap(15),
                      textBox(
                        text: 'Contact',
                        icon: Icons.phone,
                        controller: contact,
                      ),
                      Gap(15),
                      textBox(
                        text: 'Password',
                        icon: Icons.lock,
                        controller: password,
                      ),
                      Gap(15),
                      textBox(
                        text: 'Confirm Password',
                        icon: Icons.lock,
                        controller: confirmPassword,
                      ),
                    ],
                  ),
                )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Button(
                      text: 'Sign Up',
                      onpress: () {
                        if (validateTextFields() == 0) {
                          _signUpUser();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Password did't match")));
                        }
                      }),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: style13boldBlack,
                  ),
                  Gap(2),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => userLogin()));
                      },
                      child: Text(
                        "Login now",
                        style: style13boldBlue,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
