import 'dart:convert';
import 'dart:io';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:nasa/data/picturesModel.dart';
import 'package:path_provider/path_provider.dart';

class ImagesService {
  final String apiKey = 'lgi7BPrRzDXm6VBAz3cQPou3dw3kuxKbQm2Uk2sJ';
  final String baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String startDate = '2021-12-30';
  final String endDate = '2022-01-06';

  //we did not use try/catch here
  // because we used it inside the images cubit where we called the functions

  Future<List<Images>> getImages() async {
    final queryUri = Uri.parse(
        '$baseUrl?api_key=$apiKey&start_date=$startDate&end_date=$endDate');

    String fileName='nasa.json';
    var dir= await getTemporaryDirectory();
    File file=File(dir.path+"/"+fileName);

    List<Images> images = [];

      final http.Response res = await http.get(queryUri);

     if(res.statusCode==200){
       final data = json.decode(res.body);
       data.forEach((element) {
         images.add(Images.fromJson(element));
       });

       //save json response into local cached file
       //if the file already exist it will override
       //to display the most recent data offline
      file.writeAsStringSync(res.body);
       return images;

     }
     return images;
  }

 Future<List<Images>> getCachedImages()async{
   String fileName='nasa.json';
   var dir= await getTemporaryDirectory();
   File file=File(dir.path+"/"+fileName);

   List<Images> images = [];

   //if there is a file with cached data we will retrieve it and display it offline
if(file.existsSync()){
  final res=  file.readAsStringSync();
  final data = json.decode(res);
  data.forEach((element) {
    images.add(Images.fromJson(element));
  });
}
   return images;
 }


}
