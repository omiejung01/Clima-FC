import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper (this.url);

  String url = '';

  Future getData() async {
    http.Response response = await
    http.get(Uri.parse(url));

    String body = '';
    if (response.statusCode == 200) {
      body = response.body;
      return jsonDecode(body);

    } else {
      print(response.statusCode);
    }
  }
}