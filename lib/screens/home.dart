import 'package:ambulance/screens/initial.dart';
import 'package:ambulance/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:ambulance/screens/bookambulance.dart';
import 'package:ambulance/screens/emergency.dart';
import 'package:ambulance/screens/about.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoder/geocoder.dart';
import 'package:geolocation/geolocation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

class _HomePageState extends State<HomePage> {
  TextEditingController locController = TextEditingController();
  getUserLocation() async {
    //call this async method from whereever you need

    loc.LocationData myLocation;
    String error;
    loc.Location location = new loc.Location();
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
    print('${first.locality}, ${first.adminArea}, ');
    locController.text =
        first.locality + "," + first.adminArea + "," + first.countryName;
    return first;
  }

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  MapController controller = new MapController();

  getPermission() async {
    final GeolocationResult result =
        await Geolocation.requestLocationPermission(
            permission: const LocationPermission(
                android: LocationPermissionAndroid.fine,
                ios: LocationPermissionIOS.always));
    return result;
  }

  getLocation() {
    return getPermission().then((result) async {
      if (result.isSuccessful) {
        final coords =
            await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
      }
    });
  }

  buildMap() {
    getLocation().then((response) {
      if (response.isSuccessful) {
        response.listen((value) {
          controller.move(
              new LatLng(value.location.latitude, value.location.longitude),
              15.0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                        width: 130.0,
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
                            TextField(
                              controller: locController,
                              autocorrect: true,
                              maxLines: 3,
                              enabled: false,
                              decoration: null,
                            ),
                            // Text("${first.addressLine})",
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
                            fontSize: 18,
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
                            fontSize: 18,
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
                            fontSize: 18,
                          ),
                        ),
                        hoverColor: Colors.lightBlue,
                        focusColor: Colors.indigo,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUs(),
                              ));
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
                            fontSize: 18,
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
                          style: TextStyle(fontSize: 18, color: Colors.red),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Flex(direction: Axis.vertical, children: [
              Stack(children: [
                Container(
                  height: 800,
                  child: FlutterMap(
                    mapController: controller,
                    options: new MapOptions(center: buildMap(), minZoom: 5.0),
                    layers: [
                      TileLayerOptions(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'])
                    ],
                  ),
                ),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 65,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Emergency(),
                                ));
                          },
                          color: Colors.red,
                          textColor: Colors.white,
                          //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                          child: Text("Emergency"),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 45),
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 10,
                        ),
                        Container(
                          height: SizeConfig.safeBlockVertical *
                              15, //10 for example
                          width: SizeConfig.safeBlockHorizontal * 35,
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
                          width: SizeConfig.safeBlockHorizontal * 10,
                        ),
                        Container(
                          height: SizeConfig.safeBlockVertical *
                              15, //10 for example
                          width: SizeConfig.safeBlockHorizontal * 35,
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
                      height: SizeConfig.safeBlockVertical * 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 10,
                        ),
                        Container(
                          height: SizeConfig.safeBlockVertical *
                              15, //10 for example
                          width: SizeConfig.safeBlockHorizontal * 35,
                          child: RaisedButton(
                            onPressed: () => MapsLauncher.launchQuery(
                                'Nearby Medical Store'),
                            color: Colors.blue,
                            textColor: Colors.white,
                            //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                            child: Text("Pharmacy"),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 10,
                        ),
                        Container(
                          height: SizeConfig.safeBlockVertical *
                              15, //10 for example
                          width: SizeConfig.safeBlockHorizontal * 35,
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
              ])
            ]),
          ),
        ));
  }
}
