
import 'package:demo/prime_number_check.dart';
import 'package:demo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SingleApiScreen.dart';
import 'get_list_api.dart';

class ApiScreens extends StatelessWidget {
  const ApiScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        title: const Text("Demo Api"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _menuButton(
              gradient: const [Colors.blue, Colors.purple],
              onTap: () => Get.to(const SingleApiScreen()), title: 'Api single',
            ),
            const SizedBox(height: 25),
            _menuButton(
              title: "Api List",
              gradient: const [Colors.purple, Colors.deepPurpleAccent],
              onTap: () => Get.to(const GetListApi()),
            ),
            const SizedBox(height: 25),
            _menuButton(
              title: "Api Check",
              gradient: const [Colors.purple, Colors.blue],
              onTap: () => Get.to(const SingleApiScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton({
    required String title,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: Get.width * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Center(child:    Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),)
      ),
    );
  }
}
