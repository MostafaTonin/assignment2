// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// void main() {
//   runApp(const MyApp());
// }

// // ====== Widget رئيسي ======
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Basics Review',
//       //home: const HomeScreen(),
//       home: Scaffold(
//         appBar: AppBar(),
//       ),
//     );
//   }
// }

// // ====== Stateful Widget ======
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int counter = 0;

//   void increment() {
//     setState(() {
//       counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flutter Basics"),
//         centerTitle: true,
        
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Counter Value",
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               "$counter",
//               style: const TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: increment,
//               child: const Text("Increment"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
