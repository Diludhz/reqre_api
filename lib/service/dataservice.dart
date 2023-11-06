import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reqre_api/model/datamodel.dart';

class DataService {
  var uri = "https://reqres.in/api/unknown";
  Future<DataModel?> getService() async {
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      return DataModel.fromjson(data);
    } else {
      return null;
    }
  }
}
