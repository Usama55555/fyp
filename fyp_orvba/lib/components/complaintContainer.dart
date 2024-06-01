import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:gap/gap.dart';

class ComplaintContainer extends StatelessWidget {
  final int index;
  final String username;
  final String complaint;
  final String status;
  const ComplaintContainer({super.key, required this.index, required this.username,required this.complaint, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.94,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Complaint ID: $index",
              style: style18boldBlack,
            ),
            Gap(5),
            Text(
              "Email: $username",
              style: style14boldBlack,
            ),
            Gap(5),
            Text(
              "Complaint: $complaint",
              style: style14boldBlack,
            ),
            Gap(5),
            Text(
              "Status: $status",
              style: style14boldGreen,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  Map<String, dynamic> businesses; 
   ProfileContainer({super.key, required this.businesses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundColor:  Color.fromARGB(67, 110, 161, 249),
          radius: 66,
          child: CircleAvatar(
            backgroundColor:  Colors.transparent,
            backgroundImage: AssetImage("user.png"),
            radius: 65,
          ),
        ),
        Gap(50),
        Container(
          width: MediaQuery.of(context).size.width * 0.94,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Name:",
                      style: style14Grey,
                    ),
                    const Gap(10),
                    Text(
                      businesses!['fullname'].toString(),
                      style: style14boldBlack,
                    ),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    Text(
                      "Email:",
                      style: style14Grey,
                    ),
                    const Gap(10),
                    Text(
                      businesses!['email'].toString(),
                      style: style14boldBlack,
                    ),
                  ],
                ),
                const Gap(10),
                Row(children: [
                  Text(
                    "Username:",
                    style: style14Grey,
                  ),
                  const Gap(10),
                  Text(
                   businesses!['username'].toString(),
                    style: style14boldBlack,
                  ),
                ]),
                const Gap(10),
                Row(
                  children: [
                    Text(
                      "Mobile:",
                      style: style14Grey,
                    ),
                    const Gap(10),
                    Text(
                      businesses!['contact'].toString(),
                      style: style14boldBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Gap(10),
    
      ],
    );
  }
}
