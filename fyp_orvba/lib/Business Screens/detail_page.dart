import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'edit_details.dart'; // Import the edit page

class BusinessDetailsPage extends StatelessWidget {
  final String businessKey;
  final Map<dynamic, dynamic> businessDetails;

  const BusinessDetailsPage({Key? key, required this.businessKey, required this.businessDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Details', style: style24boldWhite,),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff7159E3),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: [
                  Text(style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),'Business Name:  '),
                  Text(style: TextStyle(fontSize: 17,),'${businessDetails['businessName']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: [
                  Text(style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),'Name:  '),
                  Text(style: TextStyle(fontSize: 17,),'${businessDetails['mechanicName']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: [
                  Text(style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),'Services:  '),
                  Text(style: TextStyle(fontSize: 17,),'${businessDetails['services']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: [
                  Text(style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),'Available:  '),
                  Text(style: TextStyle(fontSize: 17,),'${businessDetails['available']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: [
                  Text(style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),'City:  '),
                  Text(style: TextStyle(fontSize: 17,),'${businessDetails['city']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: [
                  Text(style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),'Address:  '),
                  Text(style: TextStyle(fontSize: 17,),'${businessDetails['address']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                children: [
                  Text(style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),'Mobile No:  '),
                  Text(style: TextStyle(fontSize: 17,),'${businessDetails['mobileNo']}'),
                ],
              ),
            ),
            // Add more fields as needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditBusinessPage(
                businessKey: businessKey,
                businessDetails: businessDetails,
              ),
            ),
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
