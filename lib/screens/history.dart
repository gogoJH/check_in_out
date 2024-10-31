import 'package:flutter/material.dart';
import '../helper/db_helper.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    List<Map<String, dynamic>> records = await DatabaseHelper().getRecords();
    setState(() {
      _history = records;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _history.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_history[index]['action']),
          subtitle: Text(_history[index]['timestamp']),
        );
      },
    );
  }
}
