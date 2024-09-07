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
import 'package:school_for_everyone/schedule.dart';
import 'package:school_for_everyone/signUpScreen.dart';
import 'package:school_for_everyone/t_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const S_Home(),
        '/forgot': (context) => const ForgotPass(),
        '/SignUp': (context) => const MySignUpScreen(),
        '/login': (context) => const MyLoginScreen(),
        '/backLogin': (context) => const MyLoginScreen(),
        '/Attendance': (context) => const Attendance(),
        '/Doubt': (context) => const Chat(),
        '/backhome': (context) => const S_Home(),
        '/Fees': (context) => const Fees(),
        '/Results': (context) => const Results(),
        '/Syllabus': (context) => const syllabus(),
        '/schedule': (context) => const schedule(),
        '/notify': (context) => const notification()
      },
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return const Scaffold(
//       backgroundColor: const Color.fromARGB(1, 26, 22, 43),
//       body: Column(children: [
//         Text("SCHOOL FOR EVERYONE",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//             )),
        // const Padding(
        //   padding: EdgeInsets.only(left: 155, top: 100),
        //   child: Text(
        //     'Sign Up',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       fontSize: 32,
        //       fontWeight: FontWeight.w400,
        //       fontFamily: 'Gothic_A1',
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 200, right: 50),
        //   child: Container(
        //     height: 1.0,
        //     width: 190.0,
        //     color: Colors.white,
        //   ),
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(left: 200, top: 180),
        //   child: Text(
        //     'as',
        //     textAlign: TextAlign.center,
        //     style: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.w400,
        //       fontFamily: 'Gothic_A1',
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 200, left: 235),
        //   child: Container(
        //     height: 1.0,
        //     width: 200.0,
        //     color: Colors.white,
        //   ),
        // ),
      // ])

      // Earth Element (Tap to Navigate)
      //   Positioned(
      //     top: MediaQuery.of(context).size.height / 2 - 10,
      //     left: MediaQuery.of(context).size.width / 2 - 170.5,
      //     child: Builder(
      //       builder: (context) {
      //         return InkWell(
      //           onTap: () {
      //             Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => const Earth()),
      //             );
      //           },
      //           child: const EarthWidget(),
      //         );
      //       },
      //     ),
      //   ),
      //   // Air Element
      //   Positioned(
      //     top: MediaQuery.of(context).size.height / 2 - 10,
      //     right: MediaQuery.of(context).size.width / 2 - 170.5,
      //     child: InkWell(
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => const Air()));
      //         },
      //         child: const AirWidget()),
      //   ),
      //   // Ether Element
      //   Positioned(
      //     bottom: MediaQuery.of(context).size.height / 2 - 265,
      //     right: MediaQuery.of(context).size.width / 2 - 65.5,
      //     child: InkWell(
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => const Ether()));
      //         },
      //         child: EtherWidget()),
      //   ),
      //   // Water Element
      //   Positioned(
      //     bottom: MediaQuery.of(context).size.height / 2 - 420,
      //     right: MediaQuery.of(context).size.width / 2 - 170.5,
      //     child: InkWell(
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => const Water()));
      //         },
      //         child: const WaterWidget()),
      //   ),
      //   // Fire Element
      //   Positioned(
      //     bottom: MediaQuery.of(context).size.height / 2 - 420,
      //     left: MediaQuery.of(context).size.width / 2 - 170.5,
      //     child: InkWell(
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => const Fire()));
      //         },
      //         child: FireWidget()),
      //   ),

//       );
// }
// }

// Widget buildIconContainer(ImageProvider iconImage) {
//   return Container(
//     height: 112,
//     width: 121,
//     decoration: BoxDecoration(
//         color: const Color.fromRGBO(208, 218, 223, 100),
//         borderRadius: BorderRadius.circular(18.0)),
//     child: SizedBox(
//       height: 78.75,
//       width: 76.69,
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: CircleAvatar(
//           radius: 76.0,
//           backgroundColor: Colors.transparent,
//           backgroundImage: iconImage,
//         ),
//       ),
//     ),
//   );
// }
