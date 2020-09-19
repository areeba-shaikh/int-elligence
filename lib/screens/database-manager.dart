import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'User.dart';
class DBManager {
  DBManager._();

  static final DBManager db = DBManager._();


  Future getData() async{
    var url = 'https://int-elligence.000webhostapp.com/get.php';
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data.toString());
  }
  Future<dynamic> registerUser(User u ) async {
    print("Registering user");
    var responseJson;
    try {
      final response =  await http.post("https://int-elligence.000webhostapp.com/insertdata.php",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "name": u.name,
            "email": u.email,
            "mobile": u.mobile,
            "password":u.password,
            "gender":u.gender,
            "bloodGroup":u.bloodGroup,
            "age":u.age
          }
          ));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> loginUser(User u ) async {
    print("Calling register user");
    var responseJson;
    try {
      final response =  await http.post("https://int-elligence.000webhostapp.com/login.php",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            
            "email": u.email,
           
            "password":u.password
           
          }
          ));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print("==================Statuscode");
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        return response.body.toString();
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException( 'Error occured while Communication with Server with StatusCode :${response.statusCode}');
        }
        }
}
class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}