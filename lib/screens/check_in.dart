import 'package:flutter/material.dart';
import '../helper/db_helper.dart';

class CheckIn extends StatelessWidget {
  final Function(String) onCheckIn;
  final bool isCheckedIn;

  const CheckIn(this.onCheckIn, this.isCheckedIn, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCheckedIn ? Colors.grey : Colors.green,
          boxShadow: [
            BoxShadow(
              color: isCheckedIn
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.greenAccent.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: TextButton(
          onPressed: () async {
            String action = '체크인 완료';
            await DatabaseHelper().insertRecord(action);
            onCheckIn(action);
          },
          style: TextButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: isCheckedIn ? Colors.grey : Colors.green,
            padding: EdgeInsets.all(20),
          ),
          child: Text(
            isCheckedIn ? '체크인 중...' : '체크인',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
