import 'package:flutter/material.dart';
import 'screens/check_in.dart';
import 'screens/check_out.dart';
import 'screens/history.dart';
import 'widgets/check_in_out_state.dart';

void main() {
  runApp(const CheckInOutApp());
}

class CheckInOutApp extends StatelessWidget {
  const CheckInOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check In/Out App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckInOutState(
        child: HomeScreen(), // 홈 스크린으로 시작
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> _history = [];

  List<Widget> _getPages() {
    final state = CheckInOutState.of(context);
    return [
      CheckIn((action) {
        _history.add(action);
        state?.checkIn();
      }, state?.isCheckedIn ?? false),
      CheckOut((action) {
        _history.add(action);
        state?.checkOut();
      }, state?.isCheckedIn ?? false),
      HistoryPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('체크인/체크아웃 앱'),
      ),
      body: _getPages()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: '체크인',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: '체크아웃',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '이력',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
