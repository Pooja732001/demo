import 'package:flutter/material.dart';

class PrimeCheckScreen extends StatefulWidget {
  const PrimeCheckScreen({super.key});

  @override

  State<PrimeCheckScreen> createState() => _PrimeCheckScreenState();
}

class _PrimeCheckScreenState extends State<PrimeCheckScreen> {
  TextEditingController numberController = TextEditingController();


  bool? isPrime;
  bool showResult = false;

  void checkPrime() {
    int n = int.tryParse(numberController.text) ?? 0;
    bool prime = true;
    if (n <= 1) {
      prime = false;
    } else {
      for (int i = 2; i <= n ~/ 2; i++) {
        if (n % i == 0) {
          prime = false;
          break;
        }
      }
    }

    setState(() {
      isPrime = prime;
      showResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prime Number Checker")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter a number",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: checkPrime,
              child: const Text("Submit"),
            ),

            const SizedBox(height: 30),


            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              height: showResult ? 100 : 0,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: showResult
                    ? (isPrime == true ? Colors.green : Colors.red)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: showResult
                  ? Text(
                isPrime == true
                    ? "✅ Prime Number"
                    : "❌ Not a Prime Number",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
