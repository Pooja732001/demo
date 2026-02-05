import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleApiScreen extends StatefulWidget {
  const SingleApiScreen({super.key});

  @override
  State<SingleApiScreen> createState() => _SingleApiScreenState();
}

class _SingleApiScreenState extends State<SingleApiScreen> {


  bool isLoading=true;
  var singlePost;
  
  getSingleMethod() async {
    try{
      
      var url=Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      var response=await http.get(url);
      if(response.statusCode==200){
        setState(() {
          singlePost=jsonDecode(response.body);
          isLoading=false;
        });
      }
    }
    
    
    catch(e){print("Error------>${e.toString()}");
      setState(() {
        isLoading=false;

      });
    }
  }
  
  @override
  void initState() {
    getSingleMethod();

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple API Example")),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : singlePost == null
            ? const Text("No Data Found")
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("UserId: ${singlePost['userId']}"),
            Text("Title: ${singlePost['title']}"),
          ],
        ),
      ),
    );
  }
}
