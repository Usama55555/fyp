import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/textStyels.dart';

class HolderContainer extends StatelessWidget {
  final String imageURL;
  final String title;
  final VoidCallback onpressed;
  HolderContainer({required this.title, required this.imageURL, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image(
                  image: AssetImage(imageURL),
                  width: 70,
                ),
                Text(
                  title,
                  style: head14bold,
                ),
                Text(
                  "",
                  style: head14bold,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class HolderContainer2 extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onpressed;
  HolderContainer2({required this.title, required this.iconData, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(iconData,size: 70,),
              Text(
                title,
                style: head14bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
