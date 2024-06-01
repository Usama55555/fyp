import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fyp_orvba/User%20Screens/user_home.dart';
import 'package:fyp_orvba/components/complaintContainer.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:fyp_orvba/main.dart';
import 'package:gap/gap.dart';

class MyComplaint extends StatefulWidget {
  const MyComplaint({super.key});

  @override
  State<MyComplaint> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<MyComplaint> {
  int _selectedIndex = 0; // Keep track of selected index
  final database = FirebaseDatabase.instance.ref('RequestedServives');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on selected index
    if (index == 1) {
      setState(() {
        _selectedIndex = 0;
      });
      // Logout logic here (e.g., navigate to login screen)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'My Requests',
          style: style18boldWhite,
        ),
        backgroundColor: const Color(0xff7159E3),

      ),
      backgroundColor: const Color(0xff7159E3),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 800,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
               const Gap(20),
                  FirebaseAnimatedList(
                    shrinkWrap: true,
                    query: database, 
                    itemBuilder: ((context, snapshot, animation, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ComplaintContainer(index: index+1, username: snapshot.child("businessId").value.toString(), complaint: snapshot.child("complain").value.toString(), status: snapshot.child("status").value.toString()),
                      );
                    })
                    )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserHomePage()));
            }, child: Icon(Icons.home)),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: ()async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>userLogin()));
              },
              child: Icon(Icons.logout)),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff7159E3),
        onTap: _onItemTapped,
      ),
    );
  }
}
