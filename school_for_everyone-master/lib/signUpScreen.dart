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


// void main()  {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const MySignUpScreen(),
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

class MySignUpScreen extends StatefulWidget {
  const MySignUpScreen({super.key});

  @override
  State<MySignUpScreen> createState() => _MySignUpScreen();
}

class _MySignUpScreen extends State<MySignUpScreen> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
//   var email = "", password = "", confirmPass = "";
//   var phone;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController confirmPassController = TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   registration() async {
//     if (password != "" && emailController.text != "") {
//       try {
//         FirebaseAuth auth = FirebaseAuth.instance;
//         UserCredential userCredential = await auth
//             .createUserWithEmailAndPassword(email: email, password: password);
//         auth.verifyPhoneNumber(
//             phoneNumber: phoneController.text,
//             verificationCompleted: (PhoneAuthCredential credential) {},
//             verificationFailed: (FirebaseAuthException e) {},
//             codeSent: (String verificationId, int? resendToken) async {
//               String smsCode = 'xxxx';
//               PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                   verificationId: verificationId, smsCode: smsCode);
//               await auth.signInWithCredential(credential);
//             },
//             timeout: const Duration(seconds: 60),
//             codeAutoRetrievalTimeout: (String verificationId) {});

//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(
//           "Registration successfull",
//           style: TextStyle(
//             fontSize: 20,
//           ),
//         )));
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => S_Home()));
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               backgroundColor: Colors.blueAccent,
//               content: Text(
//                 "Password provided is too weak",
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               )));
//         } else if (e.code == "email-already-in-use") {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               backgroundColor: Colors.orange,
//               content: const Text(
//                 "Account Already exists",
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               )));
//         } else if (e.code == "invalid-phone-number") {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               backgroundColor: Colors.orange,
//               content: const Text(
//                 "The provided phone number is not valid",
//                 style: TextStyle(
//                   fontSize: 18,
//                 ),
//               )));
    //     }
    //   }
     }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: const Color.fromARGB(1, 26, 22, 43),
          body: SingleChildScrollView(
            child: Stack(children: [
              const Padding(
                padding: EdgeInsets.only(left: 155, top: 100),
                child: Text(
                  'Sign Up',
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
                    Column(
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
                  ],
                ),
              ),
              // const SizedBox(height: 20), // Space between avatars and text fields
              Padding(
                padding: const EdgeInsets.only(top: 440),
                child: Form(
                  // key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          // controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 50.0, right: 50.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Phone number';
                            }
                            return null;
                          },
                          // controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Contact No',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 50.0, right: 50.0),
                        child: TextFormField(
                          // controller: passController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 50.0, right: 50.0),
                        child: TextFormField(
                          // controller: confirmPassController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Confirm Password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                          height: 20), // Space between text fields and button
                      GestureDetector(
                        onTap: () {
                          // if (_formkey.currentState!.validate()) {
                          //   setState(
                          //     () {
                          //       email = emailController.text;
                          //       phone = phoneController.text;
                          //       password = passController.text;
                          //       confirmPass = confirmPassController.text;
                          //     },
                          //   );
                          // }
                          // registration();
                        },
                        child: SizedBox(
                          width: 100,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              side:
                                  const BorderSide(color: Colors.red, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                            ),
                            onPressed: () {
                              // Handle sign-up action
                            },
                            child: const Text(
                              textAlign: TextAlign.center,
                              'SIGN UP',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  fontFamily: 'Gothic_A1',
                                  letterSpacing: 0.25),
                            ),
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
                            const TextSpan(text: 'Already have an account. '),
                            WidgetSpan(
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: const SizedBox(
                                      height: 20,
                                      child: Text(
                                        'Login Here',
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
              ),
            ]),
            // This trailing comma makes auto-formatting nicefor build methods.
          ));
    }
  // }
