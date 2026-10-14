import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 00',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 3),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(104, 105, 11, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'A  Simple text',
                  style: TextStyle(color: Colors.white, fontSize: 36),
                ),
              ),
              SizedBox(height: 6),
              ElevatedButton(
                onPressed: () {
                  debugPrint('Button pressed');
                },
                child: Text(
                  'Click me',
                  style: TextStyle(
                    color: Color.fromRGBO(104, 105, 11, 1),
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
