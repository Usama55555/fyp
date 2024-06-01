import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/package_text.dart';
import 'package:fyp_orvba/components/textStyels.dart';

class PackageContainer extends StatelessWidget {
  const PackageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              color: const Color(0xff7159E3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.black38,blurRadius: 6,offset: Offset(1,1),spreadRadius: 1)
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Rs. 2000/-",
                style: style18boldWhite,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    PackageText(
                      title: "Engine Service",
                    ),
                    PackageText(
                      title: "Electric Repair",
                    ),
                    PackageText(
                      title: "Tyre Repair",
                    ),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
