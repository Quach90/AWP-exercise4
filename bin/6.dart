import 'dart:html';

void main() {

  //querySelector('#RipVanWinkle').text = 'Wake up, sleepy head!';
  var url = 'http://127.0.0.1:8085';
  var response = [];
  HttpRequest.getString(url).then(
          (result) => response =  print('Request complete: $result'));
}