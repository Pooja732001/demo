import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetListApi extends StatefulWidget {
  const GetListApi({super.key});

  @override
  State<GetListApi> createState() => _GetListApiState();
}

class _GetListApiState extends State<GetListApi> {
  @override
  
  List<dynamic> postList=[];
  bool isLoader=true;

/*
 Future<dynamic> getListMethod()async{
   try{
     var url=Uri.parse("https://jsonplaceholder.typicode.com/posts");
     var response=await http.get(url);
     if(response.statusCode==200){
       setState(() {
         postList=jsonDecode(response.body);
         isLoader=false;
       });
     }
   }
   catch(e){
     print("List error---->${e.toString()}");
     setState(() {
       isLoader=false;
     });
   }
 }
*/
  Future<void> getListMethod() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      var response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
        },
      );

      print("Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        setState(() {
          postList = jsonDecode(response.body);
        });

      } else {
        print("API blocked or error");
      }
    } catch (e) {
      print("List error ----> $e");
    } finally {
      setState(() {
        isLoader = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getListMethod();
  }
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple API Example")),

      body: isLoader?
      Center(child: CircularProgressIndicator()):postList.isEmpty?
          Center(child: Text("No data found"),):
          ListView.builder(
              itemCount: postList.length,

              itemBuilder: (context,index){
            return ListTile(
              title: Text(postList[index]["title"]),
            );
          })

      ,
    );
  }
}
