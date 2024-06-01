import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/textStyels.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageContrller = TextEditingController();
  
  List<String> _messages = [];

  Widget messageHolder(int index){
    return Padding(
      padding: const EdgeInsets.only(left: 100, top: 10,right: 5),
      child: Container(
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(_messages[index]),
        ),
      ),
    );
  }

  Widget receiverHolder(int index){
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10,right: 100),
      child: Container(
        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(_messages[index]),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff7159E3),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff7159E3),
          title: ListTile(
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
              "Horizon Petroleum",
              style: style12White,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: _messages.length,
                    itemBuilder: (context, index){
                    return index%2==0?messageHolder(index):receiverHolder(index);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: TextField(
                    maxLines: null,
                    controller: _messageContrller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "type here....",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  )),
                  Gap(10),
                  GestureDetector(
                      onTap: (){
                        print("tapped");
                        setState(() {
                          if(_messageContrller.text != ""){
                            String message = _messageContrller.text;
                            _messages.add(message);
                            _messageContrller.clear();
                          }else{
                            print("No working");
                          }
                        });

                      },
                      child: Icon(Icons.send,color: Colors.white,)),
                  Gap(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
