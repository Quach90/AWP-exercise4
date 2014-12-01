library simple_http_server;

import 'dart:io';
//import 'package:http_server/http_server.dart' show VirtualDirectory;

void main() {
  final MY_HTTP_ROOT_PATH = Platform.script.resolve('Images').toFilePath();
  print(MY_HTTP_ROOT_PATH);
  //final virDir = new VirtualDirectory(MY_HTTP_ROOT_PATH)
    //..allowDirectoryListing = true;

  final dir = new Directory(MY_HTTP_ROOT_PATH);
  String test = "";
  void addToTest(element){
    test += element.path;
  }


  var contents = dir.listSync(recursive: true, followLinks: false).forEach(addToTest);



  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8080).then((server) {
    server.listen((HttpRequest request) {

      request.response..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
        ..write(test)
        ..close();

      //virDir.serveRequest(request);
    });
  });
}