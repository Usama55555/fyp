import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_orvba/User%20Screens/findServices.dart';
import 'package:fyp_orvba/User%20Screens/myComplaints.dart';
import 'package:fyp_orvba/User%20Screens/userProfile.dart';
import 'package:fyp_orvba/components/holderContainer.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/login_screen.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UserHomePage> {
  int _selectedIndex = 0; // Keep track of selected index

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
List<Widget> userHomeWidgets=[
UserHome(),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: const Color.fromARGB(255, 212, 227, 222),

      body: userHomeWidgets[_selectedIndex],
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


class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Dashboard',
          style: style18boldWhite,
        ),
        backgroundColor: const Color(0xff7159E3),

      ),
            backgroundColor: const Color(0xff7159E3),
      body: Container(
        width: double.infinity,
        child: Expanded(
          child: Column(
          
            children: [
            HolderContainer2(title: 'Find Services',iconData: Icons.home, onpressed: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const FindServices())));
            },),
            HolderContainer2(title: 'View Requests',iconData: Icons.request_page, onpressed: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) =>const MyComplaint())));
            },),
            HolderContainer2(title: 'My Profile',iconData: Icons.person, onpressed: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) =>const UserProfile())));
            },),
            ],
          ),
        ),
      ),
    );
  }
}
