import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/textStyels.dart';

import 'details_screen.dart';

class SearchResults extends StatelessWidget {
  bool? isPetroleum;
  SearchResults({super.key, this.isPetroleum});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                width: double.infinity,
                color: const Color(0xff7159E3),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Search results for",
                            style: style24boldWhite,
                          ),
                          Text(
                            "Nearby ${isPetroleum==true?"Petroleum":"Service"} Stations",
                            style: style13boldWhite,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: 11,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResultDetailsScreen()));
                          },
                          child: Card(
                            color: const Color(0xff7159E3),
                            child: ListTile(
                              leading: const Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 5,
                                  )
                                ],
                              ),
                              title: Text(
                                "Fahad Rasool",
                                style: style16White,
                              ),
                              subtitle: Text(
                                "Horizon ${isPetroleum==true?"Petroleum":"Service"}",
                                style: style12White,
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "5 Km",
                                    style: style12White,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children:  [
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
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
