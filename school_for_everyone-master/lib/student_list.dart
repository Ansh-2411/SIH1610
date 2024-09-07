import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class student_list extends StatefulWidget {
  const student_list({super.key});

  @override
  State<student_list> createState() => _student_list();
}

class _student_list extends State<student_list> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Text(
              "Roll no",
              style: TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              "Name",
              style: TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 160,
            ),
            Text(
              "P",
              style: TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              "N",
              style: TextStyle(
                  fontFamily: 'Gothic_A1',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        // const s_attendList(rollno: '1', name: "vidhi")
      ],
    );
  }
}

class s_attendList extends StatefulWidget {
  final String rollno;
  final String name;
  bool isPresent;
  s_attendList(
      {super.key,
      required this.rollno,
      required this.name,
      this.isPresent = false});

  @override
  State<s_attendList> createState() => _s_attendListState();
}

class _s_attendListState extends State<s_attendList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListTile(
        leading: Text(widget.rollno),
        title: Text(widget.name),
        trailing: const radioPA(),
      ),
    );
  }
}

class radioPA extends StatefulWidget {
  const radioPA({super.key});

  @override
  State<radioPA> createState() => _radioPAState();
}

class _radioPAState extends State<radioPA> {
  bool _isElevated = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
              boxShadow: _isElevated
                  ? [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-3, -3),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ]
                  : null,
            ),
            child: Center(
              child: Icon(
                Icons.task_alt_sharp,
                color: _isElevated ? Colors.green : Colors.grey[300],
                weight: 3,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 5,
            width: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50),
              boxShadow: _isElevated
                  ? [
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1),
                    ]
                  : null,
            ),
            child: Center(
              child: Icon(
                Icons.task_alt_sharp,
                color: _isElevated ? Colors.red : Colors.grey[300],
                weight: 3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class Attendance {
//   final String rollNo;
//   final String name;
//   bool isPresent;

//   Attendance({
//     required this.rollNo,
//     required this.name,
//     this.isPresent = false,
//   });
// }


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AttendanceListScreen(),
//     );
//   }
// }
 
// class AttendanceListScreen extends StatefulWidget {
//   @override
//   _AttendanceListScreenState createState() => _AttendanceListScreenState();
// }

// class _AttendanceListScreenState extends State<AttendanceListScreen> {
//   List<Attendance> _attendanceList = [
//     Attendance(rollNo: '01', name: 'Vikas'),
//     // Add more entries as needed
//   ];

//   void _toggleAttendance(int index) {
//     setState(() {
//       _attendanceList[index].isPresent = !_attendanceList[index].isPresent;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Attendance List'),
//       ),
//       body: ListView.builder(
//         itemCount: _attendanceList.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//                 '${_attendanceList[index].rollNo} - ${_attendanceList[index].name}'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text('P'),
//                 Switch(
//                   value: _attendanceList[index].isPresent,
//                   onChanged: (value) {
//                     _toggleAttendance(index);
//                   },
//                 ),
//                 Text('A'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
