import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  bool isLoading = false;


List<Map<String, dynamic>>postList=[];
Future<void>postApi() async {
try{
  var url=Uri.parse("https://jsonplaceholder.typicode.com/posts");
  var response=await http.post(url,   headers: {
    "Content-Type": "application/json",
    "Accept": "application/json",},
      body: {
        "title":titleController.text
      });
  if(response.statusCode==200){
    setState(() {

      postList.add(jsonDecode(response.body));
    });
  }

}catch(e){}
finally{
  setState(() {

    isLoading=false;
  });
}

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("POST API Example")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: "Body"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isLoading ? null : postApi,
              child: isLoading
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text("Submit"),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: postList.isEmpty
                  ? const Text("No Post Yet")
                  : ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(postList[index]['title']),
                      subtitle: Text(postList[index]['body']),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
