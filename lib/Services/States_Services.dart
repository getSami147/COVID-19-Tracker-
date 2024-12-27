import 'dart:convert';

import 'package:covid19/Models/WolrdStatesModel.dart';
import 'package:covid19/Services/Utilities/App_Url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> FitchWorldStatesRecord() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListAPi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());

      return data;
    } else {
      throw Exception('Error');
    }
  }
}
