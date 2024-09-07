import 'package:flutter/material.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
import 'package:school_for_everyone/Notifiy.dart';
import 'package:school_for_everyone/Results.dart';
import 'package:school_for_everyone/Syllabus.dart';
import 'package:school_for_everyone/loginScreen.dart';
import 'package:school_for_everyone/schedule.dart';
import 'package:school_for_everyone/signUpScreen.dart';
import 'package:school_for_everyone/t_attendance.dart';
import 'package:school_for_everyone/t_home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/forgot': (context) => const ForgotPass(),
//         '/SignUp': (context) => const MySignUpScreen(),
//         '/login': (context) => const MyLoginScreen(),
//         '/backLogin': (context) => const MyLoginScreen(),
//         '/Doubt': (context) => const Chat(),
//         '/Fees': (context) => const Fees(),
//         '/Results': (context) => const Results(),
//         '/Syllabus': (context) => const syllabus(),
//         '/schedule': (context) => const schedule(),
//         '/notify': (context) => const notification(),
//         '/attendance': (context) => const t_Attendance(),

//       },
//     );
//   }
// }

class mark_attendance extends StatefulWidget {
  const mark_attendance({super.key});

  @override
  State<mark_attendance> createState() => _mark_attendance();
}

class _mark_attendance extends State<mark_attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the background color to white
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            weight: 3,
          ),
          iconSize: 30.0,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const t_home()));
          },
        ),

        title: const Text(
          'ATTENDANCE',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Gothic_A1',
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.black, // Set the icon color to black
                ),
                iconSize: 30.0,
              ),
            ],
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mark all present',
                  style: TextStyle(
                      fontFamily: 'Gothic_A1',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                customRadio(),
              ],
            ),
            SizedBox(height: 20),
            // Expanded(child: student_list()),
          ],
        ),
      ),
    );
  }
}

class customRadio extends StatefulWidget {
  const customRadio({super.key});

  @override
  State<customRadio> createState() => _customRadio();
}

class _customRadio extends State<customRadio> {
  bool _isElevated = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isElevated = !_isElevated;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
          boxShadow: _isElevated
              ? [
                  BoxShadow(
                      color: Colors.grey[500]!,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1),
                ]
              : null,
        ),
        child: Center(
          child: Icon(
            Icons.task_alt_sharp,
            color: _isElevated ? Colors.green : Colors.grey[300],
            weight: 3,
          ),
        ),
      ),
    );
  }
}
