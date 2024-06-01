import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fyp_orvba/Business%20Screens/business_dashboard.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:gap/gap.dart';
import 'package:firebase_database/firebase_database.dart';
import '../components/textbox.dart';
import '../signup/finish.dart';

class CreateBusines extends StatefulWidget {
  const CreateBusines({super.key});

  @override
  State<CreateBusines> createState() => _CreateBusinesState();
}

class _CreateBusinesState extends State<CreateBusines> {
  final _database = FirebaseDatabase.instance.reference(); // Initialize FirebaseDatabase

  final businessNameController = TextEditingController();
  final mechanicNameController = TextEditingController();
  final servicesController = TextEditingController();
  final availableController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final mobileNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
             Padding(
               padding: const EdgeInsets.all(14.0),
               child: Container(
                  width: double.infinity,
                  child:  Align(
                    alignment: Alignment.topLeft,
                    child:  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  )),
             ),
            const SizedBox(height: 30,),
            Center(
              child: Text(
                "Business Details",
                style: style24boldBlack,
              ),
            ),
            Center(
              child: Text(
                "Please provide authentic details",
                style: style14boldGrey,
              ),
            ),
            const SizedBox(height: 30,),
            textBox(controller: businessNameController, text: "Business name", icon: Icons.business),
            Gap(15),
            textBox(controller: mechanicNameController, text: "Your name", icon: Icons.person),
            Gap(15),
            textBox(controller: servicesController, text: "Services", icon: Icons.home_repair_service),
            Gap(15),
            textBox(controller: availableController, text: "Available", icon: Icons.timelapse_outlined),
            Gap(15),
            textBox(controller: cityController, text: "City", icon: Icons.location_city),
            Gap(15),
            textBox(controller: addressController, text: "Address", icon: Icons.location_on),
            Gap(15),
            textBox(controller: mobileNoController, text: "Mobile no.", icon: Icons.phone),
            Gap(15),
            const Spacer(),
            Button(text: "Create Business", onpress: _createBusiness),
            Gap(15),
            // Button(text: "Create Business", onpress: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>verifiedUser(title: "Business Created",subtitle: "Click below to check business",onPress: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardScreen()));
            //   },)));
            // }),
            // // Gap(15),
          ],
        ),
      ),
    );
  }
  void _createBusiness() {
    // Extract values from text controllers
    String businessName = businessNameController.text;
    String mechanicName = mechanicNameController.text;
    String services = servicesController.text;
    String available = availableController.text;
    String city = cityController.text;
    String address = addressController.text;
    String mobileNo = mobileNoController.text;

    print("Business Name: $businessName");
    print("Mechanic Name: $mechanicName");
    print("Services: $services");
    print("Available: $available");
    print("City: $city");
    print("Address: $address");
    print("Mobile No.: $mobileNo");

    // Add data to FirebaseDatabase
    Map<String, dynamic> businessData = {
      'businessName': businessName,
      'mechanicName': mechanicName,
      'services': services,
      'available': available,
      'city': city,
      'address': address,
      'mobileNo': mobileNo,
    };

    _database.child('businesses').push().set(businessData).then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => verifiedUser(
            title: "Business Created",
            subtitle: "Click below to check business",
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
          ),
        ),
      );
    }).catchError((error) {
      print("Failed to add business to FirebaseDatabase: $error");
    });
  }


}



