import 'package:flutter/material.dart';
import 'package:school_for_everyone/Notification.dart';
import 'package:school_for_everyone/Profile.dart';
import 'package:school_for_everyone/t_attendance.dart';

class t_home extends StatefulWidget {
  const t_home({super.key});

  @override
  State<t_home> createState() => _t_home();
}

class _t_home extends State<t_home> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const THomeScreen(),
    const t_Attendance(),
    const Chat(),
    const Profile()
    // Add other screens here
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
          labelTextStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
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
              selectedIcon: Icon(Icons.home_outlined, color: Colors.red),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today),
              selectedIcon:
                  Icon(Icons.calendar_today_outlined, color: Colors.red),
              label: 'Attendance',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat, color: Colors.red),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline_rounded),
              selectedIcon: Icon(Icons.person, color: Colors.red),
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

class THomeScreen extends StatelessWidget {
  const THomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 20),
              _buildAppBar(context),
              _buildProfileCard(context),
              _buildMainContent(context, constraints),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: const Color.fromARGB(255, 26, 22, 43),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notify');
            },
            icon:
                const Icon(Icons.notifications_none_sharp, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color.fromRGBO(194, 216, 227, 0.53),
        ),
        width: double.infinity,
        child: const Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Poonam patel',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Text(
                          'H.O.D',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 50),
                        Text(
                          '|',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 50),
                        Text(
                          'ID no: 2210',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Attendance',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: 0.822,
                            backgroundColor: Colors.white,
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.red),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '82.2%',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage('assets/images/teacher.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context, BoxConstraints constraints) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            ScrollableIcons(),
            const SizedBox(height: 20),
            _buildSectionHeader(context, "Today's Classes", '/schedule'),
            OverlappingContainers(),
            _buildSectionHeader(context, "Upcoming Events", '/events'),
            OverlappingContainers2(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, String route) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: const Text(
            "View All",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class ScrollableIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildIconButton(
              context,
              Icons.person_add_alt_1_outlined,
              'Attendance',
              '/attendance',
              const Color.fromRGBO(241, 238, 233, 1)),
          _buildIconButton(context, Icons.help_outline, 'Queries?', '/Doubt',
              const Color.fromRGBO(230, 222, 244, 0.93)),
          _buildIconButton(context, Icons.text_snippet_outlined, 'Results',
              '/Results', const Color.fromRGBO(192, 222, 220, 1)),
          _buildIconButton(context, Icons.calendar_today_outlined, 'Calendar',
              '/Calendar', const Color.fromRGBO(194, 216, 227, 1)),
          _buildIconButton(context, Icons.auto_stories_rounded, 'Syllabus',
              '/Syllabus', const Color.fromRGBO(241, 238, 233, 1)),
          _buildIconButton(context, Icons.perm_contact_cal_sharp, 'Faculties',
              '/Faculties', const Color.fromARGB(255, 216, 233, 219)),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, String label,
      String route, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          height: 85,
          width: 96,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 38.0, color: Colors.black),
              const SizedBox(height: 8.0),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OverlappingContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        children: [
          Positioned(
            left: 75,
            top: 5,
            child: ScheduleCard(
              subject: "Mathematics",
              time: "10:00 to 10:40",
              Class: "10 - B",
              imageUrl: "assets/images/english.png",
              color_: const Color.fromRGBO(192, 222, 220, 1),
            ),
          ),
          Positioned(
            left: 10,
            top: 0,
            right: 100,
            child: ScheduleCard(
              subject: "Mathematics",
              time: "10:00 to 10:40",
              Class: "10 - B",
              imageUrl: "assets/images/mathematics.png",
              color_: const Color.fromRGBO(216, 209, 231, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String subject;
  final String time;
  final String Class;
  final String imageUrl;
  final Color color_;

  const ScheduleCard({
    Key? key,
    required this.subject,
    required this.time,
    required this.Class,
    required this.imageUrl,
    required this.color_,
  }) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.center,
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
                    "Class – $Class",
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          EventCard(
            EventName: 'Technical Fest',
            imageUrl: "assets/images/fest.png",
          ),
          SizedBox(width: 10),
          EventCard(
            EventName: 'Sports Day celebration',
            imageUrl: "assets/images/sports.png",
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String EventName;
  final String imageUrl;

  const EventCard({
    super.key,
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
