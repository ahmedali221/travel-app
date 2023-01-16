import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel/models/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    String dataurl = "/getplaces";

    http.Response res = await http.get(Uri.parse(baseUrl + dataurl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = jsonDecode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
