import "package:lite_rolling_switch/lite_rolling_switch.dart";
import 'package:flutter/material.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
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

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notification();
}

class _notification extends State<notification> {
  // List<bool> _selected = [true, false];
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
          'NOTIFICATIONS',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Gothic_A1',
              fontWeight: FontWeight.w600,
              fontSize: 17),
        ),

        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 190.0),
          child: Column(
            children: [
              toggleReadUnread(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Flexible(
            child: IndexedStack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          String notifyName = '';
                          String date = '';
                          switch (index) {
                            case 0:
                              notifyName = 'Upcoming week test';
                              date = "10/04";
                              break;
                            case 1:
                              notifyName = 'Tour Arrangement';
                              date = "13/04";
                              break;
                            case 2:
                              notifyName = 'Sports day Celebration';
                              date = "13/04";
                              break;
                          }
                          return Listview(
                            notifyName: notifyName,
                            date: date,
                          );
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

class Listview extends StatelessWidget {
  final String notifyName;
  final String date;
  const Listview({
    super.key,
    required this.date,
    required this.notifyName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListTile(
        trailing: Text(date),
        leading: Text(
          notifyName,
          style: const TextStyle(
              fontFamily: 'Gothic_A1',
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ),
    );
  }
}

class toggleReadUnread extends StatefulWidget {
  const toggleReadUnread({super.key});

  @override
  State<toggleReadUnread> createState() => _toggleReadUnreadState();
}

class _toggleReadUnreadState extends State<toggleReadUnread> {
  late Color newColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LiteRollingSwitch(
        iconOn: Icons.mark_unread_chat_alt,
        iconOff: Icons.remove_done_sharp,
        colorOn: Colors.green,
        colorOff: Colors.red,
        textSize: 15,
        onChanged: (bool state) {
          if (state) {
            print('Open');
          } else {
            print('Closed');
          }
        },
        animationDuration: const Duration(milliseconds: 1600),
        textOn: 'Read',
        textOff: 'Unread',
        onSwipe: () {
          setState(() {
            newColor = Colors.red;
          });
        },
        onTap: () {
          setState(() {
            newColor = Colors.green;
          });
        },
        onDoubleTap: () {
          setState(() {
            newColor = Colors.blue;
          });
        },
      ),
    );
  }
}
