import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/holderContainer.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:fyp_orvba/extra/searchResults.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff7159E3),
      appBar: AppBar(
        backgroundColor: const Color(0xff7159E3),
        foregroundColor:  Colors.white,
        title: Text(
          "Dashboard",
          style: head18bold,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                     width: double.infinity,
                      child: Text("Please select desired Station", textAlign: TextAlign.left,style: style14boldWhite,)),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HolderContainer(
                        title: "Petroleum",
                        imageURL: "assets/gas.png",
                        onpressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchResults(isPetroleum: true,)));
                        },
                      ),
                      HolderContainer(
                        title: "Service",
                        imageURL: "assets/service.png",
                        onpressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchResults(isPetroleum: false,)));
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 2,)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height*0.52,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on),
                        Text(
                          "Your Location",
                          style: head14bold,
                        ),
                      ],
                    ),
                  ),
                 const Padding(
                    padding:  EdgeInsets.all(4.0),
                    child:  Image(
                      image: AssetImage("assets/map.PNG"),
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
                    "Fahad Rasool",
                    style: style18boldWhite,
                  ),
                  Text(
                    "fahadalibur@gmail.com",
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
            // ListTile(
            //   leading: const Icon(
            //     Icons.settings,
            //     size: 20,
            //   ),
            //   title: Text(
            //     'Setting',
            //     style: style13,
            //   ),
            //   onTap: () {},
            // ),
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
    );
  }
}
