import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp();
//   }
// }

class scrollView extends StatefulWidget {
  const scrollView({super.key});

  @override
  State<scrollView> createState() => _scrollView();
}

class _scrollView extends State<scrollView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 85,
                        width: 96,
                        color: Colors.amber,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 200,
                        width: 200,
                        color: Colors.black,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 200,
                        width: 200,
                        color: Colors.blue,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 200,
                        width: 200,
                        color: Colors.brown,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 200,
                        width: 200,
                        color: Colors.deepPurpleAccent,
                      ),
                    ],
                  ),
                ),
              )
            ]))));
  }
}
