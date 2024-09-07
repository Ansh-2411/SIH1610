import 'package:flutter/material.dart';
import 'package:school_for_everyone/Chat.dart';
import 'package:school_for_everyone/Fees.dart';
import 'package:school_for_everyone/Forgot_password_Screen.dart';
import 'package:school_for_everyone/Results.dart';
import 'package:school_for_everyone/attendance_screen.dart';
import 'package:school_for_everyone/s_Home_Screen.dart';
import 'package:school_for_everyone/signUpScreen.dart';
import 'package:school_for_everyone/t_home.dart';
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
//       },
//     );
//   }
// }

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreen();
}

class _MyLoginScreen extends State<MyLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(26, 22, 43, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 165, top: 100),
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Gothic_A1',
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200, right: 50),
              child: Container(
                height: 1.0,
                width: 190.0,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 200, top: 180),
              child: Text(
                'as',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Gothic_A1',
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 235),
              child: Container(
                height: 1.0,
                width: 200.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.pink,
                        child: Image.asset(
                          'assets/images/boy.png',
                          height: 180,
                          width: 180,
                          // color: Colors.yellow,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Student',
                        style: TextStyle(
                          fontFamily: 'Gothic_A1',
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 90),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const t_home()));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.pink,
                          child: Image.asset(
                            'assets/images/prof.png',
                            height: 200,
                            width: 200,
                            // color: Colors.brown,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Teacher',
                          style: TextStyle(
                            fontFamily: 'Gothic_A1',
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20), // Space between avatars and text fields
            Padding(
              padding: const EdgeInsets.only(top: 440),
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
                  // SizedBox(height: 20),
        
                  // SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 50.0, right: 50.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                  // SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/forgot');
                                  },
                                  child: const Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      fontFamily: 'Gothic_A1',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.25,
                                      color: Colors.red,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 20), // Space between text fields and button
                  SizedBox(
                    width: 100,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.red, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const S_Home(),
                            ));
                        // Handle sign-up action
                      },
                      child: const Text(
                        textAlign: TextAlign.center,
                        'LOGIN',
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
                        const TextSpan(text: "Didn't have an account. "),
                        WidgetSpan(
                            child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/SignUp');
                                },
                                child: const SizedBox(
                                  height: 20,
                                  child: Text(
                                    'Sign Up Here',
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
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicefor build methods.
    );
  }
}
