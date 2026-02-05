import 'dart:convert';
import 'package:demo/single_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  /*Future<dynamic>getSingleCodeWithModel() async{
  try{
    var url=Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    var response=await http.get(url);
    if(response.statusCode==200|| response.statusCode==201){

final body= response.body;
final data =jsonDecode(body);
return data;

    }
  }
  catch(e){
    print(e.toString());
  }

}*/

  /*Future<dynamic> getSingleCodeWithModel() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 2001) {
        final data = jsonEncode(response.body);
        return data;
      }
    } catch (e) {
      print("Error--->${e.toString()}");
    }
  }*/
  
  Future<dynamic>getSingleCodeWithModel() async {
    try{
      var url=Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response=await http.get(url);
      if(response.statusCode==200|| response.statusCode==201){
        final data=jsonEncode(response.body);
        return data;
      }
    }
    catch(e){
      print("error----->${e.toString()}");
    }
  }
  
  
  
}

