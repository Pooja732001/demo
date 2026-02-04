
import 'package:demo/prime_number_check.dart';
import 'package:demo/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenScreenByName extends StatelessWidget {
  const OpenScreenByName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        title: const Text("Demo Screens"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _menuButton(
              title: "Todo App",
              icon: Icons.check_circle_outline,
              gradient: const [Colors.blue, Colors.lightBlueAccent],
              onTap: () => Get.to(const TodoScreen()),
            ),
            const SizedBox(height: 25),
            _menuButton(
              title: "Prime Number Check",
              icon: Icons.calculate_outlined,
              gradient: const [Colors.purple, Colors.deepPurpleAccent],
              onTap: () => Get.to(const PrimeCheckScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton({
    required String title,
    required IconData icon,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 26),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
