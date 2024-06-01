import 'package:flutter/material.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:firebase_database/firebase_database.dart';
import 'detail_page.dart'; // Import the BusinessDetailsPage

class ManageBusiness extends StatefulWidget {
  const ManageBusiness({Key? key});

  @override
  _ManageBusinessState createState() => _ManageBusinessState();
}

class _ManageBusinessState extends State<ManageBusiness>{
  late DatabaseReference _databaseReference;
  List<Map<String, dynamic>> _businesses = []; // Adjusted the type here

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.reference().child('businesses');
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
        title: Text("Your Business", style: style24boldWhite,),
        centerTitle: true,
      ),
      body: _businesses.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _businesses.length,
        itemBuilder: (context, index) {
          var business = _businesses[index];
          return GestureDetector(
            onTap: () {
              // Navigate to BusinessDetailsPage and pass the business details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BusinessDetailsPage(
                    businessKey: business['id'], // Pass the businessKey
                    businessDetails: business,
                  ),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: Image.asset("assets/service.png"),
                title: Text(business['businessName'], style: style18boldBlack),
                subtitle: Text(business['city'], style: style14boldBlack,),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _deleteBusiness(business['id']);
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
