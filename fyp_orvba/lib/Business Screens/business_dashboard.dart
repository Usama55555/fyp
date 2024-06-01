import 'package:flutter/material.dart';
import 'package:fyp_orvba/Business%20Screens/Request.dart';
import 'package:fyp_orvba/Business%20Screens/crete_%20business.dart';
import 'package:fyp_orvba/Business%20Screens/feedback.dart';
import 'package:fyp_orvba/Business%20Screens/manage_business.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/components/holderContainer.dart';
import '../login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>userLogin()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff7159E3),
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            'Dashboard',
            style: style18boldWhite,
          ),
          backgroundColor: const Color(0xff7159E3),
      
        ),
        body: Center(
          child: _selectedIndex == 0
              ? Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                      width: double.infinity,
                      child: Text("Create your own Business", textAlign: TextAlign.left,style: style14boldWhite,)),
                ),
      
                HolderContainer(
                  title: "Create Business",
                  imageURL: "assets/report.png",
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateBusines()));
      
                  },
                ),
                HolderContainer(
                  title: "Update Business",
                  imageURL: "assets/service.png",
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ManageBusiness()));
      
                  },
                ),
                HolderContainer(
                  title: "Requests",
                  imageURL: 'assets/route.png',
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Requests_page()));
                  },
                ),
                HolderContainer(
                  title: "View Feedback",
                  imageURL: "assets/feedback.png",
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Feedback_page()));
                  },
                ),
              ],
            ),
          )
              : Text('Second Tab Content'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      
      
      
        drawer: SafeArea(
          child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xff7159E3),
                    ),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 35,
                        ),
                        Text(
                          "M. Usama Bilal",
                          style: style18boldWhite,
                        ),
                        Text(
                          "mohammadusamabilal8@gmail.com",
                          style: style13boldWhite,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                      size: 20,
                    ),
                    title: Text(
                      'Home',
                      style: style13,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.add,
                      size: 20,
                    ),
                    title: Text(
                      'Add Business',
                      style: style13,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateBusines()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.update_sharp,
                      size: 20,
                    ),
                    title: Text(
                      'Manage Business',
                      style: style13,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ManageBusiness()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      size: 20,
                    ),
                    title: Text(
                      'Logout',
                      style: style13,
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>userLogin()));
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
