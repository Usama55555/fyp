import 'package:flutter/material.dart';
import 'package:fyp_orvba/Business%20Screens/manage_business.dart';
import '../components/textbox.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:gap/gap.dart';
import 'package:firebase_database/firebase_database.dart';

class EditBusinessPage extends StatefulWidget {
  final String businessKey;
  final Map<dynamic, dynamic> businessDetails;

  const EditBusinessPage({Key? key, required this.businessKey, required this.businessDetails}) : super(key: key);

  @override
  _EditBusinessPageState createState() => _EditBusinessPageState();
}

class _EditBusinessPageState extends State<EditBusinessPage> {
  final _database = FirebaseDatabase.instance.reference();

  late TextEditingController businessNameController;
  late TextEditingController mechanicNameController;
  late TextEditingController servicesController;
  late TextEditingController availableController;
  late TextEditingController cityController;
  late TextEditingController addressController;
  late TextEditingController mobileNoController;

  @override
  void initState() {
    super.initState();
    businessNameController = TextEditingController(text: widget.businessDetails['businessName']);
    mechanicNameController = TextEditingController(text: widget.businessDetails['mechanicName']);
    servicesController = TextEditingController(text: widget.businessDetails['services']);
    availableController = TextEditingController(text: widget.businessDetails['available']);
    cityController = TextEditingController(text: widget.businessDetails['city']);
    addressController = TextEditingController(text: widget.businessDetails['address']);
    mobileNoController = TextEditingController(text: widget.businessDetails['mobileNo']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Business Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
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
          Button(text: "Update Business", onpress: _updateBusiness),
          Gap(15),
        ],
      ),
    );
  }

  void _updateBusiness() {
    // Extract values from text controllers
    String businessName = businessNameController.text;
    String mechanicName = mechanicNameController.text;
    String services = servicesController.text;
    String available = availableController.text;
    String city = cityController.text;
    String address = addressController.text;
    String mobileNo = mobileNoController.text;

    // Create a map of updated data
    Map<String, dynamic> updatedData = {
      'businessName': businessName,
      'mechanicName': mechanicName,
      'services': services,
      'available': available,
      'city': city,
      'address': address,
      'mobileNo': mobileNo,
    };

    // Update the data in FirebaseDatabase
    _database.child('businesses').child(widget.businessKey).update(updatedData).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ManageBusiness())); // Close edit page
    }).catchError((error) {
      print("Failed to update business in FirebaseDatabase: $error");
    });
  }
}
