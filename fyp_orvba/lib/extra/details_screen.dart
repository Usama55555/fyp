import 'package:flutter/material.dart';
import 'package:fyp_orvba/extra/chat_screen.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/packageContainer.dart';
import 'package:fyp_orvba/components/textStyels.dart';

class ResultDetailsScreen extends StatelessWidget {
  const ResultDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 4,
                        color: const Color(0xff7159E3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                      child: ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                    ),
                                    title: Text(
                                      "Fahad Rasool",
                                      style: style16White,
                                    ),
                                    subtitle: Text(
                                      "Horizon Petroleum",
                                      style: style12White,
                                    ),
                                    trailing: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatScreen()));
                                      },
                                      child: const Icon(
                                        Icons.chat,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "5 Km",
                                        style: style14boldWhite,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        "(25)",
                                        style: style12White,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            child: const Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      PackageContainer(),
                                      PackageContainer(),
                                      PackageContainer(),
                                    ],
                                  ),
                                ),
                                Image(
                                  image: AssetImage("assets/map.PNG"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
      
          //  bottom button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 60,
              color: const Color(0xff7159E3),
              child: Center(
                  child: Text(
                "Send Request",
                style: style16White,
              )),
            ),
          ),
        ],
      )),
    );
  }
}
