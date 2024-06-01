import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:gap/gap.dart';

class ServicesContainer extends StatelessWidget {
  final VoidCallback showMap;
  final VoidCallback feedback;
   ServicesContainer({required this.showMap, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.96,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          color: Color.fromARGB(255, 226, 221, 221),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Business Name: Fahad Car Shop", style: style18boldBlack, overflow: TextOverflow.visible,),
                Gap(5),
                Text("Service description: 2 wheeler",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
                Text("Available: 24 hours",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
                Text("Address: Burewala",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
                Text("City: Burewala",style: style14Black,textAlign: TextAlign.left,),
                Gap(5),
                Text("Mobile: 123456789",style: style14Black,textAlign: TextAlign.left,),
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
              Expanded(child: MyTextButton(onPressed: (){}, title:"Request")),
              Gap(5),
              Expanded(child: MyTextButton(onPressed: showMap, title: "Show Map")),
              Gap(5),
              Expanded(child: MyTextButton(onPressed: feedback, title: "Feedback")),
            ],
          ),
        )
      ],
    );
  }
}