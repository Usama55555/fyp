import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/forgot_password/reset_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class emailVerificationCode extends StatefulWidget {
  const emailVerificationCode({super.key});

  @override
  State<emailVerificationCode> createState() => _emailVerificationCodeState();
}

class _emailVerificationCodeState extends State<emailVerificationCode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            const Expanded(
              flex: 3,
              child: Flexible(child: Image(image: AssetImage('assets/check.jpg'))),
            ),
            const Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Email sent!',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
                    Text(textAlign: TextAlign.center,'We have send you an email with \n password recovery code',style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: PinCodeTextField(
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(selectedColor: const Color(0xff7159E3)),
                      cursorColor: const Color(0xff7159E3),
                      obscureText: true,
                      appContext: context,
                      length: 5,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                children: [
                  Button(
                    text: "Next",
                    onpress: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>resetPassword()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
