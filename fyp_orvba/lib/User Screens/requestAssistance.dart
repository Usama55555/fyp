import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp_orvba/User%20Screens/user_home.dart';
import 'package:fyp_orvba/components/button.dart';
import 'package:fyp_orvba/components/textStyels.dart';
import 'package:fyp_orvba/login_screen.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class RequestServices extends StatefulWidget {
  String businessId;
  RequestServices({super.key,required this.businessId});

  @override
  State<RequestServices> createState() => _FindServicesState();
}

class _FindServicesState extends State<RequestServices> {
  int _selectedIndex = 0; // Keep track of selected index
  DatabaseReference _databaseReference = FirebaseDatabase.instance.ref("RequestedServives");
  late GoogleMapController mapController;
  TextEditingController _complain = TextEditingController();
  LatLng tapedPoints = LatLng(0, 0);
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on selected index
    if (index == 1) {
      setState(() {
        _selectedIndex = 0;
      });
      // Logout logic here (e.g., navigate to login screen)
    }
  }

  _handleTap(LatLng points) {
    setState(() {
      tapedPoints = points;
    });
  }

  Future<LatLng?> _getCurrentLocation() async {
    loc.Location location = loc.Location();
    bool serviceEnabled;
    loc.PermissionStatus permissionStatus;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == loc.PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != loc.PermissionStatus.granted) {
        return null;
      }
    }

    loc.LocationData locationData = await location.getLocation();
    return LatLng(locationData.latitude!, locationData.longitude!);
  }

  sendRequestData(){
    User? user = FirebaseAuth.instance.currentUser;
      Map<String,dynamic> complainData = {
        'businessId': widget.businessId,
        'customerEmail':user!.email,
        'complain':_complain.text,
        'lat':tapedPoints.latitude,
        'long':tapedPoints.longitude,
        'status': 'pending'
      };
      _databaseReference.push().set(complainData).then((value){
        setState(() {
          _complain.text = "";
        });
      });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(Marker(
      markerId: MarkerId('marker_taped'),
      position: LatLng(tapedPoints.latitude, tapedPoints.longitude),
      infoWindow: InfoWindow(title: "Current"),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Request Assistance',
          style: style18boldWhite,
        ),
        backgroundColor: const Color(0xff7159E3),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: 800,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
             children: [
              Container(
                width: double.infinity,
                height: 400,
                child: GoogleMap(
                    myLocationButtonEnabled:
                        true, // Show "My Location" button
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    markers: _markers,
                    onTap: _handleTap,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(30.1568295, 72.6515467), zoom: 16)),
              ),
              Text(
                "Latitude: ${tapedPoints.latitude}",
              ),
              Text("Longitude: ${tapedPoints.longitude}"),
              const Text("Complaint:"),
               TextField(
                decoration:const  InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey, // Change this to your desired color
                      width: 1.0, // Change this to adjust the border thickness
                    ),
                  ),
                ),
                controller: _complain,
              ),
              const Gap(5),
              MyTextButton(title: "Submit", onPressed: () {
                sendRequestData();
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: GestureDetector(onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserHomePage()));
            }, child: Icon(Icons.home)),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: ()async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>userLogin()));
              },
              child: Icon(Icons.logout)),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff7159E3),
        onTap: _onItemTapped,
      ),
    );
  }
}
