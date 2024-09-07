import 'package:flutter/material.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
import 'package:school_for_everyone/Notifiy.dart';
import 'package:school_for_everyone/Profile.dart';
import 'package:school_for_everyone/Results.dart';
import 'package:school_for_everyone/Syllabus.dart';
import 'package:school_for_everyone/attendance_screen.dart';
import 'package:school_for_everyone/loginScreen.dart';
import 'package:school_for_everyone/schedule.dart';
import 'package:school_for_everyone/signUpScreen.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();

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

class S_Home extends StatefulWidget {
  const S_Home({super.key});

  @override
  State<S_Home> createState() => _S_HomeState();
}

class _S_HomeState extends State<S_Home> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const Attendance(),
    const Chat(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue[100],
          backgroundColor: Colors.white,
          labelTextStyle: const MaterialStatePropertyAll(TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Gothic_A1',
          )),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: _selectedIndex,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: _onItemTapped,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_rounded),
              selectedIcon: Icon(
                Icons.home_outlined,
                color: Colors.red,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today),
              selectedIcon: Icon(
                Icons.calendar_today_outlined,
                color: Colors.red,
              ),
              label: 'Attendance',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(
                Icons.chat,
                color: Colors.red,
              ),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(
                Icons.person,
                color: Colors.red,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 26, 22, 43),
      body: _screens[_selectedIndex],
    );
  }
}

