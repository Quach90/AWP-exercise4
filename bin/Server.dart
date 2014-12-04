library simple_http_server;

import 'dart:io';
import 'dart:convert';
//import 'package:http_server/http_server.dart' show VirtualDirectory;

void main() {
  final MY_HTTP_ROOT_PATH = Platform.script.resolve('Images').toFilePath();
  print(MY_HTTP_ROOT_PATH);
  //final virDir = new VirtualDirectory(MY_HTTP_ROOT_PATH)
    //..allowDirectoryListing = true;

  final dir = new Directory(MY_HTTP_ROOT_PATH);
  var superMap = new List();
  void addToTest(element){
    var test = new Map();
      test["path:"] = element.path;
    superMap.add(test);
  }


  var contents = dir.listSync(recursive: true, followLinks: false).forEach(addToTest);



  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8085).then((server) {
    server.listen((HttpRequest request) {

      request.response..headers.contentType = new ContentType("application/json", "plain", charset: "utf-8")
        ..headers.add("Access-Control-Allow-Origin", "*, ")
        ..write(JSON.encode(superMap))
        ..close();

      //virDir.serveRequest(request);
    });
  });
}