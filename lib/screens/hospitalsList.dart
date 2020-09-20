import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospitals extends StatefulWidget {
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  Future<String> createget(String url) async {
    return http.get(url).then((http.Response response) async {
      int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return response.body;
    });
  }

  //final List<String> entries = <String>['A', 'B', 'C'];
  // final List<int> colorCodes = <int>[600, 400, 100];

  Future<List> getList() async {
    var data = await createget("https://jsonplaceholder.typicode.com/todos");
    var jsonData = jsonDecode(data);
    return jsonData;
  }

  int tappedIndex;
  Future<bool> refresh() async {
    setState(() {});
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby Hospitals"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
          future: getList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue[200],
          
                    child: ListTile(
                      leading: Icon(
                        Icons.access_time,
                        color: snapshot.data[index]["completed"]
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text(snapshot.data[index]["title"]),
                      subtitle:
                          Text(snapshot.data[index]["completed"].toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () => launch("tel://108"),
                      ),
                      onTap: () =>
                          MapsLauncher.launchQuery('Lilavati Hospital'),
                    ),
                  );
                },
        
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
