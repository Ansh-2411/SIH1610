import 'package:flutter/material.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
import 'package:school_for_everyone/Notifiy.dart';
import 'package:school_for_everyone/Results.dart';
import 'package:school_for_everyone/Syllabus.dart';
import 'package:school_for_everyone/attendance_screen.dart';
import 'package:school_for_everyone/loginScreen.dart';
import 'package:school_for_everyone/s_Home_Screen.dart';
import 'package:school_for_everyone/signUpScreen.dart';
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
//       theme: ThemeData(),
//       home: const S_Home(),
//       routes: {
//         '/forgot': (context) => const ForgotPass(),
//         '/SignUp': (context) => const MySignUpScreen(),
//         '/login': (context) => const MyLoginScreen(),
//         '/backLogin': (context) => const MyLoginScreen(),
//         '/Attendance': (context) => const Attendance(),
//         '/Doubt': (context) => const Chat(),
//         '/backhome': (context) => const t_home(),
//         '/Fees': (context) => const Fees(),
//         '/Results': (context) => const Results(),
//         '/Syllabus': (context) => const syllabus(),
//         '/schedule': (context) => const schedule(),
//         '/notify': (context) => const notification()
//       },
//     );
//   }
// }

class schedule extends StatefulWidget {
  const schedule({super.key});

  @override
  State<schedule> createState() => _schedule();
}

class _schedule extends State<schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(192, 222, 220, 1),
// Set the background color to white
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
            'SCHEDULE',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color.fromRGBO(192, 222, 220, 1),
                padding: const EdgeInsets.all(16.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const topRow(),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            7,
                            (index) => dateWidget(
                                  index: index,
                                ))),
                  ),
                ]),
              ),
              const cardWidget(),
              const cardWidget(),
              const cardWidget(),
              const cardWidget(),
              const cardWidget(),
              const cardWidget(),
            ],
          ),
        ));
  }
}

class cardWidget extends StatelessWidget {
  const cardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "13: 00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              LineGen(
                lines: const [20.0, 30.0, 40.0, 10.0],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(192, 222, 220, 1),

                //color: Color(0xfffcf9f5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0))),
            child: Container(
              margin: const EdgeInsets.only(left: 4.0),
              color: const Color(0xfffcf9f5),
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 21.0,
                    child: Row(
                      children: [
                        Text("13:00 - 14:40"),
                        VerticalDivider(),
                        Text('Ankush Raje')
                      ],
                    ),
                  ),
                  Text(
                    'Mathematics',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class LineGen extends StatelessWidget {
  var lines;
  LineGen({
    super.key,
    this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            4,
            (index) => Container(
                  height: 2.0,
                  width: lines[index],
                  color: const Color(0xffd0d2d8),
                  margin: const EdgeInsets.symmetric(vertical: 14.0),
                )));
  }
}

class topRow extends StatelessWidget {
  const topRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Row(
          children: [
            Text(
              'Daily',
              style: TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'schedule',
              style: TextStyle(
                  fontFamily: 'Gothic_A1',
                  color: Color.fromARGB(255, 94, 108, 109),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Spacer(),
        Text('Jan',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class dateWidget extends StatefulWidget {
  final index;

  const dateWidget({super.key, this.index});
  @override
  State<dateWidget> createState() => _dateWidgetState();
}

class _dateWidgetState extends State<dateWidget> {
  bool _SelectDate = true;
  var list = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _SelectDate = !_SelectDate;
        });
      },
      child: Container(
        decoration: _SelectDate
            ? null
            : BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4.0),
              ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              list[widget.index],
              style: TextStyle(
                  fontWeight: _SelectDate ? FontWeight.bold : FontWeight.normal,
                  color: _SelectDate ? Colors.red : Colors.white),
            ),
            Text(
              "${10 + widget.index}",
              style: TextStyle(
                  fontWeight: _SelectDate ? FontWeight.bold : FontWeight.normal,
                  color: _SelectDate ? Colors.red : Colors.white),
            ),
            Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _SelectDate ? Colors.red : Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
