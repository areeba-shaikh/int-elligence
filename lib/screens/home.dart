import 'package:ambulance/screens/initial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:ambulance/screens/bookambulance.dart';
import 'package:ambulance/screens/profile.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
// import 'package:ambulance/screens/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  //TextEditingController locController = TextEditingController();
  getUserLocation() async {
    //call this async method from whereever you need

    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(' ${first.subLocality},${first.locality}, ${first.adminArea}, ');
    //locController.text = first.addressLine;
    return first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Container(
            color: Colors.lightBlue,
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        size: 100,
                      ),
                      SizedBox(
                        width: 15,
                        height: 30,
                      ),
                      Container(
                        width: 100.0,
                        height: 200.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Name",
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            // Text(
                            //   "${first.addressLine})",
                            //   textAlign: TextAlign.left,
                            //   maxLines: 2,
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  color: Colors.blueAccent,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.perm_identity),
                        title: Text(
                          'My Profile',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        hoverColor: Colors.lightBlue,
                        focusColor: Colors.indigo,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyProfile(),
                              ));
                        },
                      ),
                      Divider(
                        thickness: 5,
                        color: Colors.lightBlue,
                      ),
                      ListTile(
                        leading: Icon(Icons.assignment),
                        title: Text(
                          'Bookings',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        hoverColor: Colors.lightBlue,
                        focusColor: Colors.indigo,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Divider(
                        thickness: 5,
                        color: Colors.lightBlue,
                      ),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        hoverColor: Colors.lightBlue,
                        focusColor: Colors.indigo,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Divider(
                        thickness: 5,
                        color: Colors.lightBlue,
                      ),
                      ListTile(
                        leading: Icon(Icons.call),
                        title: Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        hoverColor: Colors.lightBlue,
                        focusColor: Colors.indigo,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Divider(
                        thickness: 5,
                        color: Colors.lightBlue,
                      ),
                      ListTile(
                        leading: Icon(Icons.vpn_key, color: Colors.redAccent),
                        title: Text(
                          'Logout',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                        hoverColor: Colors.lightBlue,
                        focusColor: Colors.indigo,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 230,
                  ),
                  RaisedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => RegisterPage(),
                      //     ));
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child: Text("Emergency"),
                  ),
                ],
              ),
              SizedBox(height: 350),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookAmbulance(),
                            ));
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                      child: Text("Book Ambulance"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    child: RaisedButton(
                      onPressed: () =>
                          MapsLauncher.launchQuery('Nearby Clinics'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                      child: Text("Doctors"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    child: RaisedButton(
                      onPressed: () =>
                          MapsLauncher.launchQuery('Nearby Medical Store'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                      child: Text("Pharmacy"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 100,
                    width: 150,
                    child: RaisedButton(
                      onPressed: () =>
                          MapsLauncher.launchQuery('Nearby Hospitals'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                      child: Text("Hospitals"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
