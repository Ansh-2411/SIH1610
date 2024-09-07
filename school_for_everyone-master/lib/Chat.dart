import 'package:flutter/material.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
import 'package:school_for_everyone/Notifiy.dart';
import 'package:school_for_everyone/Results.dart';
import 'package:school_for_everyone/Syllabus.dart';
import 'package:school_for_everyone/attendance_screen.dart';
import 'package:school_for_everyone/loginScreen.dart';
import 'package:school_for_everyone/s_Home_Screen.dart';
import 'package:school_for_everyone/schedule.dart';

import 'signUpScreen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const S_Home(),
//       routes: {
//         '/forgot': (context) => const ForgotPass(),
//         '/SignUp': (context) => const MySignUpScreen(),
//         '/login': (context) => const MyLoginScreen(),
//         '/backLogin': (context) => const MyLoginScreen(),
//         '/Attendance': (context) => const Attendance(),
//         '/Doubt': (context) => const Chat(),
//         '/backhome': (context) => const S_Home(),
//         '/Fees': (context) => const Fees(),
//         '/Results': (context) => const Results(),
//         '/Syllabus': (context) => const syllabus(),
//         '/schedule': (context) => const schedule(),
//         '/notify': (context) => const notification()
//       },
//     );
//   }
// }

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _Chat();
}

class _Chat extends State<Chat> {
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
            Navigator.pushNamed(context, '/backhome');
          },
        ),
        title: const Text(
          'DOUBT',
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Select subject having doubt',
              style: TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontWeight: FontWeight.w600,
                  fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Expanded(
              child: SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: gridview(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(192, 222, 220, 1),
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text(
                      'Call',
                      style: TextStyle(
                        fontFamily: 'Gothic_A1',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                    ),
                    Icon(
                      Icons.call,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(192, 222, 220, 1),
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text(
                      'Register Lost or Damage',
                      style: TextStyle(
                        fontFamily: 'Gothic_A1',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String subject;
  final String teacher;
  final Color color_;
  const ScheduleCard({super.key, 
    required this.subject,
    required this.teacher,
    required this.color_,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.0,
      child: Container(
        width: 152,
        height: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color_,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Gothic_A1',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "By – $teacher",
                    style: const TextStyle(
                      fontFamily: 'Gothic_A1',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class gridview extends StatelessWidget {
  var grid = [
    const ScheduleCard(
        subject: 'Mathematics',
        teacher: 'Ankush Raje',
        color_: Color.fromRGBO(216, 209, 231, 1)),
    const ScheduleCard(
        subject: 'Science',
        teacher: 'Peston kabrajee',
        color_: Color.fromRGBO(192, 222, 220, 1)),
    const ScheduleCard(
        subject: 'English',
        teacher: 'Florence',
        color_: Color.fromRGBO(213, 228, 134, 1)),
    const ScheduleCard(
        subject: 'Social Science',
        teacher: 'Jasprit singh',
        color_: Color.fromRGBO(194, 216, 227, 1)),
    const ScheduleCard(
        subject: 'Gujarati',
        teacher: 'Natwarlal patel',
        color_: Color.fromRGBO(241, 238, 233, 1)),
    const ScheduleCard(
        subject: 'Hindi',
        teacher: 'Mona Dixit',
        color_: Color.fromRGBO(230, 201, 235, 1)),
    const ScheduleCard(
        subject: 'Sanskrit',
        teacher: 'Rajendra patel',
        color_: Color.fromRGBO(209, 231, 227, 1)),
    const ScheduleCard(
        subject: 'Computer',
        teacher: 'Manan Gandhi',
        color_: Color.fromRGBO(216, 209, 231, 1))
  ];

  gridview({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: grid.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
      ),
      itemBuilder: (context, index) {
        return grid[index];
      },
    );
  }
}
