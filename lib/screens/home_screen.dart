import 'package:flutter/material.dart';
import 'package:http_testing/screens/holiday_screen.dart';
import 'package:http_testing/screens/news_screen.dart';
import 'package:http_testing/screens/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<String> titles = ['User','Holidays','News'];
  List screens = [
    const UserScreen(),
    const HolidayScreen(),
    const NewsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: screens[currentIndex],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: ((value) => setState(() {
              currentIndex = value;
            })),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.email_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_rounded),
            label: '',
          ),
        ],
      ),
    );
  }
}
