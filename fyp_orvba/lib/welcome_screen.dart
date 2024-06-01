import "package:flutter/material.dart";
import 'package:fyp_orvba/components/admin_checker.dart';
import "package:fyp_orvba/components/button.dart";
import 'package:fyp_orvba/login_screen.dart';
import 'package:fyp_orvba/signup/user_signup.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Expanded(
              flex: 2,
              child: Flexible(child: Image(image: AssetImage('assets/car.jpg'))),
            ),
            const Expanded(
              flex: 2,
              child: Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(textAlign: TextAlign.center,'To continue please select your role that best define your interest',style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
              ),
            ),
            Gap(260),
            Expanded(
              child: Flexible(
                child: Column(
                  children: [
                    Button(
                      text: 'User',
                      onpress: () {
                        setState(() {
                          setAdmin(false);
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  userLogin(isAdmin: false,)),
                        );
                      },
                    ),
                    const Gap(12),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            setAdmin(true);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> userLogin(isAdmin: true,)));
                        },
                        child: const uniqueButton(text: 'Mechanic'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
