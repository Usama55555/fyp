import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:firebase_database/firebase_database.dart';// Import the BusinessDetailsPage

class Feedback_page extends StatefulWidget {
  const Feedback_page({Key? key});

  @override
  _Feedback_pageState createState() => _Feedback_pageState();
}

class _Feedback_pageState extends State<Feedback_page>{
  late DatabaseReference _databaseReference;
  List<Map<String, dynamic>> _businesses = []; // Adjusted the type here

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.reference().child('feedback');
    _databaseReference.onValue.listen((event) {
      setState(() {
        _businesses.clear();
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
          if (data != null) {
            data.forEach((key, value) {
              value['id'] = key;
              _businesses.add(value.cast<String, dynamic>()); // Cast to the correct type
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff7159E3),
        title: Text("Feedback", style: style24boldWhite,),
        centerTitle: true,
      ),
      body: _businesses.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _businesses.length,
        itemBuilder: (context, index) {
          var feedback = _businesses[index];
          return GestureDetector(
            onTap: () {

            },
            child: Card(
              child: ListTile(
                leading: Image.asset("assets/user.png"),
                title: Text(feedback['name'], style: style18boldBlack),
                subtitle: Text(feedback['feedback'], style: style14boldBlack,),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deleteBusiness(feedback['id']);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to delete a business from the Firebase Realtime Database
  void _deleteBusiness(String id) {
    _databaseReference.child(id).remove().then((_) {
      // Removal successful, update local list
      setState(() {
        _businesses.removeWhere((business) => business['id'] == id);
      });
    }).catchError((error) {
      print("Failed to delete business: $error");
      // Handle error
    });
  }
}
