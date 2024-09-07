import 'package:flutter/material.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
import 'package:school_for_everyone/Notifiy.dart';
import 'package:school_for_everyone/Syllabus.dart';
import 'package:school_for_everyone/attendance_screen.dart';
import 'package:school_for_everyone/loginScreen.dart';
import 'package:school_for_everyone/s_Home_Screen.dart';
import 'package:school_for_everyone/schedule.dart';
import 'package:school_for_everyone/signUpScreen.dart';

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
//         'Results': (context) => const Results(),
//         '/Syllabus': (context) => const syllabus(),
//         '/schedule': (context) => const schedule(),
//         '/notify': (context) => const notification()
//       },
//     );
//   }
// }

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          'RESULTS',
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
                  color: Colors.black,
                ),
                iconSize: 30.0,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: 4,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                String resultName = '';
                Icon icon = const Icon(Icons.file_download_outlined);
                Color color_ = Colors.transparent;
                List<Widget> cards = [];

                switch (index) {
                  case 0:
                    resultName = 'Weekly Test Results';
                    color_ = const Color.fromARGB(255, 162, 196, 225);
                    cards = [
                      const OverlappingContainers(),
                    ];
                    break;
                  case 1:
                    resultName = 'Mid Semester Results';
                    color_ = const Color.fromARGB(255, 162, 196, 225);
                    cards = [
                      const OverlappingContainers(),
                    ];
                    break;
                  case 2:
                    resultName = 'End Semester Results';
                    color_ = const Color.fromARGB(255, 162, 196, 225);
                    cards = [
                      const DropdownContainer(),
                    ];
                    break;
                  case 3:
                    resultName = 'Practical Result';
                    color_ = const Color.fromARGB(255, 162, 196, 225);
                    cards = [
                      const OverlappingContainers(),
                    ];
                    break;
                }

                return ResultCard(
                  resultName: resultName,
                  color_: color_,
                  icon: icon,
                  cards: cards,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OverlappingContainers extends StatelessWidget {
  const OverlappingContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 5,
            right: 100,
            child: ScheduleCard(
              subject: "Mathematics",
              date: DateTime(2024, 12, 30),
              marks: 12,
              marks_from: 20,
              color_: const Color.fromRGBO(192, 222, 220, 1),
            ),
          ),
          Positioned(
            left: 10,
            top: 0,
            right: 100,
            child: ScheduleCard(
              subject: "English",
              date: DateTime(2024, 12, 29),
              marks: 14,
              marks_from: 20,
              color_: const Color.fromRGBO(216, 209, 231, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String subject;
  final int marks;
  final int marks_from;
  final DateTime date;
  final Color color_;
  const ScheduleCard({super.key, 
    required this.subject,
    required this.marks,
    required this.marks_from,
    required this.date,
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
        width: 236,
        height: 100,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color_,
          borderRadius: BorderRadius.circular(10.0),
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
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "$marks / $marks_from",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 150,
                        ),
                      ),
                      Text(
                        "${date.day}/${date.month}/${date.year}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
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

class ResultCard extends StatelessWidget {
  final String resultName;
  final Icon icon;
  final Color color_;
  final List<Widget> cards;

  const ResultCard({
    super.key,
    required this.icon,
    required this.resultName,
    required this.color_,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          child: ListTile(
            trailing: icon,
            leading: Text(
              resultName,
              style: const TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
        Column(
          children: cards,
        )
      ],
    );
  }
}

class DropdownContainer extends StatefulWidget {
  const DropdownContainer({super.key});

  @override
  State<DropdownContainer> createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  String? selectedStandard;
  final List<String> Standards = ['1', '2', '3', '4'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: DropdownButtonFormField<String>(
        hint: const Text('Select Standard'),
        borderRadius: BorderRadius.circular(12),
        elevation: 8,
        value: selectedStandard,
        isExpanded: true,
        items: Standards.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            selectedStandard = newValue!;
          });
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black, // Set the border color here
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black, // Set the border color here
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black, // Set the border color here
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
