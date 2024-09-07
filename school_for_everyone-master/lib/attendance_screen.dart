import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
import 'package:school_for_everyone/Notifiy.dart';
import 'package:school_for_everyone/Results.dart';
import 'package:school_for_everyone/Syllabus.dart';
import 'package:school_for_everyone/loginScreen.dart';
import 'package:school_for_everyone/s_Home_Screen.dart';
import 'package:school_for_everyone/schedule.dart';
import 'package:school_for_everyone/signUpScreen.dart';
import 'package:table_calendar/table_calendar.dart';

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

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _Attendance();
}

class _Attendance extends State<Attendance> {
  final List<bool> _selected = [true, false];
  final Map<DateTime, List<String>> _holidays = {
    DateTime(2024, 1, 1): ['New Year\'s Day'],
    DateTime(2024, 12, 25): ['Christmas Day'],
    // Add more holidays here
  };

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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ToggleButtons(
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
                  color: _selected[0]
                      ? const Color(0xFF1A1A3B)
                      : const Color(0xFF5E6572),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Attendance',
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
                  color: _selected[1]
                      ? const Color(0xFF1A1A3B)
                      : const Color(0xFF5E6572),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Calendar',
                  style: TextStyle(
                      fontFamily: 'Gothic_A1',
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: IndexedStack(
              index: _selected.indexOf(true),
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ScheduleCard(
                          subject: "Mathematics",
                          teacher: "Ankush Raje",
                          percent: 0.4,
                          progresscolor: Color.fromARGB(255, 176, 115, 234),
                          attendance: '40%',
                          color_: Color.fromRGBO(216, 209, 231, 1),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ScheduleCard(
                          subject: "English",
                          teacher: "Florence  ",
                          percent: 0.6,
                          attendance: '60%',
                          progresscolor: Color.fromARGB(255, 35, 185, 170),
                          color_: Color.fromRGBO(192, 222, 220, 1),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ScheduleCard(
                          subject: "Science",
                          teacher: "Kabra peston  ",
                          percent: 0.8,
                          attendance: '80%',
                          progresscolor: Color.fromARGB(255, 126, 128, 20),
                          color_: Color.fromRGBO(214, 228, 134, 1),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ScheduleCard(
                          subject: "Hindi",
                          teacher: "Mona Dixit  ",
                          percent: 0.5,
                          attendance: '50%',
                          progresscolor: Color.fromARGB(255, 35, 102, 185),
                          color_: Color.fromRGBO(194, 216, 227, 1),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ScheduleCard(
                          subject: "Computer",
                          teacher: "Manan Gandhi  ",
                          percent: 0.9,
                          attendance: '90%',
                          progresscolor: Color.fromARGB(255, 185, 137, 35),
                          color_: Color.fromARGB(255, 222, 210, 192),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    TableCalendar(
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(2000, 1, 1),
                      lastDay: DateTime.utc(2050, 12, 31),
                      calendarBuilders: CalendarBuilders(
                        holidayBuilder: (context, date, _) {
                          return Center(
                            child: Text(
                              date.day.toString(),
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        },
                      ),
                      holidayPredicate: (day) {
                        return _holidays.containsKey(day);
                      },
                      calendarStyle: const CalendarStyle(
                        holidayTextStyle: TextStyle(color: Colors.red),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: _holidays.entries.map((entry) {
                          return ListTile(
                            title: Text('${entry.key.toLocal()}'.split(' ')[0]),
                            subtitle: Text(entry.value.join(', ')),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
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
  final double percent;
  final String attendance;
  final Color color_;
  final Color progresscolor;
  const ScheduleCard({
    super.key,
    required this.subject,
    required this.teacher,
    required this.percent,
    required this.attendance,
    required this.color_,
    required this.progresscolor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      child: Container(
        width: 305,
        height: 100,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularPercentIndicator(
                radius: 30,
                lineWidth: 10,
                percent: percent,
                progressColor: progresscolor,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(
                  attendance,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class DaySchedule extends StatelessWidget {
//   final String day;
//   final List<ScheduleCard> scheduleItems;

//   DaySchedule({required this.day, required this.scheduleItems});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: EdgeInsets.all(16),
//           child: Text(
//             day,
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ),
//         ...scheduleItems.map((item) => item).toList(),
//       ],
//     );
//   }
// }
