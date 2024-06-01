import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fyp_orvba/User%20Screens/user_home.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:gap/gap.dart';

class UserFeedback extends StatefulWidget {
  const UserFeedback({super.key});

  @override
  State<UserFeedback> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  int _selectedIndex = 0; // Keep track of selected index
  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref('feedback');
  TextEditingController _name = TextEditingController(); 
  TextEditingController _email = TextEditingController(); 
  TextEditingController _feedback = TextEditingController(); 

  sendFeedback(){
    Map<String,dynamic> feedbackData = {
      'name': _name.text,
      'feedback': _feedback.text ,
      'email': _email.text ,
    };

    _databaseReference.push().set(feedbackData).then((value) {
      _name.text = "";
      _email.text  =  "";
      _feedback.text = "";
    });

  }

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
          'User Profile',
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
                 Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child:  Column(
                    children: [
                       TextField(
                        decoration:const InputDecoration(
                          label: Text("Name"),
                        ),
                        controller: _name,
                      ),
                       TextField(
                        decoration:const InputDecoration(
                          label: Text("Email"),
                        ),
                        controller: _email,
                      ),
                       TextField(
                        decoration: const InputDecoration(
                          label: Text("Feedback"),
                        ),
                        maxLines: null,
                        controller: _feedback,
                      ),
                     const Gap(50),
                      MyTextButton(title: 'Submit', onPressed: (){
                        
                        if(_name.text.isNotEmpty && _email.text.isNotEmpty && _feedback.text.isNotEmpty){
                          sendFeedback();
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter data in fields")));
                        }
                        
                        })
                    ],
                  ),
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
