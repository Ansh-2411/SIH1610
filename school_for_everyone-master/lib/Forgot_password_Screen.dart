import 'package:flutter/material.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Notifiy.dart';
import 'package:school_for_everyone/Results.dart';
import 'package:school_for_everyone/Syllabus.dart';
import 'package:school_for_everyone/attendance_screen.dart';
import 'package:school_for_everyone/loginScreen.dart';
import 'package:school_for_everyone/s_Home_Screen.dart';
import 'package:school_for_everyone/schedule.dart';
import 'package:school_for_everyone/signUpScreen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const ForgotPass(),
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

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPass();
}

class _ForgotPass extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(26, 22, 43, 1),
        body: Stack(children: [
          const Padding(
            padding: EdgeInsets.only(left: 85, top: 150),
            child: Text(
              'Forgot Password ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                fontFamily: 'Gothic_A1',
                color: Colors.white,
              ),
            ),
          ),

          // const SizedBox(height: 20), // Space between avatars and text fields
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                // Container(
                //   height: 1.0,
                //   width: 160.0,
                //   color: Colors.white,
                // ),

                const Text(
                  'OR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Gothic_A1',
                    color: Colors.white,
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(bottom: 50, left: 250),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     height: 1.0,
                //     width: 160.0,
                //     color: Colors.white,
                //   ),
                // ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0, right: 50.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Contact No',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ), // SizedBox(height: 20),

                    // SizedBox(height: 20),
                    const SizedBox(height: 20),

                    const SizedBox(
                        height: 20), // Space between text fields and button
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          side: const BorderSide(color: Colors.red, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.all(10),
                        ),
                        onPressed: () {
                          // Handle sign-up action
                        },
                        child: const Text(
                          textAlign: TextAlign.center,
                          'SEND CODE',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              fontFamily: 'Gothic_A1',
                              letterSpacing: 0.25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontFamily: 'Gothic_A1',
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.25,
                            color: Colors.white),
                        children: [
                          const TextSpan(text: "Back to "),
                          WidgetSpan(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/backLogin');
                                  },
                                  child: const SizedBox(
                                    height: 20,
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontFamily: 'Gothic_A1',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 0.25,
                                        color: Colors.red,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // This trailing comma makes auto-formatting nicefor build methods.
          )
        ]));
  }
}
