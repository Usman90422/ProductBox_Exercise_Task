import 'dart:convert';
import 'package:http/http.dart'as http;

class ImageController{

  List? data;

  Future getImages()async{
    var url = Uri.parse('https://picsum.photos/v2/list?page=2&limit=100');
    var response = await http.get(url);
    data = json.decode(response.body);
    return data!;
  }


}