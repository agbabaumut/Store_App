import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:store_app/models/products_model.dart';

class APIHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
    const String url = "https://api.escuelajs.co/api/v1/products";
    var response = await http.get(Uri.parse(url));

    var data = jsonDecode(response.body);
    List templist = [];
    for (var v in data) {
      //print(data);
      // print("V is ${v["title"]}");
      templist.add(v);
    }

    return ProductsModel.productFromSnapshot(templist);
  }
}
