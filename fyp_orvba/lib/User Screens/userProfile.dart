import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp_orvba/User%20Screens/user_home.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/complaintContainer.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/components/textbox.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:gap/gap.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserProfile> {
  TextEditingController _name = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();

  int _selectedIndex = 0; // Keep track of selected index
  late DatabaseReference _databaseReference;
  Map<String, dynamic> _businesses = {};
  User? user;
  String id = "";

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

  fetchData() {
    _databaseReference = FirebaseDatabase.instance.ref().child('register');
    _databaseReference.onValue.listen((event) {
      setState(() {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? data =
              event.snapshot.value as Map<dynamic, dynamic>?;
          if (data != null) {
            data.forEach((key, value) {
              if (value['email'] == 'fahadalibur@gmail.com') {
                id = key.toString();
                _businesses = value.cast<String, dynamic>();
              }
            });
          }
        }
      });
    });
  }

  updateData() {
    Map<String,dynamic> updatedData = {
      'fullname':  _name.text,
      'username': _username.text,
      'email': _email.text,
      'contact':  _mobile.text
    };

    _databaseReference = FirebaseDatabase.instance.ref().child('register');
    _databaseReference.child(id).update(updatedData).then((value) => Navigator.pop(context));
  }

  placeData() {
    _name.text = _businesses!["fullname"].toString();
    _username.text = _businesses!["username"].toString();
    _email.text = _businesses!["email"].toString();
    _mobile.text = _businesses!["contact"].toString();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'User Profile',
          style: style18boldWhite,
        ),
        backgroundColor: const Color(0xff7159E3),
      ),
      backgroundColor: const Color.fromARGB(255, 212, 227, 222),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 800,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "View user details",
                  style: style18boldBlack,
                ),
                const Gap(20),
                ProfileContainer(
                  businesses: _businesses,
                ),
                const Gap(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      width: 100,
                      child: MyTextButton(
                          title: "Update",
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // return object of dialog
                                return AlertDialog(
                                  title: Text('Update User Profile'),
                                  content: Column(
                                    children: [
                                      textBox(
                                        text: "Name",
                                        controller: _name,
                                      ),
                                      textBox(
                                        text: "Userame",
                                        controller: _username,
                                      ),
                                      textBox(
                                        text: "Email",
                                        controller: _email,
                                      ),
                                      textBox(
                                        text: "Mobile",
                                        controller: _mobile,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('CANCEL'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // handle OK button press
                                       updateData();
                                        // add your OK button logic here
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                            placeData();
                          })),
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
