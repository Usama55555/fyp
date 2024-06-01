import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fyp_orvba/User%20Screens/requestAssistance.dart';
import 'package:fyp_orvba/User%20Screens/userFeedback.dart';
import 'package:fyp_orvba/User%20Screens/user_home.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:gap/gap.dart';

class FindServices extends StatefulWidget {
  const FindServices({super.key});

  @override
  State<FindServices> createState() => _FindServicesState();
}

class _FindServicesState extends State<FindServices> {
    int _selectedIndex = 0; // Keep track of selected index
    User? user = FirebaseAuth.instance.currentUser;
    String? businessId;
     List<dynamic> dataList = []; 
      final database = FirebaseDatabase.instance.ref('businesses');

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
  void initState() {
    super.initState();  
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Find Services',
          style: style18boldWhite,
        ),
        backgroundColor: const Color(0xff7159E3),

      ),
      backgroundColor: const Color.fromARGB(255, 212, 227, 222),
      body: FirebaseAnimatedList(
        query: database,
        itemBuilder: ((context, snapshot, animation, index) {
          businessId = snapshot.child('businessId').value.toString();
          return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          color: const Color.fromARGB(255, 226, 221, 221),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Business Name: ${snapshot.child('businessName').value.toString()}", style: style18boldBlack, overflow: TextOverflow.visible,),
                Gap(5),
                Text("Service description: ${snapshot.child('mechanicName').value.toString()}",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
                Text("Available: ${snapshot.child('available').value.toString()} hours",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
                Text("Address: ${snapshot.child('address').value.toString()}",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
                Text("City: ${snapshot.child('city').value.toString()}",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
                Text("Mobile: ${snapshot.child('mobileNo').value.toString()}",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: MyTextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RequestServices(businessId: businessId!,)));
              }, title: "Request")),
              Gap(5),
              Expanded(child: MyTextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserFeedback()));
              }, title: "Feedback")),
            ],
          ),
        )
      ],
    );
        }), 
      ),

 
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
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