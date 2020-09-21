import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ambulance/screens/hospitalsList.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';

class BookAmbulance extends StatefulWidget {
  @override
  _BookAmbulanceState createState() => _BookAmbulanceState();
}

class Item {
  const Item(this.name);
  final String name;
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

class _BookAmbulanceState extends State<BookAmbulance> {
  var dueDate = TextEditingController(text: "");
  int dueDateTimestamp;
  final dateFormat = DateFormat('dd-MM-yyyy hh:mm a');
  TextEditingController pickController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  Item selectedtype;
  List<Item> types = <Item>[
    const Item("Emergency"),
    const Item("Discharge"),
    const Item("Non - Emergency"),
    const Item("Deadbody Pickup"),
  ];
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
    print(' ${first.addressLine}');
    pickController.text = first.addressLine;
    return first;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Ambulance"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("PICK UP LOCATION",
                      style: TextStyle(
                        fontSize: 15,
                      )),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 25,
                  ),
                  InkWell(
                    child: Row(children: [
                      Icon(
                        Icons.my_location,
                        color: Colors.red,
                      ),
                      Text("Locate Me",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ]),
                    onTap: () {
                      getUserLocation();
                    },
                  ),
                ],
              ),
              TextField(
                controller: pickController,
                autocorrect: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.red,
                )),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              Image.asset(
                'assets/images/path.png',
                height: 30,
                width: 30,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              Text("DROP LOCATION",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              TextField(
                controller: dropController,
                autocorrect: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.red,
                )),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
              Text("SELECT REQUEST TYPE",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                  width: SizeConfig.safeBlockHorizontal * 100,
                  height: 60,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Item>(
                      isExpanded: true,
                      hint: Text("Select Request Type"),
                      value: selectedtype,
                      // ignore: non_constant_identifier_names
                      onChanged: (Item Value) {
                        setState(() {
                          selectedtype = Value;
                        });
                      },
                      items: types.map((Item type) {
                        return DropdownMenuItem<Item>(
                          value: type,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                type.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
              Text("SELECT DATE AND TIME",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
              DateTimeField(
                controller: dueDate,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //errorText: bdErr ? "Please Choose Birth Date" : null,
                  labelText: 'Select Date and Time',
                ),
                format: dateFormat,
                onShowPicker: (context, currentValue) {
                  return DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    currentTime: DateTime.now(),
                    onConfirm: (time) {
                      var timestamp = time.millisecondsSinceEpoch;
                      dueDateTimestamp = (timestamp / 1000).round();
                    },
                    theme: DatePickerTheme(
                      itemStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      doneStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
                onChanged: (value) {},
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Hospitals(),
                        ));
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  //padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                  child: Text("BOOK"),
                ),
              ),
            ],
          )),
    );
  }
}
