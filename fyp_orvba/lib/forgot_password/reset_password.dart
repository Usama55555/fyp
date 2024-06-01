import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textbox.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:gap/gap.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({super.key});

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Expanded(
              flex: 2,
              child: Flexible(child: Image(image: AssetImage('assets/car.jpg'))),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Reset Password',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
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
                      textBox(text: 'Password', icon: Icons.lock),
                      Gap(15),
                      textBox(text: 'Confirm Password', icon: Icons.lock),

                    ],),
                )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Button(text: 'Reset Now', onpress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>userLogin()));
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
