import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fyp_orvba/components/textStyels.dart';

class Requests_page extends StatefulWidget {
  const Requests_page({Key? key});

  @override
  _Requests_pageState createState() => _Requests_pageState();
}

class _Requests_pageState extends State<Requests_page>{
  late DatabaseReference _databaseReference;
  List<Map<String, dynamic>> _requests = []; // Adjusted the type here
  Map<String, dynamic> _selectedRequest = {}; // Initialize with an empty map

  @override
  void initState() {
    super.initState();
    _databaseReference = FirebaseDatabase.instance.reference().child('RequestedServives');
    _databaseReference.onValue.listen((event) {
      setState(() {
        _requests.clear();
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? data = event.snapshot.value as Map<dynamic, dynamic>?;
          if (data != null) {
            data.forEach((key, value) {
              value['id'] = key;
              _requests.add(value.cast<String, dynamic>()); // Cast to the correct type
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
        title: Text("Requests", style: style24boldWhite,),
        centerTitle: true,
        actions: [
          if (_selectedRequest.isNotEmpty) // Check if selected request is not empty
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteRequest(_selectedRequest['id']);
              },
            ),
        ],
      ),
      body: _requests.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _requests.length,
        itemBuilder: (context, index) {
          var request = _requests[index];
          Color statusColor = request['status'] == 'Accepted' ? Colors.green : Colors.red;
          return GestureDetector(
            onTap: () {
              _showStatusDialog(request); // Show dialog to change status
            },
            onLongPress: () {
              setState(() {
                _selectedRequest = request; // Set the selected request
              });
            },
            child: Card(
              child: ListTile(
                leading: Image.asset("assets/user.png"),
                title: Text(request['customerEmail'], style: style18boldBlack),
                subtitle: Text(request['complain'], style: style14boldBlack,),
                trailing: Text(
                  request['status'],
                  style: TextStyle(color: statusColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to show dialog to change status
  Future<void> _showStatusDialog(Map<String, dynamic> request) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Status'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _updateStatus(request['id'], 'Accepted');
                    Navigator.of(context).pop();
                  },
                  child: Text('Accept'),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    _updateStatus(request['id'], 'Rejected');
                    Navigator.of(context).pop();
                  },
                  child: Text('Reject'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to update status in the Firebase Realtime Database
  void _updateStatus(String id, String newStatus) {
    _databaseReference.child(id).update({
      'status': newStatus,
    }).then((_) {
      // Update successful
      setState(() {
        // Update local list
        _requests.firstWhere((request) => request['id'] == id)['status'] = newStatus;
      });
    }).catchError((error) {
      print("Failed to update status: $error");
      // Handle error
    });
  }

  // Function to delete a request from the Firebase Realtime Database
  void _deleteRequest(String id) {
    _databaseReference.child(id).remove().then((_) {
      // Removal successful, update local list
      setState(() {
        _requests.removeWhere((request) => request['id'] == id);
        _selectedRequest = {}; // Reset selected request
      });
    }).catchError((error) {
      print("Failed to delete request: $error");
      // Handle error
    });
  }
}
