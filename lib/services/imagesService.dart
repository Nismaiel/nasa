import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa/data/picturesModel.dart';

class ImagesService {
  final String apiKey = 'lgi7BPrRzDXm6VBAz3cQPou3dw3kuxKbQm2Uk2sJ';

  final String baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String startDate = '2021-12-30';
  final String endDate = '2022-01-06';

  Future <List<Images>> getImages() async {
    List<Images> images = [];
    final queryUri = Uri.parse(
        '$baseUrl?api_key=$apiKey&start_date=$startDate&end_date=$endDate');
    try {
      final http.Response res = await http.get(queryUri);
      final data = json.decode(res.body);


      data.forEach((element) {images.add(Images.fromJson(element));});
      return images;
    } catch (e) {
      debugPrint(e.toString());
      return<Images>[];
    }
  }
}
