//import 'dart:html';
import 'package:http/http.dart' as http;

void main() {

  //querySelector('#RipVanWinkle').text = 'Wake up, sleepy head!';
  var url = 'http://127.0.0.1:8080';
  http.get(url).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  });
}