// HomeScreen Widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          width: double.infinity,
          color: const Color.fromARGB(255, 26, 22, 43),
          child: Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.tune,
                  color: Colors.white,
                  weight: 3,
                ),
                padding: const EdgeInsets.only(left: 20),
                iconSize: 30.0,
                onPressed: () {},
              ),

              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/notify');
                },
                icon: const Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(left: 360),
                iconSize: 30.0,
              ),
              // Positioned(
              //   right: 11,
              //   top: 11,
              //   child: Container(
              //     padding: const EdgeInsets.all(2),
              //     decoration: BoxDecoration(
              //       color: Colors.red,
              //       borderRadius: BorderRadius.circular(6),
              //     ),
              //     constraints: const BoxConstraints(
              //       minWidth: 12,
              //       minHeight: 12,
              //     ),
              //     child: const Text(
              //       '1',
              //       style: TextStyle(color: Colors.white, fontSize: 8),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color.fromRGBO(194, 216, 227, 0.53),
            ),
            width: double.infinity,
            height: 150,
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Darsh Panchal',
                          style: TextStyle(
                            fontFamily: 'Gothic_A1',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 0.25,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'Class: ',
                              style: TextStyle(
                                fontFamily: 'Gothic_A1',
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.white,
                                letterSpacing: 0.25,
                              ),
                            ),
                            Text(
                              'X-B',
                              style: TextStyle(
                                fontFamily: 'Gothic_A1',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.white,
                                letterSpacing: 0.25,
                              ),
                            ),
                            SizedBox(width: 25),
                            Text(
                              '|',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 25),
                            Text(
                              'Roll no: ',
                              style: TextStyle(
                                fontFamily: 'Gothic_A1',
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.white,
                                letterSpacing: 0.25,
                              ),
                            ),
                            Text(
                              '24',
                              style: TextStyle(
                                fontFamily: 'Gothic_A1',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.white,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Attendance',
                          style: TextStyle(
                            fontFamily: 'Gothic_A1',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.white,
                            letterSpacing: 0.25,
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 10,
                              width: 180,
                              child: LinearProgressIndicator(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                value: 0.822,
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation(Colors.red),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '82.2%',
                              style: TextStyle(
                                fontFamily: 'Gothic_A1',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.white,
                                letterSpacing: 0.25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 36,
                      backgroundImage: AssetImage('assets/images/student.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ClipRRect(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              // height: 200,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                          10,
                        ),
                      ),
                      Text(
                        'Academics',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gothic_A1',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 0.25,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: scrollableIcons(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Today's Classes",
                          style: TextStyle(
                              fontFamily: 'Gothic_A1',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.25),
                        ),
                      ),
                      const SizedBox(
                        width: 170,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/schedule');
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(
                              fontFamily: 'Gothic_A1',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.25),
                        ),
                      ),
                    ],
                  ),
                  const OverlappingContainers(),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Upcoming Events",
                          style: TextStyle(
                              fontFamily: 'Gothic_A1',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.25),
                        ),
                      ),
                      const SizedBox(
                        width: 170,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/schedule');
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(
                              fontFamily: 'Gothic_A1',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.25),
                        ),
                      ),
                    ],
                  ),
                  const OverlappingContainers2(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class scrollableIcons extends StatelessWidget {
  const scrollableIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Attendance');
              },
              child: buildIconContainer(Icons.person_add_alt_1_outlined,
                  'Attendance', const Color.fromRGBO(241, 238, 233, 1)),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/Doubt');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: buildIconContainer(Icons.help_outline, 'Ask Doubt?',
                  const Color.fromRGBO(230, 222, 244, 0.93)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Fees');
              },
              child: buildIconContainer(
                  Icons.attach_money, 'Fees', const Color.fromRGBO(192, 222, 220, 1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Results');
              },
              child: buildIconContainer(
                  Icons.receipt, 'Results', const Color.fromRGBO(194, 216, 227, 1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Syllabus');
              },
              child: buildIconContainer(Icons.auto_stories_rounded, 'Syllabus',
                  const Color.fromRGBO(241, 238, 233, 1)),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 20.0),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, '/calender');
          //     },
          //     child: buildIconContainer(Icons.calendar_today, 'Calendar',
          //       const Color.fromRGBO(221, 213, 234, 1)),
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget buildIconContainer(IconData iconData, String label, Color color) {
  return Container(
    height: 85,
    width: 96,
    // margin: EdgeInsets.only(right: 8.0),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          size: 38.0,
          color: Colors.black,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Gothic_A1',
            letterSpacing: 0.25,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

class OverlappingContainers extends StatelessWidget {
  const OverlappingContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 500,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            left: 75,
            top: 5,
            child: ScheduleCard(
                subject: "Mathematics",
                time: "10:00 to 10:40",
                teacher: "Ankush Raje",
                imageUrl: "assets/images/english.png",
                color_: Color.fromRGBO(192, 222, 220, 1)
                // color: const Color.fromRGBO(192, 222, 220, 1),
                ),
          ),
          Positioned(
            left: 10,
            top: 0,
            right: 100,
            child: ScheduleCard(
                subject: "Mathematics",
                time: "10:00 to 10:40",
                teacher: "Ankush Raje",
                imageUrl:
                    "assets/images/mathematics.png", // Replace with your image path,
                color_: Color.fromRGBO(216, 209, 231, 1)),
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String subject;
  final String time;
  final String teacher;
  final String imageUrl;
  final Color color_;
  const ScheduleCard(
      {super.key, required this.subject,
      required this.time,
      required this.teacher,
      required this.imageUrl,
      required this.color_});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.0,
      child: Container(
        width: 267,
        height: 126,
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
                  const SizedBox(height: 5),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "By – $teacher",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 66,
                height: 66,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverlappingContainers2 extends StatelessWidget {
  const OverlappingContainers2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 133,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            EventCard(
              EventName: 'Technical Fest',
              imageUrl: "assets/images/fest.png",
            ),
            SizedBox(
              width: 10,
            ),
            EventCard(
              EventName: 'Sports Day celebration',
              imageUrl: "assets/images/sports.png",
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String EventName;
  final String imageUrl;

  const EventCard({super.key, 
    required this.EventName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imageUrl,
              width: 268,
              height: 86,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 50,
          bottom: 60,
          left: 20,
          child: Text(
            EventName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
