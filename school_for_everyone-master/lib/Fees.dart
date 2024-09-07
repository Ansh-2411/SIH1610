import 'package:flutter/material.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
import 'package:school_for_everyone/Notifiy.dart';
import 'package:school_for_everyone/Results.dart';
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
//         '/Results': (context) => const Results(),
//         '/Syllabus': (context) => const syllabus(),
//         '/schedule': (context) => const schedule(),
//         '/notify': (context) => const notification()
//       },
//     );
//   }
// }

class Fees extends StatefulWidget {
  const Fees({super.key});

  @override
  State<Fees> createState() => _Fees();
}

class _Fees extends State<Fees> {
  final List<bool> _selected = [true, false];
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
          'FEES',
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
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 50, right: 50),
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(8),
            borderColor: Colors.transparent,
            fillColor: const Color(0xFF1A1A3B),
            selectedColor: Colors.white,
            selectedBorderColor: Colors.black,
            color: Colors.white,
            constraints: const BoxConstraints(
              minHeight: 44.0,
              minWidth: 150.0,
            ),
            isSelected: _selected,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selected.length; i++) {
                  _selected[i] = i == index;
                }
              });
            },
            children: [
              Container(
                height: 44,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _selected[0] ? const Color(0xFF1A1A3B) : const Color(0xFF5E6572),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Pay',
                  style: TextStyle(
                      fontFamily: 'Gothic_A1',
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
              ),
              Container(
                height: 44,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: _selected[1] ? const Color(0xFF1A1A3B) : const Color(0xFF5E6572),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Receipt',
                  style: TextStyle(
                      fontFamily: 'Gothic_A1',
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Flexible(
            child: IndexedStack(
              index: _selected.indexOf(true),
              children: [
                Center(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          ScheduleCard(
                            Title: "Semester Fee",
                            Amount: 12000,
                            color_: const Color.fromRGBO(194, 216, 227, 1),
                            due: DateTime(2024, 4, 30),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ScheduleCard(
                              Title: "Tour Fee",
                              Amount: 2000,
                              due: DateTime(2024, 4, 30),
                              color_: const Color.fromARGB(255, 222, 210, 192)),
                        ],
                      )),
                ),
                Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: 4,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          String receiptName = '';
                          Color color_ = Colors.transparent;
                          switch (index) {
                            case 0:
                              receiptName = 'Semester Fees phase-1';
                              color_ = const Color.fromARGB(255, 162, 196, 225);
                              break;
                            case 1:
                              receiptName = 'Semester Fees Phase-II';
                              color_ = const Color.fromARGB(255, 162, 196, 225);
                              break;
                            case 2:
                              receiptName = 'library Fees ';
                              color_ = const Color.fromARGB(255, 162, 196, 225);
                              break;
                            case 3:
                              receiptName = 'Lost/New ID card';
                              color_ = const Color.fromARGB(255, 162, 196, 225);
                          }
                          return Listview(
                              receiptName: receiptName, color_: color_);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String Title;
  final int Amount;
  final DateTime due;
  final Color color_;
  const ScheduleCard({super.key, 
    required this.Title,
    required this.Amount,
    required this.due,
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
        width: 309,
        height: 110,
        padding: const EdgeInsets.all(8.0),
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
                    Title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Gothic_A1',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Amount: $Amount",
                    style: const TextStyle(
                      fontFamily: 'Gothic_A1',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Due: ${due.day}/${due.month}/${due.year}",
                    style: const TextStyle(
                      fontFamily: 'Gothic_A1',
                      fontSize: 11,
                      fontWeight: FontWeight.w200,
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

class Listview extends StatelessWidget {
  final String receiptName;
  final Color color_;
  const Listview({
    super.key,
    required this.receiptName,
    required this.color_,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListTile(
        trailing: const Icon(Icons.file_download_outlined),
        leading: Text(
          receiptName,
          style: const TextStyle(
              fontFamily: 'Gothic_A1',
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ),
    );
  }
}
